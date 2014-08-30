---
title: 'Intro'
layout: tutorial-container
author: Seb
category: 101_tutorial
series: 101
estimated-time: 5
---


Purpose of this tutorial series
-------------------------------

* learn basic concepts of BioJS
* get hands on dependency management in BioJS
* master the workflow to publish a package on npm and the BioJS registry

After installing npm, you will first create 

1. a simple parser of [a list of all the people](https://github.com/biojs/tutorial-graduates/) who have done this tutorial (`biojs-io-gradutes`)
2. visualize this output (`biojs-vis-graduates`)
3. extend your simple parser and download a live list (`biojs-io-graduates`)
4. learn how to publish your parser

Concepts
--------

* data separation and modularity 
* versioning (via npm)
* minimal rules -> conventions and gold standards

What is a BioJS packages?
-------------------------

A tiny building block. It could be anything from a FASTA parser, a tree algorithm or
simple your visualization package.  
A general rule of thumb: _something that can be
reused by others_

Javascript guides
-------------------

* [Mozilla JavaScript guide](https://developer.mozilla.org/en/docs/Web/JavaScript/Guide)
* [w3schools](http://www.w3schools.com/js/)
* [Codecademy](http://www.codecademy.com/courses/javascript-intro/0/1)

Pointers to different visualization approaches
---------------------------------

* SVG 
  - [D3](http://d3js.org/)
* Canvas
  - [KineticJS](http://kineticjs.com/)
* HTML
  - [jQuery](https://jquery.com/)

(add your favorite library to this overview)


{% hlblock info %}
BioJS is truly open source, [even this tutorial](https://github.com/biojs/edu/blob/gh-pages/series/101_graduate/).
{% endhlblock %}
