---
title: 'Using the Ensemble REST API'
layout: tutorial-container
author: David Dao
category: howto
series: howto
estimated-time: 5
---

### BioJS REST API for accessing Ensembl.org

Include this link inside your html

~~~
<script src="http://daviddao.de/biojs-rest-ensembl.min.js"></script>
~~~

or download the latest version directly from our github repository:

~~~
git clone https://github.com/biojs/biojs-rest-ensembl.git
cd biojs-rest-ensembl
npm install
npm run build-browser
~~~

First define a `var rest` to save the Ensembl REST Object.

~~~
var rest = biojs.rest.ensembl.eRest();
~~~

Then select the gene tree id you want to get from the Ensembl site.
For example:

~~~
	var gene_tree_id = "ENSGT00390000003602";
	var gene_tree_url = rest.url.gene_tree({
	    id : gene_tree_id
	});
~~~

Our method `rest.url.gene_tree()` will automatically fetch the URL for you.
Now call it using the `call` method:

~~~
	rest.call ({url : gene_tree_url,
		    success : data;
		   });
    };
~~~

And the Ensembl gene tree data will be contained as JSON file in `data`!
It can be now visualized for example via the [tree viewer component](usingTreeViewerComponentTutorial.html)

* * * * *

Thanks for following this tutorial, we hope you have enjoyed it. If you want to know more about BioJS 2.0, you can go to our [registry](http://www.ebi.ac.uk/Tools/biojs/registry/), or visit our [GitHub repository](https://github.com/biojs/biojs2), or participate in our [mailing list](https://groups.google.com/forum/#!forum/biojs).

This tutorial has been done by David Dao. 
