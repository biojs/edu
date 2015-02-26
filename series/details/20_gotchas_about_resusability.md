---
title: 'Reusability'
layout: series_item
series: 'details'
permalink: details/reusability/
estimated-time: 10
---

The modularity and re-usability is one of the key ideas of BioJS. Maybe it helps to think of biojs.io as an "App Store" for JS components and "downloading the App" means actually embedding it in a website.

### General assumptions:

(user refers to someone who embeds your application, e.g. a website owner)

* you only have __one div__ (nobody wants to copy HTML that will change over versions, to some extent you could have more for optional user controls)
* a user is allowed to create multiple instances of your app (on the same page)
* a user might want to customize your app by changing some options - he will have its own file and customize the your settings

### This means:

* don't dumb HTML to the snippets - a general rule of thumb is that this makes your app hard to reuse -> only use "js" in the example
* If you want to stick with your HTML upload form, please provide at least one minimal example with just your raw component (see below for a minimal example)
* Don't use global variables!
* Consider the div that your application gets as a virtual environment for your component - only modify stuff inside of it
* A user will instantiate your application (=will call your main class with new)
* Don't do crazy shit with document.body or the Function.prototype
* Don't query the entire web page for DOM elements - an ID is unique. So $('#fancyId') won't work and $(".fancyClass") will return you the objects of all instances

A general advise is to create all the needed DOM elements in your component and save references to the most important ones.
