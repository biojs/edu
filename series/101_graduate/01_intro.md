---
title: 'Intro'
layout: tutorial-container
author: Seb
revised: Manny
category: 101_tutorial
series: 101
estimated-time: 5
---


Purpose of this tutorial series
-------------------------------

* Learn basic concepts of BioJS
* Get hands on dependency management in BioJS 2.0
* Master the workflow for publishing a package on npm and the BioJS 2.0 registry

After installing npm, you will first create 

1. A simple parser of [a list of all the people](https://github.com/biojs/tutorial-graduates/) who have done this tutorial (`biojs-io-gradutes`)
2. Visualize this output (`biojs-vis-graduates`)
3. Extend your simple parser and download a live list (`biojs-io-graduates`)
4. Learn how to publish your parser

Concepts
--------

* Data separation and modularity 
* Versioning (via npm)
* Minimal rules -> conventions and gold standards

What is a BioJS 2.0 package?
-------------------------

A tiny building block. It could be anything from a FASTA parser, a tree algorithm or
a simple visualization module.  
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
The BioJS project is truly open source, [even this tutorial](https://github.com/biojs/edu/blob/gh-pages/series/101_graduate/).
{% endhlblock %}
