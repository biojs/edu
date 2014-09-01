---
title: 'Using the Newick Parser'
layout: tutorial-container
contributors: David Dao
category: howto
series: howto
estimated-time: 5
---

### BioJS Newick-Parser  

Installing the Newick Parser component is very easy.

Include this link inside your html

~~~
<script src="http://daviddao.de/biojs-io-newick.min.js"></script>
~~~

or download the latest version directly from our github repository:

~~~
git clone https://github.com/biojs/biojs-io-newick.git
cd biojs-io-newick
npm install
npm run build-browser
~~~

Just call `Biojs.io.newick.parse_nwk(string)` for parsing a newick string. 

~~~
Biojs.io.newick.parse_nwk('((A,B),C)');
~~~

Call `Biojs.io.newick.parse_nhx(string)` for parsing an extended newick format.

~~~
Biojs.io.newick.parse_nhx('((A,B),C)');
~~~

Example tree (from http://en.wikipedia.org/wiki/Newick_format):

Newick format:

~~~
(A:0.1,B:0.2,(C:0.3,D:0.4)E:0.5)F
~~~

Converted to JSON:

~~~
{name : "F",
  children: [
    {name: "A", branch_length: 0.1},
    {name: "B", branch_length: 0.2},
    {
      name: "E",
      length: 0.5,
      children: [
        {name: "C", branch_length: 0.3},
        {name: "D", branch_length: 0.4}
      ]
    }
  ]
}
~~~

The JSON data can be now given i.e. to the [tree viewer component](usingTreeViewerComponentTutorial.html)!

* * * * *

Thanks for following this tutorial, we hope you have enjoyed it. If you want to know more about BioJS 2.0, you can go to our [registry](http://www.ebi.ac.uk/Tools/biojs/registry/), or visit our [GitHub repository](https://github.com/biojs/biojs2), or participate in our [mailing list](https://groups.google.com/forum/#!forum/biojs).

This tutorial has been done by David Dao. 
