---
title: 'Parser: using real data'
layout: tutorial-container
contributors: Seb
category: 101_tutorial
series: 101
estimated-time: 30 
---

{% alert warn %}
Please create the [basic package](./30_package_basics.html) before.
Alternatively you can clone the [solution of the last exercise](https://github.com/biojs/biojs-io-snipspector/tree/basic_packaging).
{% endalert %}

{% hlblock help %} 
[Here](http://jsbin.com/hiyijagawete/2/edit) is the result of this example - parsing the 15MB file with 500,000 lines in your browser.
{% endhlblock %}

{% jsbin hiyijagawete/2 js,console %}

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
request('https://raw.githubusercontent.com/biojs/biojs-io-snipspector/master/test/test.file', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Prints the reponse body
  }
})
~~~

{% hlblock info %}
`manny.dummy` only contains the first 50 lines. We will use the whole file with 500.000 lines later in this tutorial.
{% endhlblock  %}

{% hlblock info %}
[`nets`](https://github.com/maxogden/nets) is a meta-wrapper for the [request](https://github.com/mikeal/request) package, which switches to [xhr](https://github.com/Raynos/xhr) when it gets "browserified".
{% endhlblock  %}

{% hlblock task %}
1. Install the `nets` package
2. Create a sample file (e.g. `foo.js`)
3. Download `https://raw.githubusercontent.com/biojs/biojs-io-snipspector/master/test/test.file` and print it to the screen
{% endhlblock  %}

{% hlblock help %}
Run a file: `node foo.js`
{% endhlblock  %}

{% hlblock stop %}
__Solution__
{% endhlblock %}

{% code javascript collapsible=true %}
var request = require("nets");
request('https://raw.githubusercontent.com/biojs/biojs-io-snipspector/master/test/test.file', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Prints the reponse body
  }
})
{% endcode %}

### 3) Download the real data

~~~
snipspector.read = function(url, callback) {
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

{% hlblock help %}
You can need to remove the static `data` object in the parse method.
Put this data into your unit test.
{% endhlblock  %}

{% hlblock stop %}
__Solution__ - if you have troubles: write the unit test first, before you look at this solution.
{% endhlblock %}

`src/index.js`

{% code javascript collapsible=true %}
var request = require("nets");

var snipspector = {};

snipspector.read = function(url, callback) {
  request(url, function (error, response, body) {
    if (!error && response.statusCode == 200) {
      callback(snipspector.parse(body));
    }
  })
}

snipspector.parse = function(data) {

    if(data.indexOf('\n') >= 0 ){
      data = data.split('\n');
    }
    
   var chromosomes = [];

    // analyze snippets
    // homo(zygous): AA
    // hetero(zygous): AC
    // del(etion): A-, -A or --
    
    var chr = null;
    for (var i = 0; i < data.length; i++) {

      // ignore empty rows or comments
      if(data[i].length == 0 || data[i][0] === "#"){
        continue;
      }

      var row = data[i].split(/\s+/);
      var chrName = row[1];

      // new chromosome begins
      if( chr == null ||  chrName !== chr.name) {
        // ignore the first time
        if( chr != null ){
          chromosomes.push(chr);
        }
        chr = {homo: 0, hetero: 0, del: 0};
        chr.name = chrName;
      }

      var genotype = row[3];
      if( genotype.length == 2){
        // ignore MT
        if(genotype[0] == genotype[1] && genotype[0] != "-"){
          // homo
          chr.homo = chr.homo + 1;  
        } else if( genotype[0] !== "-" && genotype[1] !== "-"){
          // hetero
          chr.hetero = chr.hetero + 1;  
        }else{
          // del
          chr.del = chr.del + 1;  
        }
      }
    }
    // push the last item
    chromosomes.push(chr);

    return chromosomes;
}

//Should print [{name: "20", homo: 2, hetero: 1, del: 0,
// {name: "21", homo: 1, hetero: 1, del: 1}, 
// {name: "22", homo 1, hetero: 1, del: 0 }]


module.exports = snipspector; // Export the object for other components
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
.replyWithFile(200, __dirname + '/test.file');
~~~

{% hlblock info %}
`__dirname` is the current directory of an script (here: `test`).
{% endhlblock  %}

Now you only need to create the dummy file with which Nock should reply.

`test/test.file`

~~~
rs5747620	20	15412698	TT
rs9605903	20	15434720	CC
rs2236639	20	15452483	GC
rs5747999	21	15455353	AA
rs11089263	21	15467656	A-
rs2096537	21	15474749	AC
rs9604959	22	15479107	CG
rs9604967	22	15492342	CC
~~~
(this is the same file from [the package basics tutorial](./30_package_basics.html)

For the beginning we use a small file for testing, so it is easier to debug.

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
Write a second unit test that calls our mocked URL and test whether `snipspector.read(<url>, <callback>)` works.
{% endhlblock  %}


### 5) Solution

{% hlblock stop %}

no please do __not__ have a look at our solution, if your unit test is green - 
your solution is correct!

{% endhlblock %}


`test/simple.js`

{% code javascript collapsible=true %}
var assert = require("chai").assert;
var snip = require("../");

// you can find more docu about mocha here
// https://visionmedia.github.io/mocha/

var nock = require('nock')
var testURL = 'http://an.url/'

var scope = nock(testURL)
  .get('/list')
  .replyWithFile(200, __dirname + '/test.file');

  var dummyObj = [{name: "20", homo: 2, hetero: 1, del: 0},
{name: "21", homo: 1, hetero: 1, del: 1}, 
{name: "22", homo: 1, hetero: 1, del: 0 }];

describe('Snipspector', function(){
  // do any init stuff here
  beforeEach(function(){
  });
  describe('parse', function(){
    it('should return match with default object', function(){
      var data = ["rs5747620	20	15412698	TT",
      "rs9605903	20	15434720	CC",
      "rs2236639	20	15452483	GC",
      "rs5747999	21	15455353	AA",
      "rs11089263	21	15467656	A-",
      "rs2096537	21	15474749	AC",
      "rs9604959	22	15479107	CG",
      "rs9604967	22	15492342	CC"];
      assert.deepEqual(snip.parse(data), dummyObj);
    });
  });
  it('should work with live data', function(done){
    snip.read(testURL + "list", function(parsed){
      // the dummy file contains exactly this obj
      assert.deepEqual(parsed, dummyObj);
      done(); // you need to call the done callback to resume mocha
    });
  });
});
{% endcode %}
  
<br>
  
{% hlblock info %}
You can find the complete solution of this package on [github](https://github.com/biojs/biojs-io-snipspector) and [npm](https://www.npmjs.org/package/biojs-io-snipspector).
{% endhlblock %}
