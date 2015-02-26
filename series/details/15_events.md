---
title: 'Events'
layout: series_item
series: 'details'
permalink: details/events/
estimated-time: 10
---

### Listen to events

~~~
objs.on("name", function(data) {

})
~~~

if you want to proxy events:

~~~
objs.onAll(function(evtName, data) {

})
~~~

[learn more](https://github.com/biojs/biojs-events)


### Expose your events

The registry now listen to every snippet that contains `//@biojs-instance=<variable>` and display the event console on the first received event.

Have a look at the [MSA component](http://biojs.io/d/biojs-vis-msa) or [Muts-Needle](http://biojs.io/d/muts-needle-plot) as an example.


Guidelines for events
----------------

You can choose any library that supports the choosen syntax.

Please provide

~~~
objs.on("name", function(data) {})
objs.off("name", function(data) {})
objs.once("name", function(data) {})
objs.trigger("name", function(data) {})
objs.onAll(function(eventName, data) {})   // (optional)
~~~


Here is a list of some popular libraries that offer this functionality:

* [Backbone](backbonejs.org)
* [Bean](https://github.com/fat/bean)
* [EventEmitter](https://github.com/Wolfy87/EventEmitter)
* [JS-signals](https://github.com/millermedeiros/js-signals)
* [MiniPubSub](https://github.com/neurodrone/MiniPubSub)
* [microevent.js](https://github.com/jeromeetienne/microevent.js)
* [atom](https://github.com/zynga/atom)
* [asEvented](https://github.com/mkuklis/asEvented)
* [Vine](https://github.com/arextar/Vine)
* [minivents](https://github.com/allouis/minivents)

Not all of them use the same method names or signatures. Please try to adapt those the signatures given above if you want to use them.


How to use
----------

### 1. install

~~~
npm install biojs-events --save
~~~

### 2. Mix the events capability with your object

After the code of your BioJS component add the events capability by mixing you component prototype with the event class

~~~
require('biojs-events').mixin(my_component.prototype);
~~~

### 3. Trigger events

Now in your code you can use the events methods (trigger, off,on,once):

~~~
this.trigger('onSomethingChanged', {
 data : "some data"
});
~~~

and of course listen to your own events:

~~~
this.on('onSomethingChanged', function(data){
 console.log(data); // will print "some data"
});
~~~
