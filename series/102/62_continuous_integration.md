---
title: 'Continuous integration'
layout: tutorial-container
contributors: Seb
category: 102_tutorial
series: 102
estimated-time: 5
---

#### 1) Using [travis][Travis]


1. Add a `.travis.yml`

~~~
language: node_js
node_js:
  - "0.11"
  - "0.10"
~~~~

2. Add your project on [Travis](https://travis-ci.org/profile/greenify) (flip the button to on - this will create a github webhook)

[travis]: http://travis-ci.org
[travis-start]: http://docs.travis-ci.com/user/getting-started/

{% hlblock info %}
You can also install the [Travis CLI](https://github.com/travis-ci/travis.rb)(`gem install travis`) command and run `travis enable`.
{% endhlblock%}

3. Add the shield to your `package.json`.

~~~
  "shields": {
    "test": {
      "img": "https://travis-ci.org/greenify/biojs-vis-msa.svg?branch=master",
      "href": "https://travis-ci.org/greenify/biojs-vis-msa"
    },
  },
~~~


#### 2) Using [drone.io](https://drone.io/)

* new project -> github -> add your project
* choose node
* setup build script

~~~
npm install --silent
npm test
npm run build-browser
~~~

* change the nvm to node __0.10__
* artifacts: enter the relative dir of files that should be downloadable (e.g. `build/biojs_io_fasta.min.js`)

Add the shield to your `package.json`.

~~~
  "shields": {
  	"build": {
         img: "https://drone.io/github.com/greenify/biojs-io-clustal/status.png",
         href: "https://drone.io/github.com/greenify/biojs-io-clustal/latest"
	 }
   },
~~~

### 3) Add other badges

There are plenty of fancy badges, here is a list to have a quick start.

~~~
[![NPM version](http://img.shields.io/npm/v/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
[![Dependencies](https://david-dm.org/<username>/<package-name>.png)](https://david-dm.org/greenify/<package-name>)
[![Code Climate](https://codeclimate.com/github/<username>/<package-name>/badges/gpa.svg)](https://codeclimate.com/github/<username>/<package-name>)
[![NPM downloads](http://img.shields.io/npm/dm/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
~~~
