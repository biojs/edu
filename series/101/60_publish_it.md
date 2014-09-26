---
title: 'Publish it'
layout: tutorial-container
contributors: David, Seb
category: 101_tutorial
series: 101
estimated-time: 10 
---

{% alert danger %}
Please do __NOT__ publish the dummy tutorial package on npm.
Have a look at this guide once you made a great package.
{% endalert %}

### 1) Upload it on npm

{% hlblock check %}
Make sure that in [`package.json`](https://www.npmjs.org/doc/files/package.json.html)

* the main attribute is set to the path of your main file (Normally `index.js`.)
* you have the `biojs` keyword
* you have added other descriptive keywords
* author information is correct (will be publicly visible)
* repo url is correct
* package name is correct
* your `npm test` executes the correct command and is passing

{% endhlblock %}

Now type into the console:

~~~
npm adduser  # First login or create a new account with following command (only run this once).
npm publish  # Now it is time to publish!
~~~

{% hlblock info %}
> Errare human est

If you have fixed them and want to deploy a new version of your component, run `npm publish` again.
{% endhlblock %}

{% alert ok %}
You made it. Get your coffee and celebrate. However the rest of this tutorial stays interesting.
So just enjoy the rest.
{% endalert %}

### 2) Add continuous integration (CI)

#### 2.1) Using [travis][Travis]


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


#### 2.2) Using [drone.io](https://drone.io/)

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

```
  "shields": {
  	"build": {
         img: "https://drone.io/github.com/greenify/biojs-io-clustal/status.png",
         href: "https://drone.io/github.com/greenify/biojs-io-clustal/latest"
	 }
   },
```

### 3) Add other badges

There are plenty of fancy badges, here is a list to have a quick start.

~~~
[![NPM version](http://img.shields.io/npm/v/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
[![Dependencies](https://david-dm.org/<username>/<package-name>.png)](https://david-dm.org/greenify/<package-name>)
[![Code Climate](https://codeclimate.com/github/<username>/<package-name>/badges/gpa.svg)](https://codeclimate.com/github/<username>/<package-name>)
[![NPM downloads](http://img.shields.io/npm/dm/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
~~~
