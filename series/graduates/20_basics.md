---
title: 'Basic IO'
layout: series_item
series: 'graduates'
permalink: /graduates/basic_io/
estimated-time: 60
---

{% hlblock help %}
You can play with the result of this tutorial in [JSBin](http://jsbin.com/votoce/2/edit?js,console)
{% endhlblock %}

1) Our input data
-----------------

We will parse the list of everyone who completed this tutorial. 
This file is available as [`github repo`](https://github.com/biojs-edu/tutorial-graduates/blob/master/list) and you can add yourself to the list afterwards ;-)


The file is structured as follows:

~~~
alias:country
~~~

~~~
greenify:DE
daviddao:HK
mhelvens:NL
timruffles:UK
iriscshih:TW
~~~

The alias can be a unique alphanumerical string, whereas the country code is a
string consisting of exactly two chars as defined by [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2).

2) Bootstrapping the project
----------------------------

{% alert warn %}
We assume that you have successfully [bootstrapped]({{sitebaseurl}}/101/bootstrapping) a new BioJS package.
{% endalert %}

We have selected this options:

~~~
? Module name? (required) biojs-io-graduates
? Description? A parser for the BioJS tutorial graduate list 
? Module version? 0.1.0
? Author name? greenify
? Author email? greeenify@gmail.com
? Github username? greenify
? Keywords for npm (separate with comma) graduate, parser
? A visualization lib? No
? Unit tests: Yes
? Configure a build system? (Gulp) No
? Linting (Check code style with JSHint) No
? Choose your license type: MIT
? Is this correct? Yes
~~~

`slush` already prefills some files and creates a dummy test. When we later state
files you will need to replace them.

3) Export your component
------------------------

Now it is time to export your component in order to provide your functionality with the other BioJS components or in your module (e.g your first test case).
We use [CommonJS Syntax](http://wiki.commonjs.org/wiki/Modules/1.1) to export modules in BioJS.

We can export the parser in the following way:

(`lib/index.js`)

~~~
var graduates = {};

graduates.read_static = function() {
  var data = "greenify:DE\ndaviddao:HK\nmhelvens:NL\ntimruffles:UK\niriscshih:TW\n\n";
  return graduates.parse(data);
};

graduates.parse = function(data) {
  // you need to fill this
  return {};
};

module.exports = graduates;
~~~

(replace the entire file with the code above)

4) How to run node code?
----------------

We can `require` our exported package from any file - so let us create a temporary
test file to show this.

(`lib/tests.js`)

~~~
var graduates = require('./index');
var result = graduates.parse("greenify:DE"\ndaviddao:HK");
console.log(result);
~~~

You can run your application directly with Node, like this:

~~~
node test.js
~~~

As we haven't done any work, our package currently returns `{}`,
but of course it should return `{"DE": 1, "HL: 1}`.


Other BioJS components are now able to include your component by using

~~~
var graduates = require('biojs-io-graduates');
graduates.parse("greenify:DE\ndaviddao:HK");
// should return {"DE": 1, "HL: 1}
~~~

We don't need the file `tests.js` for our further development as we will use
real unit tests.

{% hlblock info %}
If the path is relative like a `./lib/index.js`, you `require` local files.
{% endhlblock %}

{% hlblock info %}
There is an [excellent guide](https://github.com/maxogden/art-of-node#how-require-works) on how the `require` command works under the hood.
{% endhlblock %}


5) The first testcase
----------------------

Please add this very simple test to your component.

`test/simple.js`

~~~
var assert = require("chai").assert;
var tutorial = require("../");

describe('Graduates', function(){
  describe('parse', function(){
    it('should return match with default object', function(){
      var dummyObj = {DE: 1, HK: 1, NL: 1, UK: 1, TW: 1};
      assert.deepEqual(tutorial.read_static(), dummyObj);
    });
  });
});
~~~

Please remove the prefilled test file `test/test_graduates.js`.

You can execute your first test with:

~~~
npm test
~~~

It is really ok if you see errors - you will fix them later ;-)
So as long as you see something similar to following output, you can safely continue.

