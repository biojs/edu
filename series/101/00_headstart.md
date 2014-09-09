---
title: 'Headstart'
layout: tutorial-container
contributors: David
category: 101_tutorial
series: 101
estimated-time: 5 
---

This is a short 5 minutes tutorial on the basics of using and reusing BioJS components.

1) Install npm
-------------------------

{% alert warn %}
You need to install `npm` before you can start to rock. See <a href="20_getting_started.html"> the getting started guide </a> for more info.
{% endalert %}

How does the LEGO-System of BioJS works?
We recommend you to use a Unix terminal and a text editor!


2) Your first easy BioJS Component
-------------------------

Make a new folder and create a new file called `index.js`.
Now we create an easy BioJS component which adds two numbers and can be reused!

~~~
function biojs101(a,b) {
    return a+b;
}

console.log(biojs101(1,2)); 

module.exports = biojs101; 
~~~

Congratulations, you wrote your first BioJS Component!

To run this component, type:

~~~
node index.js 
~~~

to run this file! It should show you `3`.

3) Reuse your component
-------------------------

Create a second file called `reuse.js` which is in the same folder as `index.js`

Type in:

~~~
var reuse = require("./index");

console.log(reuse(3,6));
~~~

Congratulations! You reused your first biojs function in the source code!
Check for yourself, type in:

~~~
node reuse.js 
~~~

It will show you `3` (because of console.log in `index.js`) and `9`.

{% hlblock info %}
Are you interested how `require` [works](https://github.com/maxogden/art-of-node#how-require-works)?
{% endhlblock %}

4) Reusing current BioJS Components!
----------------------------

BioJS offers a lot of common parsers and algorithms for reuse.

Open your `reuse.js` file and type in

~~~
var parser = require("biojs-io-newick").parse_nwk;
~~~

Now you included a newick parser for testing. Checkout the documentation for newick parser to see for yourself.
To download the biojs component, just type  

~~~
npm install biojs-io-newick --save
~~~

into your terminal. Now you can look up:
You have a `node_module` folder next to your `index file`. It has the source code of `biojs-io-newick` inside!
Ok, get back to your `reuse.js`.
Now add the following into `reuse.js`:

~~~
var newick = "(homo_sapiens:1,(mus_musculus:2,danio_rerio:17):4);"
var parsed_data = parser(newick);
console.log(parsed_data);
~~~

Now run again 

~~~
node reuse.js
~~~

You should get following:

~~~
{ children:
   [ { name: 'homo_sapiens', branch_length: 1 },
     { name: '', children: [Object], branch_length: 4 } ],
  name: '' }
~~~

Congratulations!
You parsed a string by reusing a common biojs algorithm.
