---
title: 'Common code patterns'
layout: series_item
series: 'details'
permalink: details/code_patterns/
estimated-time: 10
---

This is a list of common scenarios you might face - may this list be with you.

### How to "store" a DOM element from the examples?

`examples/simple.js`

~~~
var App = require("fancy-biojs-app");
var instance = new App({el: yourDiv, <other options>});
~~~

`index.js`

~~~
module.exports = function(opts){
  var el = opts.el;
}
~~~

### How to receive a file?

`examples/simple.js`

~~~
var xhr = require("xhr");
var App = require("fancy-biojs-app");
xhr("<relative path to your file>", function(err,status, body){
  var instance = new App({el: yourDiv, model: body});
});
~~~

You need to add the "xhr" module in the exposed section of the snippet configuration.

Another example:

`examples/simple.js`

~~~
    data_url= '../dataset.tsv';
    d3.tsv(data_url,function (error,data){

        count = 0;
        data.forEach(function(d){
            // ths + on the front converts it into a number just in case
            d.lwr = +d.lwr;
            d.prediction = +d.prediction;
            d.upr = +d.upr;
            count++;

        });
~~~

where dataset.tsv is stored in the root file

~~~
drwxr-xr-x 5 rowlandm rowlandm  4096 Feb 27 16:35 ./
drwxrwxr-x 4 rowlandm rowlandm  4096 Feb 27 13:49 ../
drwxrwxr-x 2 rowlandm rowlandm  4096 Feb 27 16:41 build/
-rw-r----- 1 rowlandm rowlandm  3565 Feb 27 15:14 dataset.tsv
drwxr-xr-x 2 rowlandm rowlandm  4096 Feb 27 16:41 examples/
drwxr-xr-x 2 rowlandm rowlandm  4096 Feb 27 16:40 lib/
-rw-r--r-- 1 rowlandm rowlandm 10725 Feb 27 13:51 LICENSE
-rw-r--r-- 1 rowlandm rowlandm  1643 Feb 27 16:11 package.json
-rw-r--r-- 1 rowlandm rowlandm  1502 Feb 27 13:51 README.md
~~~


### How to have default options?

`examples/simple.js`

~~~
var App = require("fancy-biojs-app");
var instance = new App({el: yourDiv, fancyColor: blue});
~~~

` index.js`

~~~
var extend = require("js-extend").extend // you could also use underscore or jQuery
module.exports = function(userOpts){
  var opts = {
   fancyColor: "red"
  }
  opts = extend(opts, userOpts);
  var el = userOpts.el;
}
~~~

{% hlblock help %}
You can also browse existing components at the registry.
{% endhlblock %}
