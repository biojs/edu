---
title: 'Publish it'
layout: tutorial-container
author: David, Seb
category: 101_tutorial
series: 101
estimated-time: 10 
---

{% alert danger %}
Please do __NOT__ publish the tutorial package or other test packages on npm.	
{% endalert %}

__TO be done__

Make sure, that in [`package.json`](https://www.npmjs.org/doc/files/package.json.html), the main attribute is set to the path of your main file.
Currently the default is `index.js`. Also edit the `npm run build-browser`` command, denoted in `package.json` by adjusting `index.js` to the path of your main file.

Also adjust your namespace defined in the `browser.js` file to `biojs.io.<your-parser>`.
Now you are ready to publish your component in npm. Adjust your keywords and author information in package.json. 
They will be used by npm to display information about your component. Now type into the console:

~~~
# First login or create a new account with following command
npm adduser 
# Now it is time to publish!
npm publish
~~~

TODO: publish the dummy component so people don't have to use it.

Normally you would now publish your package to npm and github.
