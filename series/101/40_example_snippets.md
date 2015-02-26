---
title: 'Example snippets'
layout: series_item
series: '101'
permalink: 101/example_snippets/
estimated-time: 5
---

{% alert warn %}
Example snippets are only needed for visualizations components.
{% endalert %}

The idea of BioJS snippets is to have a visual appealing documentation of the different features of your component.
Based on these examples users of your component could start customizing (in an online editor like JSBin) the example to their use case.
The simplest BioJS snippet consists of two lines, where we load an application with the `require` statement and create a `new` instance of it.

~~~
var App = require("fancy-biojs-app");
var instance = new App({el: rootDiv, <other options>});
~~~

You might realize that an ideal snippet doesn't include any HTML at all. Well why should you?
If you convert the BioJS snippet to real HTML you would have to create this minimal HTML file for every snippet that you provide. In fact you state all your global dependencies in a global configuration file - the [`package.json`]({{site.baseurl}}/details/package_json)

~~~
<html>
<meta charset=utf8>
<body>
<div id=rootDiv></div>
<script src="<path to your js file>"></script>
<script>
var rootDiv = document.getElementById("rootDiv");
var App = require("fancy-biojs-app");
var instance = new App({el: rootDiv, <other options>});
</script>
</body>
</html>
~~~

If you don't want us to create a DOM element automatically and assign this DOM element to the variable `rootDiv`, you can create your own HTML, but please use only the body part (here `<div id=rootDiv></div>`).

### Wait ... I have never seen `require` in a browser JS!

You will see in a later tutorial that the tool `browserify` allows us `require` even in your browser.

### Why do I have to specify my {css,js} dependencies in the `package.json`?

This tells us in an easy way your dependencies and we can use this information to inject your component in any environment like the BioJS registry, online code editors or real platforms like Galaxy.

### How do I convert BioJS snippets to real HTML?

You will need the BioJS `sniper` - if you haven't installed it yet, run

~~~
npm install -g sniper
~~~

With `sniper` you don't need to convert your snippets to HTML at all. The `sniper` command starts a local webserver (by default at [port 9090](http://localhost:9090)) and converts your example snippet to HTML on-the-fly - if you dislike this automatic generation you can generate static HTML with `sniper --compile`.

{% hlblock help %}
Do you want to [learn more](https://github.com/biojs/sniper) about the `sniper`?
{% endhlblock %}
