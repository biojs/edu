---
title: 'Package basics'
layout: series_item
contributors: David, Iris, Manny, Seb
series: 'snipspector'
permalink: /snipspector/basics/
estimated-time: 60
---

1) Our input data
-----------------

In the following section we will give you a gentle introduction on how to create a component for BioJS 2.0.
As a case study, we will build a simple parser to read SNPs from Manny.
In the next tutorial we will show you how to visualize this data.  

{% alert warn %}
We assume that you have successfully [bootstrapped]({{sitebaseurl}}/101/bootstrapping) a new BioJS package.
{% endalert %}

You can play with the result of this tutorial on [JSBin](http://jsbin.com/kogewi/1/edit?js,console).

2) Our input data
------------------

First we will have a look at the data. The whole file is a set of ~500K SNPs (Simple Nucleotide Polymorphisms) from [@manuelcorpas][manuelcorpas]). These SNPs come from a saliva sample genotyped using the SNP chip version 2 from [23andMe](https://www.23andme.com/), a personal genomics provider.

SNPs are the minimal unit of genetic variation that an organism may have and correspond to a single letter change in the DNA sequence of an organism (in this case [@manuelcorpas][manuelcorpas]).  

[manuelcorpas]: http://manuelcorpas.com

This file is available at [`files.biojs.net/chromosome/manny`](http://files.biojs.net/chromosomes/manny).

The file is structured as follows:

~~~
rsid chromosome pos genotype
~~~


Genotype is the field that tells us exactly what the sequence looks like at a particular position. It is important to note that Genotype usually has two letters, because, as you may remember from high school biology, humans have two pairs of each chromosome. Well, mostly, unless you are a male, in which case you only have a lonely X copy with a tiny Y chromosome.

There are 3 types of genotypes that we will look at in this example.

1. If the same letter is present in both copies, then we say that we have a homozygous SNP; e.g.: AA, TT, GG, CC.
2. If the letters are different, then we have a heterozygous SNP: AT, GC, etc.
3. The position might have been delete in both or either chromosome: --, A-, -G, etc.

These three fields in each feature line are required:

* `rsid` (String): SNP id
* `chromosome` (String): name of the chromosome
* `pos` (int): position in the chromosome
* `genotype`: (String) both residues from the two matching chromosomes (warning: mitochondria (MT) or Y chromosome are haploid)

{% hlblock info %}
For detailed info about the BED format, visit the [ensembl doc](http://www.ensembl.org/info/website/upload/bed.html) or the [UCSC help](http://genome.ucsc.edu/FAQ/FAQformat.html#format1)
{% endhlblock %}


For example:

~~~
rs5747620	20	15412698	TT
rs9605903	20	15434720	CC
rs2236639	20	15452483	GC
rs5747999	21	15455353	AA
rs11089263	21	15467656	A-
rs2096537	21	15474749	AC
rs9604959	22	15479107	CG
rs9604967	22	15492342	CC
~~~


{% hlblock info %}
To make this tutorial as easy as possible, we will only work with this static example. In the [extended parsing]({{site.baseurl}}/snipspector_adv/parser_real_data) you will learn how to parse the real file with 500,000 rows.
{% endhlblock %}

3) Export your component
------------------------

Now it is time to export your component in order to provide your functionality with the other BioJS components or in your module (e.g your first test case).
We use [CommonJS Syntax](http://wiki.commonjs.org/wiki/Modules/1.1) to export modules in BioJS.

Please export your parser in the following way:

~~~
var snipspector = { }

snipspector.parse = function() {
    ...
}

module.exports = snipspector;
~~~

Other BioJS components are able to include your component by using

~~~
var snipspector = require('biojs-io-snipspector');
snipspector.parse();
~~~

Instead of requiring packages, you can also require files:

~~~
var snipspector = require('../lib/index');
snipspector.parse();
~~~

{% hlblock info %}
The path can be either relative `../lib/index.js` or simply the package name `biojs-io-snipspector`.
{% endhlblock %}

{% hlblock info %}
There is an [excellent guide](https://github.com/maxogden/art-of-node#how-require-works) on how the `require` command works under the hood.
{% endhlblock %}

4) The first testcase
----------------------

Write the following file to the test folder of your Biojs package directory.

~~~
var assert = require("chai").assert;
var tutorial = require("../");

// you can find more documentation about mocha here
// https://visionmedia.github.io/mocha/

describe('Snipspector', function(){
  // do any init stuff here
  beforeEach(function(){
    snipspector = tutorial.parse;
  });
  describe('parse', function(){
    it('should return match with default object', function(){
      dummyObj = [{name: "20", homo: 2, hetero: 1, del: 0},
                  {name: "21", homo: 1, hetero: 1, del: 1}, 
                  {name: "22", homo: 1, hetero: 1, del: 0 }];
      assert.deepEqual(snipspector(), dummyObj);
    });
  });
});
~~~
We already provide you with one test case, in the next section we will show you how to fix this unit test.
You can execute the test suite with:

~~~
npm test
~~~

It is really ok if you see errors here - you will fix them later ;-)

{% hlblock info %}
In this tutorial we use [Mocha](https://visionmedia.github.io/mocha/) as JavaScript test framework.
However you can use your favorite - you only need to change the `test` command in the `scripts` section of your `package.json`.
{% endhlblock %}


5) Start coding
----------------

It is time to code!
To begin please open now the `lib` folder and access the `index.js` file.

{% hlblock info %}
You can find the code for this exercise on [github](https://github.com/biojs/biojs-tutorial-template-snp).
{% endhlblock %}

First have a look at the provided code.

~~~
var snipspector = {};

snipspector.parse = function() {

    var data = ["rs5747620	20	15412698	TT",
    "rs9605903	20	15434720	CC",
    "rs2236639	20	15452483	GC",
    "rs5747999	21	15455353	AA",
    "rs11089263	21	15467656	A-",
    "rs2096537	21	15474749	AC",
    "rs9604959	22	15479107	CG",
    "rs9604967	22	15492342	CC"];

    var chromosomes = [];

    // analyze snippets
    // homo(zygous): AA
    // hetero(zygous): AC
    // del(etion): A-, -A or --
    for (var i = 0; i < data.length; i++) {
        // Please fill in your code here!
    }

    console.log(chromosomes);

    return chromosomes;
}

snipspector.parse(); //Should print [{name: "20", homo: 2, hetero: 1, del: 0,
                     // {name: "21", homo: 1, hetero: 1, del: 1},
                     // {name: "22", homo 1, hetero: 1, del: 0 }]

module.exports = snipspector; // Export the object for other components
~~~

You can always run your application directly with with Node, like this:

~~~
node index.js
~~~

{% hlblock help %}
If you are new JavaScript or have not coded for a while, you might want to check out this [Cheatsheet](http://overapi.com/javascript/).
Or this one for a short fresh up of [variables](http://thewebivore.com/wp-content/uploads/2013/02/PamsJavascriptCheatSheet.pdf).
{% endhlblock %}


6) Your first, big task
---------------------


{% hlblock task %}

Please fill in the missing code inside the for loop so that `snipspector.parse()` counts all homozygous, heterozygous and deleted SNPs. Your task is to count the number or homozygous, heterozygous and deleted SNPs per chromosome. Note that heterozygous deletions are counted as deletions only, not heterozygous SNPs. If you have done a great job your unit test will turn green!

{% endhlblock %}


Sample of format:

~~~
[{name: "chrname", homo: 2, hetero: 0, del: 1}]
~~~

7) Verify your solution
----------------

{% hlblock stop %}

No please do __NOT__ have a look at our solution, if your unit test is green -
your solution is correct!
Please only continue if your solution is working.

{% endhlblock %}

__Solution:__

{% code javascript collapsible=true %}
var snipspector = {};

snipspector.parse = function() {

    var data = ["rs5747620	20	15412698	TT",
    "rs9605903	20	15434720	CC",
    "rs2236639	20	15452483	GC",
    "rs5747999	21	15455353	AA",
    "rs11089263	21	15467656	A-",
    "rs2096537	21	15474749	AC",
    "rs9604959	22	15479107	CG",
    "rs9604967	22	15492342	CC"];

    var parsed = [];

    // analyze snippets
    // homo(zygous): AA
    // hetero(zygous): AC
    // del(etion): A-, -A or --

    var chr = null;
    for (var i = 0; i < data.length; i++) {
      var row = data[i].split(/\s+/);
      var chrName = row[1];

      // new chromosome begins
      if( chr == null ||  chrName !== chr.name) {
        // ignore the first time
        if( chr != null ){
          parsed.push(chr);
        }
        chr = {homo: 0, hetero: 0, del: 0};
        chr.name = chrName;
      }

      var genotype = row[3];
      if( genotype.length == 2){
        // ignore MT
        if(genotype[0] == genotype[1] && genotype[0] != "-"){
          // homo
          chr.homo = chr.homo + 1;  
        } else if( genotype[0] != "-" && genotype[1] != "-"){
          // hetero
          chr.hetero = chr.hetero + 1;  
        }else{
          // del
          chr.del = chr.del + 1;  
        }
      }
    }
    // push the last item
    parsed.push(chr);

    return parsed;
}

snipspector.parse(); //Should print [{name: "20", homo: 2, hetero: 1, del: 0,
                     // {name: "21", homo: 1, hetero: 1, del: 1},
                     // {name: "22", homo 1, hetero: 1, del: 0 }]

module.exports = snipspector; // Export the object for other components
{% endcode %}

You can also browse the solution at [github](https://github.com/biojs-edu/biojs-io-snipspector/tree/basic_packaging) or play with it on [JSBin](http://jsbin.com/kogewi/1/edit?js,console).

8) Publish your component
-------------------------

Congratulations! You wrote your very first Biojs 2 Component. You can now publish it on github and it is ready to be used by everybody.

{% hlblock info %}
If you are unfamiliar with git, check out the [Git guide](https://rogerdudler.github.io/git-guide/) or [15 minutes interactive lesson](https://try.github.io/levels/1/challenges/1) by Codeschool.
{% endhlblock %}

Furthermore, consider to [publish]({{site.baseurl}}/101/publish_it/) your future components to npm.
In the next tutorial, you will learn [how to create a visualization component]({{site.baseurl}}/snipspector/vis_basics) using your newly build `biojs-io-snipspector` component.

{% hlblock info %}
You can find the complete solution of this package on [github](https://github.com/biojs-edu/biojs-io-snipspector/tree/basic_packaging) and [npm](https://www.npmjs.org/package/biojs-io-snipspector).
{% endhlblock %}
