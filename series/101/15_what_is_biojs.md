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


Basically BioJS components behave like Lego blocks. You don't start from scratch - you can build on top of other blocks.

What exactly is a BioJS package?
-------------------------

A __tiny building block__ that can be reused by anyone.
It could be anything from a FASTA parser to a tree algorithm, or even a simple visualization module.  
Moreover a BioJS package is also an `npm` package.

{% hlblock info %}
`npm` stands for node package manager and is the package repository that powers node.
{% endhlblock %}

{% hlblock info %}
[Node.js](http://nodejs.org) is a runtime environment platform for server-side JavaScript applications.
{% endhlblock %}


What is BioJS?
---------------------

BioJS is far more than just a registry for components - we aim to build an infrastructure, with guidelines and tools to avoid reinventing the wheel in life sciences – think "Docker for Bio web components".  
In the early days of BioJS we defined specific _Easy to_ goals - our set of core principles we, as a community, 
try to follow when developing BioJS components and its resources:

* Easy to __combine__ - BioJS makes extensive use of Node's `require()` method to load modules - objects that may contain values, objects or functions from another JavaScript file. E.g. `require('my-awesome-biojs-component')` will load the module of my-awesome-biojs-component into your own project (with `browserify` we can also use run  `require` in the browser)
 
* Easy to __use__ - BioJS lets you use components easily by single-line installation via npm. All you need is to write `npm install my-awesome-biojs-component` into your terminal to get everything you need to reuse the `my-awesome-biojs-component` (you will see that `npm` exactly behaves like our Lego block manager)

* Easy to __develop__ : BioJS provides with you a minimal essential set of conventions and Best Practices, so you as a contributing developer can enjoy as  much freedom as possible when creating your own components

* Easy to __discover__ : BioJS sums up over 130 components in the [ __BioJS Registry__](http://biojs.io)

* Easy to __understand__ : The community of BioJS works steadily on creating and improving learning resources for its users and developers. If you find anything to be unclear or if you are missing something, please feel free to [edit these pages on github](https://github.com/biojs/edu) by sending us a pull request, or request new learning sections by creating [a github issue](https://github.com/biojs/edu/issues)
 
* Easy to __maintain__ : Everyone creates a github repo for their own component and maintains only the code they love!

* Easy to __get involved__ : Apart from our amazing tutorial, we are also very active on [github](https://github.com/biojs/), [gitter](https://gitter.im/biojs/biojs) and [slack chat](http://biojs-slackin.herokuapp.com/)

<!--
* Easy to start:
* Easy to test
-->

What you get using BioJS
---------------------
In the next video you can check out what you can achieve by reusing and creating BioJS components:

<iframe width="100%" height="600px" src="http://www.youtube.com/embed/SkMKuj-Q0YI?autoplay=0"></iframe>
