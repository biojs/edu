---
title: 'Visualization: D3'
layout: series_item
contributors: David
series: 'snipspector_adv'
permalink: /snipspector_adv/vis_d3/
estimated-time: 30
---

In the following section we will give you a gentle introduction on how to create a component for BioJS 2.0.
As a case study, we will continue working with chromosome data and show you how to visualize this data with D3.
First of all create a new folder called `biojs-vis-snipspector` by running [`slush biojs`](https://github.com/biojs/slush-biojs).
We will use this as our working bench and only edit the `index.js` file inside the `lib` folder.
Note: Please replace the current code with our following code!

### 1) Installing npm dependencies

For this tutorial, we will require d3 and our parser!
In `npm` this is very easy, just run.

~~~
npm install biojs-io-snipspector d3 --save
~~~

{% hlblock question %}
What does `--save` mean? [Help](https://www.npmjs.org/doc/cli/npm-install.html)
{% endhlblock %}

{% hlblock info %}
If you don't find a npm package for a js lib, you can add it to the "snippets js" section of your `package.json`.

~~~
[...]
"snippets": {
	"js": ["/build/<your-component>.js", "<non npm libs>"],
[...]
~~~
{% endhlblock %}

In the previous tutorial we wrote a parser please have a look at the previous [tutorial]({{site.baseurl}}snipspector_adv/parser_real_data/), where we called our like this:

~~~
parser.read("http://files.biojs.net/chromosomes/manny", function(result){
  var genome = result;

})
~~~

In the following we will build a donutchart to visualize our data.

### 2) Require dependencies

First we need some dependencies. We require d3 for our visualizations and the parser from the previous tutorial.
We can require them with following code:

(`lib/index.js`)

~~~
var d3 = require("d3");
var parser = require("biojs-io-snipspector");
~~~

Furthermore we want to wrap our visualization in an exported function:


(add to `lib/index.js`)

~~~
var vis = function(opts){
 // future code to be added here
}
module.exports = vis;
~~~

### 3) Getting started with d3

Now we can get started. To define our chart, we first need the size of it, a set of colors, the arc form and an converter for our data:


(add to `lib/index.js`)

~~~
var width = 960,
    height = 500,
    radius = Math.min(width, height) / 2;

var color = d3.scale.category10();

var arc = d3.svg.arc()
            .outerRadius(radius - 10)
            .innerRadius(radius - 150);

var pie = d3.layout.pie()
            .sort(null)
            .value(function (d) {
                return d.number;
            });
~~~

In details:

- First we need a `radius`,`width` and `height` value for our svg components.
- `color` is a function which will translate values into color code.
- `arc` draws our svg arc. We we set `innerRadius` to `0`, we would get a piechart.
- `pie` is our data transformer. D3 provides us with an converter (or layouts), which will convert an array data representation into a suitable representation for pie charts.

### 4) Checking for the BioJS snippet

Normally `slush` should have created an example snippet for you, let's verify whether it is existent.
The file name doesn't not matter as long as it is in the `examples` directory.

`examples/simple_example.js`

~~~
var app = require("biojs-vis-snipspector");
app({el: yourDiv});
~~~

So let's use this snippet and show our current code, run:

~~~
npm run w
~~~

This will run [sniper]({{site.baseurl}}101/example_snippets) and let you browse our work at [http://localhost:9090/examples](http://localhost:9090/examples).
Currently the snippet will be empty, but you can add some example code inside our module in `lib/index.js` to check whether every is working. 

~~~
var svg = d3.select(opts.el).append("svg")
  .attr("width", 100)
  .attr("height", 100);

svg.append("circle")
  .style("fill", "red")
  .attr("r", 40)
~~~

If you see a circle, you can remove the example code and move on.

### 4) Convert our data

Now it is time to plot some data! In d3, data are arrays. So the format which our `biojs-io-snipspector` returns is not suitable for our representation.
Therefore we need to convert our data into this format for each chromosome (each chromosome will be represented by a pie/donut chart)

(add to `lib/index.js`)

~~~
var chromosome_data = [{category: "del", number: 1}, {category: "hetero": ,number: 2} , {category: "homo" , number: 3}];
~~~

Can you come up with an converter?
Here is our solution:
Add this into your code.

(add to `lib/index.js`)

~~~
function converter(genome){
   var data_res = [];

   for (var k = 0; k < 25; k++) {
               var data = [{
                   number: genome[k].del
       }, {
                   number: genome[k].hetero
       }, {
                   number: genome[k].homo
       }];


               var data_wrapper = [{
                   name: genome[k].name,
                   data: data
       }];

               data_res = data_res.concat(data_wrapper);

   }

   return data_res;
}
~~~

Everything should look like this right now:

~~~
function converter(genome){...}

parser.read("http://files.biojs.net/chromosomes/manny", function(result){
  var data_res = converter(result);

  //Our visualization code ...

})
~~~

All chromosomes are now in an optimal array representation and each chromosome object is now represented by his name and dataset.


### 5) Creating a donut chart!

Now, after cleaning up our data, let's get finally to the visualization part!
First, we will visualize the data in chromosome 'X' in a donut chart!

Let's create a svg which we append on the body of our html!

~~~
var X_data = data_res[22].data;

var svg = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", height)
            .append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

var g = svg.selectAll(".arc")
            .data(pie(X_data))
            .enter().append("g")
            .attr("class", "arc");

g.append("path")
    .attr("d", arc)
    .style("fill", function (d) {
            return color(d.data.category);
        });

g.append("text")
    .attr("transform", function (d) {
            return "translate(" + arc.centroid(d) + ")";
        })
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .text(function (d) {
            return d.data.category;
        });
~~~

D3 handles new data with `enter()`. To learn more about `enter`,`update` and `delete`, visit the [d3 tutorial](http://d3js.org/).
Congratulations! You wrote your first visualization component for biojs!
Now it is time to export and build it!

To export it write a wrapper around your all your code (except the dependencies)

~~~
var parser = require("biojs-io-snipspector");

function d3_show(opts) {
//All of our written code until now (except for the dependencies)
}

module.exports = d3_show;
~~~

We recommend browserify. Therefore use our preinstalled npm run build-browser!

~~~
npm run build-browser
~~~

to create a build for this file!

The final program looks like this:

{% code javascript collapsible=true %}
var d3 = require("d3");
var parser = require("biojs-io-snipspector");

function d3_show(opts) {

 var width = opts.width || 960,
            height = opts.height || 500,
            el = opts.el;
            radius = Math.min(width, height) / 2;

        var color = d3.scale.category10();

        var arc = d3.svg.arc()
                    .outerRadius(radius - 10)
                    .innerRadius(radius - 150);

        var pie = d3.layout.pie()
                    .sort(null)
                    .value(function (d) {
                        return d.number;
                    });

function converter(genome){
        var data_res = [];

        for (var k = 0; k < 25; k++) {
                    var data = [{
                        number: genome[k].del
            }, {
                        number: genome[k].hetero
            }, {
                        number: genome[k].homo
            }];


                    var data_wrapper = [{
                        name: genome[k].name,
                        data: data
            }];

                    data_res = data_res.concat(data_wrapper);

        }

        return data_res;
}

parser.read("http://files.biojs.net/chromosomes/manny", function(result){
  var data_res = converter(result);

  var X_data = data_res[22].data;

        var svg = d3.select(el).append("svg")
                    .attr("width", width)
                    .attr("height", height)
                    .append("g")
                    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

        var g = svg.selectAll(".arc")
                    .data(pie(X_data))
                    .enter().append("g")
                    .attr("class", "arc");

        g.append("path")
            .attr("d", arc)
            .style("fill", function (d) {
                    return color(d.data.category);
                });

        g.append("text")
            .attr("transform", function (d) {
                    return "translate(" + arc.centroid(d) + ")";
                })
            .attr("dy", ".35em")
            .style("text-anchor", "middle")
            .text(function (d) {
                    return d.data.category;
                });

})

}

module.exports = d3_show;
{% endcode %}

For more information about how each code component works, have a look at following [resources](http://schoolofdata.org/2013/10/01/pie-and-donut-charts-in-d3-js/).

In our final component `biojs-vis-snipspector`, we also included a function to visualize all chromosomes.

<div id="vis"></div>

Have a look at the [source code](https://github.com/biojs-edu/biojs-vis-snipspector) to learn more!

<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="{{site.baseurl}}series/snipspector-adv/res/snipvis.js"></script>
<script>var snipvis = require("biojs-vis-snipspector");
snipvis(document.getElementById("vis"))</script>
