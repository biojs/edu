---
title: 'Package.json'
layout: series_item
series: 'details'
permalink: details/package_json/
estimated-time: 10
---

{% hlblock info %}
All the following parameters can be added or changed in your `package.json`
{% endhlblock %}

### Biojs specific parameters

* `logo`: alternative project logo (default: github avatar)
* `registryHeight`: height of the registry iFrame for your first example (default: 400)
* `publication`: PMID (Pubmed Id) to the most recent citation (can also be an array)
* `testing_service`: testing service used (`travis`, `drone.io`, `circleci`, `snapci`, ...)

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

The `build` attributes can be used to specify alternative locations - e.g. for `js` the registry will ignore `js` in favor of `buildJS` while the local sniper will still read the `js` attribute.
This is useful if you want to work with an unminified, local library version and ship a CDN version at biojs.io.
Consider this short example:

~~~
  "js": [
     "external/soundjs.js"
  ]
  "buildJS": [
      "https://cdnjs.cloudflare.com/ajax/libs/SoundJS/0.6.0/soundjs.min.js"
  ],
~~~

{% hlblock info %}
Do you want to [learn more](https://github.com/biojs/biojs-sniper) about the `sniper`?
{% endhlblock %}
