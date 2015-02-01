---
title: 'Tools'
layout: series_item
contributors: Seb
series: '101'
estimated-time: 5
extra_css2: ["/css/aspects.css"]
aspectsURL: /img/aspects/
aspects:
- name: Automation
  folder: automation
  order: 60
  items:
  - name: Gulp
    img: gulp.png
    href: http://gulpjs.com
  - name: Grunt
    img: grunt.png
    href: http://gruntjs.com
  - name: Slush
    img: slush.png
    href: https://slushjs.github.io/#/
  - name: Yeoman
    img: yeoman.png
    href: http://yeoman.io/

- name: Continuous Integration
  folder: ci
  order: 70
  items:
  - name: "Circle CI"
    img: circleci.png
    href: https://circleci.com/
  - name: Cloudbees
    img: cloudbees.png
    href: http://www.cloudbees.com/ 
  - name: Code Climate
    img: codeclimate.png
    href: https://codeclimate.com/
  - name: Drone IO
    img:  droneio.png
    href: https://drone.io/
  - name: Sauce Labs
    img: saucelabs.png
    href: https://saucelabs.com/
  - name: Testling
    img: testling.png
    href: https://ci.testling.com/
  - name: Travis
    img: travis.png
    href: https://travis-ci.org/

- name: Language
  folder: language
  order: 50
  items:
  - name: CoffeeScript
    img: coffeescript.png
    href: http://coffeescript.org/
  - name: Dart
    img: dart.png
    href: https://www.dartlang.org/
  - name: ELM
    img: elm.png
    href: http://elm-lang.org/
  - name: ES 6
    img: es6.png
    href: http://wiki.ecmascript.org/doku.php?id=harmony:specification_drafts
  - name: TypeScript
    img: typescript.png
    href: http://www.typescriptlang.org/

- name: Other
  folder: other
  order: 200
  items:
  - name: CSS 4
    img: css4.png
    href: http://dev.w3.org/csswg/selectors4/ 
  - name: JSHint
    img: jshint.png
    href: http://www.jshint.com/
  - name: LESS
    img: less.png
    href: http://lesscss.org/
  - name: SASS
    img: sass.png
    href: http://sass-lang.com/
  - name: Stylus
    img: stylus.png
    href: https://learnboost.github.io/stylus/
  - name: UglifyJS
    img: uglifyjs.png
    href: https://github.com/mishoo/UglifyJS2 

- name: Testing
  folder: testing
  order: 10
  items:
  - name: BusterJS
    img: busterjs.png
    href: http://busterjs.org/
  - name: Jasmine
    img: jasmine.png
    href: https://jasmine.github.io/
  - name: Karma
    img: karma.png
    href: https://karma-runner.github.io/
  - name: Mocha
    img: mocha.png
    href: https://visionmedia.github.io/mocha/
  - name: PhantomJS
    img: phantomjs.png
    href: http://phantomjs.org/
  - name: QUnit
    img: qunit.png
    href: http://qunitjs.com/
  - name: SinonJS
    img: sinonjs.png
    href: http://sinonjs.org/
 
- name: Utils
  folder: utils
  order: 100
  items:
  - name: Backbone
    img: backbone.png
    href: http://backbonejs.org/
  - name: JQuery
    img: jquery.png
    href: https://jquery.com/
  - name: LoDash
    img: lodash.png
    href: http://lodash.com/
  - name: Underscore
    img: underscore.png
    href: http://underscorejs.org/
  - name: ZeptoJS
    img: zepto.png
    href: http://zeptojs.com/

- name: Visualization
  folder: vis
  order: 20
  items:
  - name: D3
    img: d3.png
    href:  http://d3js.org/
  - name: HTML 5
    img: html5.png
    href: http://www.w3schools.com/html/html5_intro.asp
  - name: Raphael
    img: raphael.png
    href: http://raphaeljs.com/
  - name: VisJS
    img: visjs.png
    href: http://visjs.org/
  - name: WebGL
    img: webgl.png
    href: https://en.wikipedia.org/wiki/WebGL

---

The following collection is just an extract of tools you are able to use.

{% sorted_for aspect in page.aspects sort_by:order %}


<h3 id="aspect_{{ aspect.folder }}"> {{aspect.name}} </h3>

<div class="row aspect-row">

{% for item in aspect.items %}

<div class="col-md-2 col-xs-4 aspect-row-item vcenter">
<a href="{{ item.href }}" alt="{{ item.name }}" >
<img class="aspect-row-img" src="{{ page.aspectsURL | append: aspect.folder | append: "/" |  append: item.img }}">
</a>
</div>

<!--
{% assign mIndex = forloop.index | modulo:6 %}
{% if mIndex == 0 %}
<div class="clearfix"> </div>
{% elsif mIndex == 3 %}
<div class="visible-xs clearfix"> </div>
{% endif %}
-->

{% endfor %}

</div>

{% endsorted_for %}
