---
title: 'Conventions'
layout: series_item
contributors: Seb
series: details
permalink: details/conventions/
estimated-time: 5
---

General conventions
----------

* [io packages](https://github.com/biojs/biojs/wiki/BioJS-parser)
* visualization: [`biojs-events`](https://github.com/biojs/biojs-events): A event system to send events to outside listener
* state your license in your README
* source folder structure: use either `lib` or `src` (the NodeJS convention is to
name it `lib`, but frankly it doesn't matter)

Standards
---------

We have defined some minimal standards that every BioJS package should comply with. If your package doesn't fullfil those standards, it will be tagged via our [io-ratings](https://github.com/biojs/io-ratings) service and for now red warnings might appear. It could happen that we will take more drastic actions in the future.

### 1. Documentation

It is super easy to write usable documentation for your component, we don't expect a masterpiece of modern literature, but especially the user should be able to know how to use your components ;-)
You could write your documentation with  

* `README.md` (recommended)
* Github wiki
* an API documentation generating framework (e.g. docco or jsdoc)

### 2. Working snippets (for vis components)

* [snippets](https://github.com/greenify/biojs-sniper)

### 3. Lack of unit tests (especially for io components)

It is super easy to write automated tests, have a look at [mocha](http://webapplog.com/test-driven-development-in-node-js-with-mocha/).

### 4. Responsiveness on github

We don't expect you to fix an issue on the day someone opens (we are all busy people who have a day job), but if someone opens a pull request with a fix for the bug, you should respond to this within three days (72h) - after all merging something on github takes you less than 30 seconds (with opening the page).

Gold standard
-------------

The following standards are not required, but could enhance your public visibility.

### Recommendation for new comers

We state possible recommendations and pointers for each item. They are aimed at new comers and you are absolutely free to choose your e.g. favorite testing framework.
For those recommendations to new comers: It is not so important how fancy they are. The key focus should be how easy they are to use and understand.

### Our checklist

* public CI
  - [travis](/details/conventions/)
  - [drone.io](/details/conventions/)
* tool-enforced code-consistency
  - [jshint](http://www.jshint.com/)
  - BioJS [coding style guide](https://github.com/biojs/style-guide)
* automated integration tests
  - [phantomjs](https://www.npmjs.org/package/phantomjs)
  - [testling](https://ci.testling.com/)
  - [saucelabs](https://saucelabs.com/)
* high test coverage

{% alert warn %}
The gold standard is work in progress.
If you do disagree with an item listed here, please open an issue on github.
{% endalert %}


Example components
-----------------

* [msa](https://github.com/greenify/msa) (in CoffeeScript)

(feel free to add your component here)
