---
title: 'Adding CSS'
layout: series_item
series: 'details'
permalink: details/css/
estimated-time: 10
---

{% hlblock info %}
We use [`parcelify`](https://github.com/rotundasoftware/parcelify) as this allows a CSS dependency chain (as you no it from browserify).
{% endhlblock %}

### 1. Add your CSS files to the `style` field

`package.json`

~~~
 "style" : "css/*.css"
~~~

or

~~~
 "style" : "*.scss"
~~~

{% hlblock info %}
The registry now _only_ picks the `style` dependencies - it doesn't merge it with your css files in the sniper section. So be sure that you add all css files - the "style" attribute can also be an array.
{% endhlblock %}

{% alert warn %}
You need to install `npm` before you can start to rock. See <a href="20_getting_started.html"> the getting started guide </a> for more info.
{% endalert %}

### 2. Adding a build tasks and updating the sniper

2.1) Install parcelify

~~~
npm install parcelify --save-dev
~~~

2.2) Adding it as a build task

`package.json`

~~~
"scripts": {
...
 "css": "parcelify ./ -c build/bundle.css",
...
}
~~~

2.3) Update the sniper

~~~
css: ["/build/bundle.css"]
~~~

2.4) Optional: Parcelify has a watch mode

~~~
parcelify ./ -w -c build/bundle.css
~~~

### 3. Using a preprocessor (SASS, LESS, ...)

For CSS preprocessors like SASS or LESS you can use a parcelify tranform, see this example for SASS:

~~~
  "transforms" : [ "sass-css-stream" ],
  "dependencies" : {
    "sass-css-stream": "~0.0.1"
  }
~~~

{% hlblock info %}
Do you want to [learn more](https://github.com/rotundasoftware/parcelify#local-package-specific-transforms) about parcelify transforms?
{% endhlblock %}
