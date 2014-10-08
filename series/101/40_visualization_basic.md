---
title: 'Visualization: basics'
layout: tutorial-container
contributors: David, Seb
category: 101_tutorial
series: 101
estimated-time: 15
---

1) Create a new package
-----------------------

Go one directory up (`cd ..`) and create a new project `biojs-vis-snipspector`.

~~~
slush biojs
~~~


2) Installing the parser as dependency
--------------------------------------

In `npm` this is very easy, just run.

~~~
npm install biojs-io-snipspector --save
~~~

{% hlblock question %}
What does `--save` mean? [Help](https://www.npmjs.org/doc/cli/npm-install.html)
{% endhlblock  %}

To get our parsed data, please have a look at the previous [tutorial](/series/101/50_real_parser.html) with real data.

~~~
parser.read("http://files.biojs.net/chromosomes/manny", function(result){
  var genome = result;
})
~~~

3) Installing the parser as dependency
--------------------------------------

We require the parser from the previous tutorial.

`src/index.js`

~~~
var parser = require("biojs-io-snipspector");
var vis = function(opts){
  var divEl = opts.el;
  var self = this; // save reference to itself (in callbacks this is different)
  var el = divEl;
  parser.read("http://files.biojs.net/chromosomes/manny.dummy", function(result){
    console.log(result);
    divEl = document.createElement("div")
		document.body.appendChild(divEl)
    divEl.textContent = Object.keys(result).length + " chromosome(s) found.";
  })
};
module.exports = vis;
~~~

{% hlblock help %}
There is a JavaScript development enviroment in the browser which supports `require`.

* Open [`requirebin.com`](http://requirebin.com)
* Paste the 11 lines
* Add (as a new line) on the bottom `vis()`
* Hit __Rebuild__

{% endhlblock %}


4) Build a browserified version
--------------------------------

We recommend browserify. It is preinstalled, just run

~~~
npm run build
~~~

This will bundle all your dependencies and build the file `build/<your-name>.js`.

{% hlblock help %}
If you are lazy, you can use `watchify` to recompile on every file change.  
~~~
npm run watch
~~~
{% endhlblock %}

{% hlblock help %}
If you are lazy, you can use install gulp (the build tool) globally `npm install -g gulp` and then type even less
~~~
gulp build
gulp watch
~~~
{% endhlblock %}

5) See the first output
------------------------

`snippets/simple_example.js`

~~~
var app = require("<your package name>");
app({el: yourDiv});
~~~

~~~
npm run sniper
~~~

Now browse to [`localhost:9090/snippets/`](http://localhost:9090/snippets).

### b) Plain, old html (alternative way)

You only need to create a very simple HTML file to call your visualization module.

`simple.html`

~~~
<div id=simple></div>
<script src="build/biojs-template.js"></script>
<script>
var app = require("<your package name>");
app.template();
</script>
~~~

{% alert warn %}
Don't forget to run it on a server! Otherwise Manny's chromosome data is not loaded.
{% endalert %}

{% hlblock info %}
You can run a local server easily  
Install: `sudo npm install -g http-server`  
Run: `http-server` (in the package root dir)
Address: [`localhost:8080`](http://localhost:8080)
{% endhlblock %}

6) Extend the visualization
---------------------------

{% alert warn %}
(in work)
{% endalert %}


7) Verify your solution
---------------------

The final program looks like this:

{% code javascript collapsible=true %}
in work
{% endcode %}
  
  <!-- do not remove this empty line -->   
