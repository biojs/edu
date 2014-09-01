---
title: 'Package basics'
layout: tutorial-container
contributors: David, Iris, Manny, Seb
category: 101_tutorial
series: 101
estimated-time: 30 
---

{% alert warn %}
You need to install `npm` before you can start to rock. See <a href="02_getting_started.html"> the getting started guide </a> for more info.
{% endalert %}

In the following section we will give you a gentle introduction on how to create a component for BioJS 2.0.
As a case study, we will build a simple parser to read __xxx___.
In the next tutorial we will show you how to visualzee this data.

### 1) Fork the BioJS 2 Template from GitHub

We created a BioJS Template for giving you a headstart for developing your component. 
You can find it in our [BioJS2 folder](https://github.com/biojs/biojs). Please [fork](https://help.github.com/articles/fork-a-repo) the repository from github.
Now enter following command lines:

~~~
git clone https://github.com/<YOUR-USERNAME>/biojs.git
cd biojs
~~~

Inside the folder you find following files:

- `.gitignore`: Files that should be ignored by the git versioning system
- `LICENSE`: The license under which you want your source code to be distributed, e.g. MIT or Apache 2
- `browser.js`: Helper to create a namespace file for client-side javascript
- `index.js`:  Index file over all submodules
- `package.json`: Information about your package: author, version, ...
- `src` : Folder including our tutorial index.js
- `test`: Folder containing your first unit test

(More detailed information will be given later in this tutorial)

### 2) Choose a name for your component

Choose a name for your component. For the following example, we will name our component *biojs-io-snipspector*.
For BioJS 2 components, we have following naming conventions:

__biojs-[io/rest/vis/algo/...]-[name]__

- Use `io` for components which are responsible for parsing data into a specific format (aka parser)
- Use `vis` for components which are visualizing data sets
- Use `rest` for REST apis to databases
- Use `algo` for server/client side algorithms processing the data (e.g. alignments, neural networks, markov models, graph algorithms)

Now we have to edit the name in the __package.json__.
Open the file with an editor and replace every __biojs-template__ to __biojs-io-snipspector__.

{% hlblock task %}
Rename the github repository to `biojs-io-snipspector`
{% endhlblock %}

### Solution

1. Rename it on github

2. Update your `git remote` or `.git/config`

~~~
git remove origin
git remote add origin git@github.com:<username>/biojs-io-snipspector.git
~~

3. Update your packge.json

~~~
git add package.json
git commit -m 'changed package.pkg'
~~~

__TODO__: solution should be collapsible

### 3) Our input data 


First we will have a look at the data. 
It is structured as follows:

~~~
track
chrom chromStart chromEnd
~~~

These three fields in each feature line are required:

* `chrom` - name of the chromosome or scaffold. Any valid seq_region_name can be used, and chromosome names can be given with or without the 'chr' prefix.
* `chromStart` - Start position of the feature in standard chromosomal coordinates (i.e. first base is 0).
* `chromEnd` - End position of the feature in standard chromosomal coordinates

{% hlblock info %}
For detailed info about the BED format, visit the [ensembl doc](http://www.ensembl.org/info/website/upload/bed.html) or the [UCSC help](http://genome.ucsc.edu/FAQ/FAQformat.html#format1)
{% endhlblock %}


For example:

~~~
rs5747620	22	15412698	TT
rs9605903	22	15434720	CC
rs5747968	22	15447504	GG
rs2236639	22	15452483	GG
rs5747999	22	15455353	AA
rs11089263	22	15467656	AA
rs2096537	22	15474749	AC
rs9604959	22	15479107	CC
rs9604967	22	15492342	CC
rs4819849	22	15532611	AG
rs9605028	22	15534984	AA
rs1892844	22	15535383	AA
~~~

This file is available at [`files.biojs.net/101.sample`](http://files.biojs.net/101.sample).
Have a look at it:

~~~
curl files.biojs.net/101.sample
~~~

4) The first testcase
----------------------

We already provide you with one test case, in the next section we will show you how to fix this unit test.
You can execute the test suite with:

```
npm test
```

It is really ok if you see errors here - you will fix them later ;-)

{% hlblock info %}
In this tutorial we use [Mocha](https://visionmedia.github.io/mocha/) as JavaScript test framework.
However you can use your favorite - you only need to change the `test` command in the `scripts` section of your `package.json`. 
{% endhlblock %}

5) Start coding
----------------

Now it is time to code! 
To begin please open now the src folder and access the index.js file. 
First have a look at the provided code.

~~~
var graduates = {};

graduates.parse = function() {
    
    var data = ["rs5747620	22	15412698	TT",
				"rs9605903	22	15434720	CC",
				"rs5747968	22	15447504	GG",
				"rs2236639	22	15452483	GG",
				"rs5747999	22	15455353	AA",
				"rs11089263	22	15467656	AA",
				"rs2096537	22	15474749	AC",
				"rs9604959	22	15479107	CC",
				"rs9604967	22	15492342	CC",
				"rs4819849	22	15532611	AG",
				"rs9605028	22	15534984	AA",
				"rs1892844	22	15535383	AA"];

    var parsed = {};
    console.log("Welcome to the BioJS tutorial");

    // count countries
    for (var i = 0; i < data.length; i++) {
        // Please fill in your code here! 
    }

    console.log(parsed); 

    return parsed;
}

graduates.parse(); //Should print {DE: 1, HK: 1, NL: 1, UK: 1, TW: 1}
~~~

You can always run your application directly with with Node, like this:

~~~
node index.js
~~~

{% hlblock help %}
If you are new JavaScript or have not coded for a while, you might want to check out this [Cheatsheet](http://overapi.com/javascript/).
Or this one for a short fresh up of [variables](http://thewebivore.com/wp-content/uploads/2013/02/PamsJavascriptCheatSheet.pdf).
{% endhlblock %}


{% hlblock task %}

Can you fill in the missing code inside the for loop so that `graduates.parse()` outputs the number of graduates for each country and your unit test is green?

{% endhlblock %}

~~~
{country : number of graduates} 
~~~

6) Verify your solution
----------------

{% hlblock stop %}

No please do __NOT__ have a look at our solution, if your unit test is green - 
your solution is correct!
Please only continue if your solution is working.

{% endhlblock %}

__Solution:__ 

{% code javascript collapsible=true %}
var biojs = {}

graduates.parse = function() {

    var data = ["rs5747620	22	15412698	TT",
				"rs9605903	22	15434720	CC",
				"rs5747968	22	15447504	GG",
				"rs2236639	22	15452483	GG",
				"rs5747999	22	15455353	AA",
				"rs11089263	22	15467656	AA",
				"rs2096537	22	15474749	AC",
				"rs9604959	22	15479107	CC",
				"rs9604967	22	15492342	CC",
				"rs4819849	22	15532611	AG",
				"rs9605028	22	15534984	AA",
				"rs1892844	22	15535383	AA"];


    var parsed = {};

    // count countries
    for (var i = 0; i < data.length; i++) {
        var row = data[i].split(/\s+/); 
        // init if new
        if (parsed[row[1]] === undefined) {
            parsed[row[1]] = 0;
        }
        parsed[row[1]]++;
    }
}
{% endcode %}

### 7) Export your component with CommonJS and NPM

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
var parser = require('<path>');
parser.graduates();
~~~

The path can be either relative `../src/index.js` or simply the package name `biojs-io-snipspector`.

### 8) Publish your component

Congratulations! You wrote your very first Biojs 2 Component. You can now publish it on github and it is ready to be used by everybody

{% hlblock info %}
If you are unfamiliar with git, check out the [Git guide](https://rogerdudler.github.io/git-guide/) or [15 minutes interactive lesson](https://try.github.io/levels/1/challenges/1) by Codeschool.
{% endhlblock %}

Furthermore, consider to publish your future components to npm. We will provide you with a tutorial for [that]().
In the next tutorial, you will learn [how to create a visualization component](04_visualization_basics.html) using your newly build `biojs-io-snipspector` component.

{% hlblock info %}
You can find the complete solution of this package on [github](https://github.com/biojs/biojs-io-snipspector) and [npm](https://www.npmjs.org/package/biojs-io-snipspector).
{% endhlblock %}
