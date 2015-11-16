---
title: 'What is BioJS?'
layout: series_item
series: '101'
permalink: 101/what_is_biojs/
estimated-time: 5
---

![Lego blocks]({{ site.baseurl}}img/series/101/lego_blocks.jpg){:height="250px" class="center"}
(Image credits: [Jeremey Page](https://www.flickr.com/photos/jezpage/4990873353))
{:style="font-size: 9px; text-align: center"}  


Basically BioJS components behave like Lego blocks. You don't start from scratch - can build on top of other blocks.

What exactly is a BioJS package?
-------------------------

A __tiny building block__ that can be reused by anyone.
It could be anything from a FASTA parser, a tree algorithm or a simple visualization module.  
Moreover a BioJS package is also a `npm` package.

{% hlblock info %}
`npm` stands for node package manager and is the package repository that powers node.
{% endhlblock %}

{% hlblock info %}
[Node.js](http://nodejs.org) is a runtime environment platform for server-side JavaScript applications.
{% endhlblock %}


What is BioJS?
---------------------

We are quite more than just a registry for components - we aim to build a infrastructure
, guidelines and tools to avoid the reinvention of the wheel in life sciences (= "Docker for Bio web components").  
In the early days of BioJS we defined specific _Easy to_ goals, let's see where we currently stand:

* Easy to _combine_ - `require('my-awesome-biojs-component')` (with `browserify` we can also use run  `require` in the browser)
* Easy to _use_ - `npm install my-awesome-biojs-component` (you will see that `npm` exactly behaves like our Lego block manager)
* Easy to _develop_ : we make only minimal rules and try to give the developers as much freedom as possible
* Easy to _discover_ : BioJS components can be easily browsed at [biojs.io](http://biojs.io)
* Easy to _understand_ : We hope you like this education platform
* Easy to _maintain_ : Everyone creates a github repo for this component and maintains only the code he loves
* Easy to _get involved_ : Apart from our amazing tutorial, we are also very active on github and gitter

<!--
* Easy to start:
* Easy to test
-->

What you get using BioJS
---------------------
In the next video you can check what you can achive reusing and creating BioJS components:

[![BioJS components](http://edu.biojs.net/img/series/101/biojs_videothumb.png)](https://www.youtube.com/watch?v=SkMKuj-Q0YI?t=0s "BioJS components")