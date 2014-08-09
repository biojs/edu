---
title: 'How to create a component for BioJS 2'
layout: container
author: Iris Shih and David Dao 
category: Tutorial
estimated-time: 30 
---

<div class="alert alert-info">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<span class="glyphicon glyphicon-info-sign" style="font-size:22px"></span> &nbsp;
	You need to install `npm` before you can start to rock.
</div>
{% highlightblock question %}
You need to install `npm` before you can start to rock.
{% endhighlightblock %}

In the following we will give you a gentle introduction how to create a component for BioJS 2.
As a case study, we will build a parser for parsing a list of all graduates of this tutorial.

**TODO**

```
graduates (of this tutorial) --> (1) biojs-io-graduates --> (2) biojs-vis-graduates--> | Chart |
```

### 1) Clone the BioJS 2 Template from GitHub

We created a BioJS Template for giving you a headstart for developing your component. 
You can find it in our [BioJS2 folder](https://github.com/biojs/biojs2).

__TODO__: please move it to a separate repo.

```
git clone https://github.com/biojs/biojs2.git
cd biojs-template
```

Inside the folder you find following files:

- `.gitignore`: Files that should be ignored by the git versioning system
- `LICENSE`: The license under which you want your source code to be distributed, e.g. MIT or Apache 2
- `browser.js`: Helper to create a namespace file for client-side javascript
- `index.js`: Your source code
- `package.json`: Information about your package: author, version, ...

More detailed information will be given in the following.

### 2) Choose a name for your component

Choose a name for your component. For the following example, we will name our component *biojs-io-contributors*.
For Biojs 2 components, we have following naming conventions:

__biojs-[io/rest/vis/algo/...]-[name]__

- Use `io` for components which are responsible for parsing data into a specific format
- Use `vis` for components which are visualizing data sets
- Use `rest` for REST apis to databases
- Use `algo` for server/client side algorithms processing the data

Now we have to edit the name in __package.json__.
Open the file with an editor and replace every __biojs-template__ to __biojs-io-contributors__.

### 3) Write your component

Now it is time to code! First we will have a look at the [data]().

```
nickname,country (two chars)
```

You can safely assume that the nickname is unique.
For the country abbreviation the official standard [ISO 3166-1 Alpha 2](https://en.wikipedia.org/wiki/ISO_3166-1) is used.

For example:

```
greenify:DE
daviddao:HK
mhelvens:NL
timruffles:UK
iriscshih:TW
```


{% highlightblock challenge %}
Can you write a parser for this data so that the resulting JSON File has following structure?
{% endhighlightblock %}

You can find the complete file [here](https://github.com/biojs/tutorial-heroes/blob/master/list)
to [download](https://raw.githubusercontent.com/biojs/tutorial-heroes/master/list)

**TODO**: Assume people do not know about JSON
**TODO**: help them to write the parser

### 4) Write the parser

**TODO**

### 4) Export your component with CommonJS and NPM

Great work! Now it is time to export your component in order to provide your functionality with the other BioJS components.
We use [CommonJS Syntax](http://wiki.commonjs.org/wiki/Modules/1.1) to export modules in Biojs.

Please export your parser in the following way:

```
var parser = function() {

}

parser.contributors_parser = function(string) {
    
}

module.exports = parser;

```

now other BioJS components are able to include your component by using

```
var parser = require(biojs-io-contributors);
parser.contributors_parser(string);

```

### 5) Browserify and publish your component

Make sure, that in __package.json__ , the main attribute is set to the path of your main file.
Currently the default is __index.js__. Also edit the __npm run build-browser__ command, denoted in package.json by adjusting index.js to the path of your main file.

Also adjust your namespace defined in the __browser.js__ file to __biojs.io.contributors__ .
Now you are ready to publish your component in npm. Adjust your keywords and author information in package.json. 
They will be used by npm to display information about your component. Now type into the console:

```
//First login or create a new account with following command
npm adduser 
//Now it is time to publish!
npm publish
```

TODO: Hmm they shouldn't publish their dummy package on npm.
TODO: publish the dummy component so people don't have to use it.

Normally you would now publish your package to npm and github.

**TODO** Here we only show you how to publish it to github.

Congratulations! Your component is now on npm and part of Biojs 2. It is ready to be used by everybody. 
In the next tutorial, you will learn [how to create a visualization component]() using your newly build __biojs.io.contributors__ component.
