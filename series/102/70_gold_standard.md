---
title: 'Gold standard'
layout: series_item
contributors: Seb
series: '102'
estimated-time: 5 
---

Guidelines
----------

* event system: [`biojs-events`](https://github.com/biojs/biojs-events)
  - please state all the custom events you send in your documentation
* state your license in your README
* source folder structure: use either `lib` or `src` (the NodeJS convention is to
name it `lib`, but frankly it doesn't matter)

Gold standard
-------------

Not needed, but highly recommended.
For the use of every item you will be rewarded by a badge in the BioJS registry.

### Recommendation for new comers

We state possible recommendations and pointers for each item. They are aimed at new comers and you are absolutely free to choose your e.g. favorite testing framework.
For those recommendations to new comers: It is not so important how fancy they are. The key focus should be how easy they are to use and understand.

### Our checklist

* npm presence
  - use [`npm upload`][publish-guide]
* automated tests
  - [mocha](http://webapplog.com/test-driven-development-in-node-js-with-mocha/)
* public CI
  - [travis][publish-guide]
  - [drone.io][publish-guide]
* tool-enforced code-consistency
  - [jshint](http://www.jshint.com/)
  - BioJS [coding style guide](https://github.com/biojs/style-guide)
* user documentation
  - `README.md`
  - Github wiki
* API documentation framework (automatically generated)
* [snippets](https://github.com/greenify/biojs-sniper)
* automated integration tests
  - [phantomjs](https://www.npmjs.org/package/phantomjs)
  - [testling](https://ci.testling.com/)
  - [saucelabs](https://saucelabs.com/)
* high test coverage

{% alert warn %}
The gold standard is work in progress.
If you do disagree with an item listed here, please open an issue on github.
{% endalert %}

[publish-guide]: 60_publish_it.html

Other useful pointers
---------------------

* build system
  - [gulp](http://travismaynard.com/writing/getting-started-with-gulp)

Example components
-----------------

* [biojs-vis-msa](https://github.com/greenify/biojs-vis-msa) (in CoffeeScript)

(feel free to add your component here)
