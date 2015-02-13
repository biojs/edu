---
title: 'Visualization: basics'
layout: series_item
contributors: David, Seb
series: 'snipspector'
estimated-time: 15
---

1) Create a new package
-----------------------

Go one directory up (`cd ..`) and create a new project `biojs-vis-snipspector`.
Now we want to create a visualization component, so please answer `yes` to the generator. 

~~~
slush biojs
~~~

This tutorial is aimed to get you used to your development workflow,
therefore we will avoid to use third-party visualization libraries and
we will only use the standard DOM API and native JavaScript functions to create a basic [visualization][demo].
In the advanced tutorial you will learn how to represent this data by using fancy D3 Charts.

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

File: `lib/index.js`

~~~
var parser = require("biojs-io-snipspector");
var vis = function(opts){
  var divEl = opts.el;
  var self = this; // save reference to itself (in callbacks this is different)
  parser.read("http://files.biojs.net/chromosomes/manny.dummy", function(result){
    console.log(result);
    var resText = document.createElement("div")
    resText.textContent = Object.keys(result).length + " chromosome(s) found.";
	opts.el.appendChild(resText)
  })
};
module.exports = vis;
~~~

{% hlblock help %}
There is a JavaScript development enviroment in the browser which supports `require`.

* Open [`requirebin.com`](http://requirebin.com)
* Paste the 11 lines
* Remove the last line `module.exports = vis` (`module` is not defined in RequireBin)
* Add (as a new line) on the bottom `vis({el: document.body})`
* Hit __Rebuild__

{% endhlblock %}


4) Build a browserified version
--------------------------------

We recommend `browserify`. It is preinstalled, just run

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

5) See the first output
------------------------

File: `examples/simple.js`

~~~
var app = require("<your package name>");
app({el: yourDiv});
~~~

{% hlblock info %}
`sniper` is a local file server that generates a HTML file on the file.
Furthermore it automatically generates a div container and gives you access to it
via `yourDiv`.

* You can always also define your own HTML in `<same-filename>.html` (e.g. `examples/simple.html`).
(You only need to put DOM elements into this HTML file - there is no need for `html`, `head` or `body`).
* If you have a special example snippet that requires more dependencies you can create a `<same-filename.json` (e.g. `examples/simple.json`).
and extend the sniper configuration from your `package.json` just for this snippet. Nearly all attributes are supported (e.g. `js` or `css`).
{% endhlblock %}

You can now run `sniper` - a simple file server that builds the snippets on the file and hence simulates the BioJS registry.

~~~
npm run sniper
~~~

