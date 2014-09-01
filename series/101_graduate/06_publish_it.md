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
* author information is correct (will be publicly visible)
* repo url is correct
* package name is correct
* also edit the `npm run build-browser` command, denoted in `package.json` by adjusting `index.js` to the path of your main file.
* your `npm test` executes the correct command and is passing.

Also check, that

* you adjusted your namespace defined in the `browser.js` file to `biojs.io.<your-parser>`.
{% endhlblock %}

Now type into the console:

~~~
npm adduser  # First login or create a new account with following command (only run this once).
npm publish  # Now it is time to publish!
~~~

{% hlblock info %}
Bugs are human. If you have fixed them and want to deploy a new version of your component, run `npm publish` again.
{% endhlblock %}

### 2) Add it to the BioJS registry

You made a great package? [Adding it to our registry][adding] takes less than a minute.
Just send us a pull request for the [`index.toml`][adding].

[adding]: https://github.com/biojs/registry/blob/master/index.toml

{% alert ok %}
You made it. Get your coffee and celebrate. However the rest of this tutorial keeps to be interesting.
So just enjoy the rest.
{% endalert %}

### 3) Add continous integration (CI)

#### 3.1) Using [travis](https://travis-ci.org/)


Add a `.travis.yml` and add your project on Travis.

~~~
language: node_js
node_js:
  - "0.11"
  - "0.10"
~~~~

#### 3.2) Using [drone.io](https://drone.io/)

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

{% hlblock info %}
Adding you build badges to your repo is easy - and to our registry too.
{% endhlblock%}

### 4) Add other badges

There are plenty of fancy badges, here is a list to have a quick start.

~~~
[![NPM version](http://img.shields.io/npm/v/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
[![Dependencies](https://david-dm.org/<username>/<package-name>.png)](https://david-dm.org/greenify/<package-name>)
[![Code Climate](https://codeclimate.com/github/<username>/<package-name>/badges/gpa.svg)](https://codeclimate.com/github/<username>/<package-name>)
[![NPM downloads](http://img.shields.io/npm/dm/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
~~~

{% alert warn %}
gold standard is in work.
{% endalert %}

