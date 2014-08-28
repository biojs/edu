---
title: 'Working with real data'
layout: tutorial-container
author: Seb
category: 101_tutorial
series: 101
estimated-time: 30 
---

{% alert warn %}
Please create [basic package](./02_package_basics.md) before.
{% endalert %}

### 1) Installing a npm dependency

As we want to download data, we need a `request` package.
In `npm` this is very easy, just run.

~~~
npm install nets --save
~~~

{% hlblock question %}
What does `--save` mean? [Help](https://www.npmjs.org/doc/cli/npm-install.html)
{% endhlblock  %}


### 2) Require a dependency

~~~
var request = require("nets");
~~~

A sample request might look like this.

~~~
request('graduates.biojs.net/list', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Prints the reponse body
  }
})
~~~

{% hlblock info %}
[`nets`](https://github.com/maxogden/nets) is a meta-wrapper for the [request](https://github.com/mikeal/request) package, which switches to [xhr](https://github.com/Raynos/xhr) when it gets "browserified".
{% endhlblock  %}

{% hlblock task %}
1. Install the `nets` package
2. Create a sample file (e.g. `foo.js`)
3. Download `graduates.biojs.net/list` and print it to the screen
{% endhlblock  %}

{% hlblock help %}
Run a file: `node foo.js`
{% endhlblock  %}

{% hlblock stop %}
__Solution__
{% endhlblock %}

{% code javascript collapsible=true %}
var request = require("nets");
request('graduates.biojs.net/list', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Prints the reponse body
  }
})
{% endcode %}

### 3) Download the real data

~~~
graduates.read = function(url, callback) {
 // TODO
}
~~~


{% hlblock task %}
Create the `read` method in the graduate object which takes a `url` and a `callback` as input
and calls the callback with the parsed data.
{% endhlblock  %}

{% hlblock info %}
Using callbacks is just one of multiple ways (but probably the easiest to understand).
Another very popular one is to use [promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).
{% endhlblock  %}

{% hlblock stop %}
__Solution__ - if you have troubles: write the unit test first, before you look at this solution.
{% endhlblock %}

`src/index.js`

{% code javascript collapsible=true %}
var request = require("nets");
var graduates = {};

graduates.read = function(url, callback) {
  request(url, function (error, response, body) {
    if (!error && response.statusCode == 200) {
      var data = body.split("\n");
      console.log(data);
      callback(graduates.parse(data));
    }
  })
}

graduates.read_static = function(){
  var data = ["greenify:DE","daviddao:HK","mhelvens:NL","timruffles:UK","iriscshih:TW"];
  return graduates.parse(data);
}

graduates.parse = function(data) {
    var parsed = {};
    // count countries
    for (var i = 0; i < data.length; i++) {
        if(data[i].trim().length === 0){
          continue;
        }
        var row = data[i].split(":"); 
        // init if new
        if (parsed[row[1]] === undefined) {
            parsed[row[1]] = 0;
        }
        parsed[row[1]]++;
    }
    return parsed;
}

module.exports = graduates; // Export the object for other components
{% endcode %}



### 4) Test with live data (mocking)


#### 4.1) Mocking the backend

~~~
npm install nock --save-dev
~~~

{% hlblock question %}
Why did we use `--save-dev`?
{% endhlblock  %}

[Nock][nock] allows us to mock a backend, in this example `http://an.url/list`
All you need to do is to add this block before your mocha tests run
(i.e. before the `describe` method).

[nock]: https://github.com/pgte/nock


~~~
var nock = require('nock')
var testURL = 'http://an.url/'
var scope = nock(testURL)
.get('/list')
.replyWithFile(200, __dirname + '/dummy.list');
~~~

{% hlblock info %}
`__dirname` is the current directory of an script (here: `test`).
{% endhlblock  %}

Now you only need to create the dummy file with which Nock should reply.

`test/dummy.list`

~~~
greenify:DE
daviddao:HK
mhelvens:NL
timruffles:UK
iriscshih:TW
~~~

If you are lazy, run this

~~~
curl graduates.biojs.net/dummy.list -o test/dummy.list
~~~

#### 4.2) Asynchronous testing

Now before you write your second unit test, there is a small thing to which you should pay attention.
`XHR` requests are `asynchronous`, that means you have to stop the test suite and wait until you have received the request.

In Mocha this is incredible easy.

~~~
it('should work with live data', function(done){

done(); // call the mocha callback and resume the test suite
});
~~~

{% hlblock info %}
Passing an argument to an Mocha test will automatically let the test suite run your test asynchronously - the argument is your callback.
[More info](https://visionmedia.github.io/mocha/#asynchronous-code).
{% endhlblock  %}

{% hlblock task %}
Write a second unit test that calls our mocked URL and test whether `graduates.read(<url>, <callback>)` works.
{% endhlblock  %}


### 5) Solution

{% hlblock stop %}

no please do __not__ have a look at our solution, if your unit test is green - 
your solution is correct!

{% endhlblock %}


`test/simple.js`

{% code javascript collapsible=true %}
var assert = require("chai").assert;
var tutorial = require("../");

// you can find more docu about mocha here
// https://visionmedia.github.io/mocha/

var nock = require('nock')

var testURL = 'http://an.url/'

var scope = nock(testURL)
.get('/list')
.replyWithFile(200, __dirname + '/dummy.list');


describe('Graduates', function(){
  // do any init stuff here
  beforeEach(function(){
  });
  describe('parse', function(){
    it('should return match with default object', function(){
      dummyObj = {DE: 1, HK: 1, NL: 1, UK: 1, TW: 1};
      assert.deepEqual(tutorial.read_static(), dummyObj);
    });
  });
  it('should work with live data', function(done){
    tutorial.read(testURL + "list", function(parsed){
        // the dummy file contains exactly this obj
        dummyObj = {DE: 1, HK: 1, NL: 1, UK: 1, TW: 1};
        assert.deepEqual(parsed, dummyObj);
        done(); // you need to call the done callback to resume mocha
    });
  });
});
{% endcode %}