Now browse to [`localhost:9090/examples/`](http://localhost:9090/examples).

{% hlblock help %}

If you are lazy, you can use `prunner` for your subsequent development.

~~~
npm run w
~~~

(this will run `npm run watch` and `npm run sniper` in one shell)
{% endhlblock %}


### b) Plain, old html (alternative way)

You only need to create a very simple HTML file to call your visualization module.

{% alert warn %}
You don't need to create any `html` file when you use the BioJS sniper.
So if you like the sniper - you can skip this subsection.
{% endalert %}

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

### a) Calculate a relative percentage per chromosome

We are going to use a utility library called [underscore](http://underscorejs.org/).
There you need to `require` the library in your program (at the top).

~~~
var _ = require("underscore");
~~~

To save this dependency add `underscore` to your `package.json`

~~~
npm install underscore --save
~~~

Now we can calculate the total SNPs of a chromosome in a functional way.

~~~
// count the elements in this chromosome
var total = _.reduce(result[i], function(memo,el,key){
if(key != "name")
	return memo + el
else return memo
});
~~~

Of course you could just write a normal loop and avoid using underscore.

### b) Drawing in JavaScript

We can use `svg`.

~~~
// @param [int] percentage relative amount of SNPs in the chromosome
// @returns [DOM] svg dom node with a rectangular bar
function createBar(percentage){
	var svgNS = "http://www.w3.org/2000/svg";  
	var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
	svg.style.height = "10px";
	svg.style.width = "100px";
	var rect = document.createElementNS(svgNS,"rect"); 
	rect.setAttributeNS(null,"width",percentage * 100);
	rect.setAttributeNS(null,"height",10);
	rect.setAttributeNS(null,"fill","black");
	rect.setAttributeNS(null,"stroke","none");
	svg.appendChild(rect);
	return svg;
}     
~~~

Alternatively you could also use `canvas`.

~~~
var canvasEl = document.createElement("canvas");
el.width = 100
el.height = 10
var ctx = canvasEl.getContext("2d");
ctx.fillRect(0,0,percentage * 100,10);
~~~

In this example you could even draw with plain DOM nodes.
However this is not recommended.

~~~
var bar = document.createElement("span");
bar.style.display = "inline-block";
bar.style.width = (percentage * 100) + "px";
bar.style.backgroundColor = "blue";
bar.innerHTML = "&nbsp;";
~~~

### c) Creating a stat row

First we create description element to display the name of our current property.

~~~
// format the name of the property
var desc = document.createElement("span");
desc.textContent = key;
desc.style.width = "50px";
desc.style.paddingLeft = "5px";
desc.style.display = "inline-block";
~~~

Then we want to display our previously defined naive bar chart.

~~~
// show the value as barchart
var canvasChild = document.createElement("canvas");
drawBar(canvasChild, percentage);
~~~

And now we need to group both in a row.
        
~~~
// group both values in one row
var row = document.createElement("div");
row.appendChild(desc);
row.appendChild(canvasChild);
chr.appendChild(row); 
~~~

Remember to create `chr` when looping over the entire chromosome.

### d) Outstanding: loop over the chromosome

~~~
// all chromosomes
for(var i=0; i < result.length; i++) {    
	// properties of a single chromosomes
	for(var key in result[i]){
~~~

If you put our code together, you should get something similar to this:

{% code javascript collapsible=true %}
var parser = require("biojs-io-snipspector");
var _ = require("underscore");

var vis = function(opts){
  var divEl = opts.el;
  var self = this; // save reference to itself (in callbacks this is different)
  parser.read("http://files.biojs.net/chromosomes/manny.dummy", function(result){

    for(var i=0; i < result.length; i++) {    
      var chr = document.createElement("div");
      
      // count the elements in this chromosome
      var total = _.reduce(result[i], function(memo,el,key){
        if(key != "name")
           return memo + el
        else return memo
      });
  
      // create statistics for a single chromosome
      for(var key in result[i]){
          if(key == "name") continue
          var percentage = result[i][key] / total;
          if(percentage > 0.01){
            
            // format the name of the property
            var desc = document.createElement("span");
            desc.textContent = key;
            desc.style.width = "50px";
            desc.style.paddingLeft = "5px";
            desc.style.display = "inline-block";
            
            // show the value as barchart
            var canvasChild = document.createElement("canvas");
            drawBar(canvasChild, percentage);
                    
            // group both values in one row
            var row = document.createElement("div");
            row.appendChild(desc);
            row.appendChild(canvasChild);
            
            chr.appendChild(row);
          }
      }
      divEl.appendChild(chr);
    }
    
    function drawBar(el,percentage){
   	   el.width = 100
	   el.height = 10
       var ctx = el.getContext("2d");
       ctx.fillRect(0,0,percentage * 100,10);
    }
   
  })
};
{% endcode %}


7) Verify your solution
---------------------

The final program could look like this:

[Demo on RequireBin][demo]


{% code javascript collapsible=true %}
var parser = require("biojs-io-snipspector");
var _ = require("underscore");

var vis = function(opts){
  var divEl = opts.el;
  var self = this; // save reference to itself (in callbacks this is different)
  parser.read("http://files.biojs.net/chromosomes/manny", function(result){

    for(var i=0; i < result.length; i++) {    
      var chr = document.createElement("div");
      
      // count the elements in this chromosome
      var total = _.reduce(result[i], function(memo,el,key){
        if(key != "name")
           return memo + el
        else return memo
      });
  
      // header
	  var header = document.createElement("div");
      header.textContent = "chr "+ result[i].name;
      chr.appendChild(header);

      // create statistics for a single chromosome
      for(var key in result[i]){
          if(key == "name") continue
          var percentage = result[i][key] / total;
          if(percentage > 0.01){
            
            // format the name of the property
            var desc = document.createElement("span");
            desc.textContent = key;
            desc.style.width = "50px";
            desc.style.paddingLeft = "5px";
            desc.style.display = "inline-block";
            
            // show the value as barchart
            var canvasChild = document.createElement("canvas");
            drawBar(canvasChild, percentage);
                    
            // group both values in one row
            var row = document.createElement("div");
            row.appendChild(desc);
            row.appendChild(canvasChild);
            
            // dummy evts
            row.addEventListener("mouseover",mouseover,false);
            row.addEventListener("mouseout",mouseout,false);
            
            chr.appendChild(row);
          }
      }
      divEl.appendChild(chr);
    }
    
    function drawBar(el,percentage){
   	   el.width = 100
	   el.height = 10
       var ctx = el.getContext("2d");
       ctx.fillRect(0,0,percentage * 100,10);
    }
    
    function mouseover(evt){
      var el = this.childNodes[1];
      el.style.paddingLeft = "10px";
    }
    
     function mouseout(evt){
      var el = this.childNodes[1];
      el.style.paddingLeft = "0px";
    }
    
  })
};
{% endcode %}

  
[demo]: http://requirebin.com/?gist=c9248b0840448995758a

  <!-- do not remove this empty line -->   
