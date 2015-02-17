---
title: 'Common code patterns'
layout: series_item
series: 'details'
estimated-time: 10
---

This is a list of common scenarios you might face - may this list be with you.

### How to have receive a DOM element from the examples?

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
