---
title: 'Publish it'
layout: series_item
contributors: David, Seb
series: '101'
estimated-time: 5
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
(hint: you need to change version for a new deployment)
{% endhlblock %}

{% alert ok %}
You made it. Get your coffee and celebrate. However the rest of this tutorial stays interesting.
So just enjoy the rest.
{% endalert %}