~~~
  Graduates
    parse
      1) should return match with default object


  0 passing (9ms)
  1 failing

  1) Graduates parse should return match with default object:

      AssertionError: expected {} to deeply equal { DE: 1, HK: 1, NL: 1, UK: 1, TW: 1 }
      + expected - actual

      +{
      +  "DE": 1
      +  "HK": 1
      +  "NL": 1
      +  "TW": 1
      +  "UK": 1
      +}
      -{}
      
      at Function.assert.deepEqual (/home/greenify/biojs/packages/biojs-io-graduates/node_modules/chai/lib/chai/interface/assert.js:205:32)
      at Context.<anonymous> (/home/greenify/biojs/packages/biojs-io-graduates/test/test_graduates.js:14:14)
      at callFn (/home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runnable.js:250:21)
      at Test.Runnable.run (/home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runnable.js:243:7)
      at Runner.runTest (/home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runner.js:373:10)
      at /home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runner.js:451:12
      at next (/home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runner.js:298:14)
      at /home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runner.js:308:7
      at next (/home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runner.js:246:23)
      at Immediate._onImmediate (/home/greenify/biojs/packages/biojs-io-graduates/node_modules/mocha/lib/runner.js:275:5)
      at processImmediate [as _immediateCallback] (timers.js:358:17)



npm ERR! Test failed.  See above for more details.
~~~

{% hlblock info %}
In this tutorial we use [Mocha](https://visionmedia.github.io/mocha/) as JavaScript test framework.
However you can use your favorite - you only need to change the `test` command in the `scripts` section of your `package.json`.
{% endhlblock %}

{% hlblock help %}
If you are super lazy, you can install `mocha` globally with `npm install -g mocha` and then run `mocha` as a single command.
There is even `mocha --watch` that automatically reruns all tests on a file change.
{% endhlblock %}


6) Your first, big task
---------------------

{% hlblock help %}
If you are new JavaScript or have not coded for a while, you might want to have a look at this [cheatsheet](http://overapi.com/javascript/).
{% endhlblock %}


{% hlblock task %}
Please fill in the missing code inside the `graduate.parse()` function.
Every alias has a country and we are interested in the distribution, so aliases per country.
{% endhlblock %}

If you look closer at the unit test, you see that the valid solution for our static example is:

~~~
{DE: 1, HK: 1, NL: 1, UK: 1, TW: 1};
~~~

You can either rerun the tests with `npm test` or use `mocha --watch` if you installed mocha.

7) Verify your solution
----------------

{% hlblock stop %}

No please do __NOT__ have a look at our solution, if your unit test is green -
your solution is correct!
Please only continue if your solution is working.

{% endhlblock %}

__Solution:__

{% code javascript collapsible=true %}
graduates.parse = function(data) {
  // count countries
  var parsed = {};
  for (var i = 0; i < data.length; i++) {
    // skip empty rows
    if (data[i].trim().length === 0) {
      continue;
    }
    var row = data[i].split(":");
    // init if new
    if (typeof parsed[row[1]] === "undefined") {
      parsed[row[1]] = 0;
    }
    parsed[row[1]] ++;
  }
  return parsed;
};


{% endcode %}

And of course this is also possible as short "one-liner".

{% code javascript collapsible=true %}
var _ = require("lodash"); // you need to install lodash (npm install lodash --save)
graduates.parse = function(data) {
	return _(data).map(function(e){return e.split(":")[1]}).countBy().value();
}
{% endcode %}

Congratulations! You wrote your very first Biojs 2 Component. 

{% hlblock info %}
You can find the complete solution of this package on [github](https://github.com/biojs-edu/biojs-io-graduates) and [npm](https://www.npmjs.org/package/biojs-io-graduates).
{% endhlblock %}

8) Add yourself to the graduate list
------------------------------------

You worked hard - now it is time to acknowledgment.
Please pick a fancy alias, lookup your [country alpha-2 code](https://en.wikipedia.org/wiki/ISO_3166-2) and add yourself to the [graduate list](https://github.com/biojs-edu/tutorial-graduates/blob/master/list)

{% hlblock info %}
If you are unfamiliar with git, check out the [Git guide](https://rogerdudler.github.io/git-guide/) or [15 minutes interactive lesson](https://try.github.io/levels/1/challenges/1) by Codeschool.
{% endhlblock %}

{% hlblock help %}
If you can't think of a fancy alias, pick either your github username of let [software](http://www.spinxo.com) help you ;-)
{% endhlblock %}
