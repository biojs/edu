---
title: 'Package.json'
layout: series_item
series: 'details'
estimated-time: 10
---

{% hlblock info %}
All the following parameters can be added or changed in your `package.json`
{% endhlblock %}

### Biojs specific parameters

* `logo`: alternative project logo (default: github avatar)
* `registryHeight`: height of the registry iFrame for your first example (default: 400)
* `publication`: PMID (Pubmed Id) to the most recent citation (can also be an array)

~~~
"biojs": {
  "logo": "",
  "registryHeight": "400",
}
~~~

### [Parcelify params](https://github.com/rotundasoftware/parcelify)

Specify css files for browserify (behaves like main for js)

~~~
style: "main.css"
~~~

### [BioJS2Galaxy params](https://github.com/biojs/biojs2galaxy)

~~~
"galaxy": {
  "datatypes": []
}
~~~


### [General npm params](https://www.npmjs.org/doc/files/package.json.html)

* name
* version
* description
* keywords (use "biojs")
* homepage
* license
* contributors
* main
* repository

### Optional params

* author
* bugs
* bin
* scripts
* dependencies
* devDependencies

### Contributors

~~~
[{ "name" : "Barney Rubble"
, "email" : "b@rubble.com"
, "url" : "http://barnyrubble.tumblr.com/"
},{ "name" : "Barney Rubble 2"
, "email" : "b2@rubble.com"
, "url" : "http://barnyrubble2.tumblr.com/"
}]
~~~

### [Snippets](https://github.com/biojs/biojs-sniper)

~~~
 "sniper": {
    "js": ["/build/msa.js"],
    "css": ["/css/msa.css"],
    "snippets": ["examples"],
    "first": "msa_show_menu"
  }
~~~

optional attributes:

* `buildCSS` (will replace `css`)
* `buildJS` (will replace `js`)

The `build` attributes can be used to specify alternative locations - in any case the registry will ignore js resources starting with `build`.

{% hlblock info %}
Do you want to [learn more](https://github.com/biojs/biojs-sniper) about the `sniper`?
{% endhlblock %}
