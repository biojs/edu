---
title: 'Continuous integration'
layout: series_item
contributors: Seb, Yo
series: 'details'
permalink: details/continuous_integration/
estimated-time: 5
---

All listed continuous integration providers offer free plans for open source
repositories.

#### 1) Using [travis][Travis]


1. Add a `.travis.yml`

~~~
language: node_js
node_js:
  - "0.12"
  - iojs
~~~~

2. Add your project on [Travis](https://travis-ci.org/profile/greenify) (flip the button to on - this will create a github webhook)

[travis]: http://travis-ci.org
[travis-start]: http://docs.travis-ci.com/user/getting-started/

{% hlblock info %}
You can also install the [Travis CLI](https://github.com/travis-ci/travis.rb)(`gem install travis`) command and run `travis enable`.
{% endhlblock%}

With the [`travis.yml`](http://docs.travis-ci.com/user/build-configuration/) you can configure even more!

### 2) Using [circleci](https://circleci.com)

1. [add a project](https://circleci.com/add-projects)
2. Choose the correct owner/org and repo
3. Click on `build project`

You might want to save same artifacts or configure more details in a [`circle.yml`](https://circleci.com/docs/configuration)


### 3) Using [drone.io](https://drone.io/)

* new project -> github -> add your project
* choose node
* setup build script

~~~
npm install --silent
npm test
npm run build
~~~

* change the nvm to node __0.10__
* artifacts: enter the relative dir of files that should be downloadable (e.g. `build/biojs_io_fasta.min.js`)

### 5) Add other badges

There are plenty of fancy badges, here is a list to have a quick start.

~~~
[![NPM version](http://img.shields.io/npm/v/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
[![Dependencies](https://david-dm.org/<username>/<package-name>.png)](https://david-dm.org/greenify/<package-name>)
[![Code Climate](https://codeclimate.com/github/<username>/<package-name>/badges/gpa.svg)](https://codeclimate.com/github/<username>/<package-name>)
[![NPM downloads](http://img.shields.io/npm/dm/<package-name>.svg)](https://www.npmjs.org/package/<package-name>)
~~~

{% alert warn %}
There is no need to add your CI badges to the `package.json`, the BioJS registry will soon automatically recognize existing continuous integration services.
{% endalert %}
