---
title: 'How to create a component for BioJS 2'
layout: container
author: Iris Shih and David Dao 
category: Tutorial
estimated-time: 30 
---

In the following we will give you a gentle introduction how to create a component for BioJS 2. As a case study, we will build a parser for parsing the contributors list of biojs.

### First step: Clone the BioJS 2 Template from GitHub
We created a BioJS Template for giving you a headstart for developing your component. 
You can find it in our [BioJS2 folder](https://github.com/biojs/biojs2).

```
git clone https://github.com/biojs/biojs2.git
cd biojs-template
```

Inside the folder you find following files:

- .gitignore
- LICENSE
- browser.js
- index.js
- package.json

An explanation of each file can be found in the comments. Furthermore, more detailed information will be given in the following .

### Second step: Choose a name for your component
Choose a name for your component. For the following example, we will name our component *biojs-io-contributors*.
For Biojs 2 Component, we have following naming conventions:

__biojs-[io/rest/vis/algo/...]-[name]__

- Use *io* for components which are responsible for parsing data into a specific format
- Use *vis* for components which are visualizing data sets
- Use *rest* for REST apis to databases
- Use *algo* for server/client side algorithms processing the data

Now we have to edit the name in __package.json__.
Open the file and replace every __biojs-template__ to __biojs-io-contributors__.

### Third step: Write your component
Now it is time to code! First we will have a look at the [data]().

Can you write a parser for this data so that the resulting JSON File has following structure?

```
{contributors: [
    {name: NAME, country: COUNTRY}
  ]
}
```

For example:

```
{contributors: [
    {name: "Sebastian Wilzbach", country: "Germany"},
    {name: "David Dao", country: "Hong Kong"},
    {name: "Iris Shih", country: "Taiwan"},
    ...
  ]
}

```

### Fourth step: Export your component with CommonJS and NPM
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

### Fifth step: Browserify and publish your component
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

Congratulations! Your component is now on npm and part of Biojs 2. It is ready to be used by everybody. 
In the next tutorial, you will learn [how to create a visualization component]() using your newly build __biojs.io.contributors__ component.



