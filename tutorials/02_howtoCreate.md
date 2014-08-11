---
title: 'How to create a component for BioJS 2'
layout: tutorial-container
author: Iris Shih and David Dao 
category: tutorials
series: 101
estimated-time: 30 
---

<div class="alert alert-info">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<span class="glyphicon glyphicon-info-sign" style="font-size:22px"></span> &nbsp;
	You need to install `npm` before you can start to rock.
</div>

In the following we will give you a gentle introduction how to create a component for BioJS 2.
As a case study, we will build a simple parser for reading a list of all graduates of this tutorial.

### 1) Fork the BioJS 2 Template from GitHub

We created a BioJS Template for giving you a headstart for developing your component. 
You can find it in our [BioJS2 folder](https://github.com/biojs/biojs2). Please [fork](https://help.github.com/articles/fork-a-repo) the repository from github.
Now enter following command lines:

~~~
git clone https://github.com/YOUR-USERNAME/biojs2.git
cd biojs2/biojs-template
~~~

Inside the folder you find following files:

- `.gitignore`: Files that should be ignored by the git versioning system
- `LICENSE`: The license under which you want your source code to be distributed, e.g. MIT or Apache 2
- `browser.js`: Helper to create a namespace file for client-side javascript
- `index.js`: Your source code
- `package.json`: Information about your package: author, version, ...
- `src` : Folder including our tutorial index.js

More detailed information will be given in the following.

### 2) Choose a name for your component

Choose a name for your component. For the following example, we will name our component *biojs-io-graduates*.
For Biojs 2 components, we have following naming conventions:

__biojs-[io/rest/vis/algo/...]-[name]__

- Use `io` for components which are responsible for parsing data into a specific format
- Use `vis` for components which are visualizing data sets
- Use `rest` for REST apis to databases
- Use `algo` for server/client side algorithms processing the data

Now we have to edit the name in __package.json__.
Open the file with an editor and replace every __biojs-template__ to __biojs-io-graduates__.

### 3) Write a parser

Now it is time to code! 
To begin please open now the src folder and access the index.js file. 

First we will have a look at the data. 
It is structured as follows:

~~~
nickname,country (two chars)
~~~

You can safely assume that the nickname is unique.
For the country abbreviation the official standard [ISO 3166-1 Alpha 2](https://en.wikipedia.org/wiki/ISO_3166-1) is used.

For example:

~~~
greenify:DE
daviddao:HK
mhelvens:NL
timruffles:UK
iriscshih:TW
~~~

Now have a look at the provided code.

~~~
var biojs = {}

biojs.graduates = function() {

    var data = ["greenify:DE","daviddao:HK","mhelvens:NL","timruffles:UK","iriscshih:TW"];
    var graduates = {};

    // count countries
    for (var i = 0; i < data.length; i++) {
       //Fill in the missing code here!
    }

    console.log(graduates); 
}

biojs.graduates(); //Should print {DE: 1, HK: 1, NL: 1, UK: 1, TW: 1}
~~~



{% highlightblock challenge %}

Can you fill in the missing code inside the for loop so that `biojs.graduates()` outputs the number of graduates for each country?

{% endhighlightblock %}

~~~
{country : number of graduates} 
~~~


__Solution:__ 

{% code javascript collapsible=true %}
var biojs = {}

biojs.graduates = function() {

    var data = ["greenify:DE","daviddao:HK","mhelvens:NL","timruffles:UK","iriscshih:TW"];
    var graduates = {};

    // count countries
    for (var i = 0; i < data.length; i++) {
        var row = data[i].split(":"); 
        // init if new
        if (graduates[row[1]] === undefined) {
            graduates[row[1]] = 0;
        }
        graduates[row[1]]++;
    }

    console.log(graduates); 
}

biojs.graduates(); //Should print {DE: 1, HK: 1, NL: 1, UK: 1, TW: 1}
{% endcode %}

### 5) Export your component with CommonJS and NPM

Great work! Now it is time to export your component in order to provide your functionality with the other BioJS components.
We use [CommonJS Syntax](http://wiki.commonjs.org/wiki/Modules/1.1) to export modules in Biojs.

Please export your parser in the following way:

~~~
var biojs = { }

biojs.graduates = function() {
    ...
}

module.exports = biojs;
~~~

now other BioJS components are able to include your component by using

~~~
var parser = require('path to biojs-io-graduates');
parser.graduates();
~~~

### 5) Publish your component

<!--
Make sure, that in __package.json__ , the main attribute is set to the path of your main file.
Currently the default is __index.js__. Also edit the __npm run build-browser__ command, denoted in package.json by adjusting index.js to the path of your main file.

Also adjust your namespace defined in the __browser.js__ file to __biojs.io.graduates__ .
Now you are ready to publish your component in npm. Adjust your keywords and author information in package.json. 
They will be used by npm to display information about your component. Now type into the console:

~~~
//First login or create a new account with following command
npm adduser 
//Now it is time to publish!
npm publish
~~~

TODO: Hmm they shouldn't publish their dummy package on npm.
TODO: publish the dummy component so people don't have to use it.

Normally you would now publish your package to npm and github.

**TODO** Here we only show you how to publish it to github.
-->

Congratulations! You wrote your very first Biojs 2 Component. You can now publish it on github and it is ready to be used by everybody. Furthermore, consider to publish your future components to npm. We will provide you with a tutorial for [that]().
In the next tutorial, you will learn [how to create a visualization component](howToCreateVis.html) using your newly build __biojs-io-graduates__ component.
