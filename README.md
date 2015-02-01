edu.biojs.net
=============

Share resources with the general public.

[![Build Status][travis]](https://travis-ci.org/biojs/edu)

(uses [s3_website](https://github.com/laurilehmijoki/s3_website) and [Travis][travis] for CI deployment).

[travis]: https://travis-ci.org/biojs/edu.svg?branch=master

How to contribute
---------------

For now here is a simple formula:

1. Fork the repository at [Github](https://github.com/biojs/edu)
2. Do awesomeness!
3. Send a pull request to [biojs/edu](https://github.com/biojs/edu)
4. Go back to step 2 and stay there as long as you want.
5. If we merge two or three pull requests, you get commit access. BAM.


Contributor list
----------------

Don't be shy - add yourself to the contributors list of an article.
The names are sorted alphabetically.

About jekyll
-----------

[Jekyll](http://jekyllrb.com/) is awesome.

```
jekyll serve -w
```
(runs jekyll locally in the server mode + watching for changes)

[Install](http://jekyllrb.com/docs/installation/) jekyll.


Problems with jekyll?
--------------------

Try to install a recent version

```
gem install jekyll
```

or use [bundler](http://bundler.io/) (virtualenv for ruby).

```
gem install bundler
bundle install # in your edu root folder
# this will install the dependencies specified in the Gemfile & Gemfile.lock
bundle exec jekyll serve -w # this will execute jekyll with your bundles in the virtualenv
```

Jekyll layouts
-----------------

* `default`: the root layout (all layouts inherit from this)
* `container`: layout used for static pages, e.g. the start page (inherits from `default`)
* `series`: layout used to display the series menu on the right (inherits from `default`)
* `series_overview`: layout used to generate the category overview (inherits from `series`)
* `series_item`: layout used to generate a page within a series (inherits from `series`)


Special blocks: hlblock
--------------

````
{% hlblock question %}
Do you like BioJS?
{% endhlblock %}
```

Available types include at the moment:

* `task`: use this to assign tasks to your students
* `questions`: ask your readers questions
* `check`: checkpoint & verification
* `stop`: use this before you show a solution
* `info`: additional info and references
* `help`: tips, help, ...
* `raise`: (currently not used)

Special blocks: code
------------------------

We use `kramdown`, there you should use `~~~` to begin and mark a code block.
To enforce a language or make it collapsible (e.g. for solutions) you can use the `code` block.

```
{% code javascript collapsible=true %}
console.log("You can put this code block anywhere in your tutorial");
{% endcode %}
```

Add your own series
--------------------

It is super simple:

* add it to the `_config.yml`
* create a new folder in `series` (the name has to be identical with the `key` of your series in the `_config.yml`)
* add new pages to your series folder (don't forget to set your series in the header)
