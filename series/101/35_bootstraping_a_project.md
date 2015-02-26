---
title: 'Bootstrapping'
layout: series_item
series: '101'
permalink: /101/bootstrapping/
estimated-time: 20
---

{% alert warn %}
You need to install `npm` before you can start to rock. See <a href="{{site.baseurl}}/101/getting_started/"> the getting started guide </a> for more info.
{% endalert %}


1) Create a new package
--------------------------------------------

We use a special [slush generator](https://github.com/biojs/slush-biojs) to bootstrap a new BioJS project.
(you can don't need to use it, but it simplifies the work and is especially aimed at newcomers)

{% alert warn %}
On Linux and Mac you will need to prepend `sudo` for global (`-g`) installations
{% endalert %}


1) Install slush

~~~
npm install -g slush slush-biojs
~~~

2) Install watchify & sniper (optional)

~~~
npm install -g watchify biojs-sniper
~~~

`Watchify`: Listens for file changes and incremental runs `browserify`
`Browserify`: A tool to lets you `require('modules')` in the browser by bundling up all of your dependencies
`Sniper`: Simulates the BioJS registry and allows you to load files from your disk (it is a local file server)

3) Bootstrap your new project

~~~
mkdir <your-project>
cd <your-project> && slush biojs
~~~

4) Answer all questions

Our first component will be a pure parser, so you can answer `no` when being asked
for visualization support (the next tutorial will use this parser for a visualization).

~~~
? Module name?: biojs-vis-msa
? Description?: An awesome BioJS component
? Module version?: 0.1.0
? Author name?: greenify
? Author email?: <hidden>
? Github username?: greenify
? Enter keywords for npm (separate with comma): visualization,msa,alignment
? A visualization lib? No
? Unit tests: Yes
? Configure a build system? (Gulp) Yes
? Linting (Check code style with JSHint) No
? Choose your license type: Apache 2
? Is this correct? (Y/n) Yes
~~~


Inside the folder you find following files:

- `.gitignore`: Files that should be ignored by the git versioning system
- `LICENSE`: The license under which you want your source code to be distributed, e.g. MIT or Apache 2
- `index.js`:  Index file over all submodules
- `package.json`: Information about your package: author, version, ...
- `lib` : Folder including your real source code
- `test`: Folder containing your first unit test

(More detailed information will be given later in this tutorial)

{% hlblock info %}
For BioJS 2 components, we have following naming recommendations:

__biojs-[io/rest/vis/algo/...]-[name]__

- Use `io` for components which are responsible for parsing data into a specific format (aka parser)
- Use `vis` for components which are visualizing data sets
- Use `rest` for REST apis to databases
- Use `algo` for server/client side algorithms processing the data (e.g. alignments, neural networks, markov models, graph algorithms)

If you have a better name for your package, please use it.
This naming guideline is only if you are not that creative (like us).
{% endhlblock %}

2) Available commands
----------------------

### 2.1. Snippets (only available for visualization -> skip)

Allows you to write minimal example [snippets](https://github.com/biojs/sniper) of your visualization.
These snippets will be used for the [BioJS registry](http://biojs.io).

~~~
npm run sniper
~~~

and open [http://localhost:9090/snippets](http://localhost:9090/snippets). See the [Sniper repository](https://github.com/biojs/sniper) for more details.


### 2.2. Watchify

Watches all your files and runs [browserify](http://browserify.org) on every change.
Combine this with the sniper.
(Subsequent runs of watchify are fast).

~~~
npm run watch
~~~

Enjoy.

### 2.3. Tests

(only if you enabled it)

~~~
npm run test
~~~

They are grouped into two sections:

* Non-DOM `gulp test-unit` (folder: `test/unit`)
* DOM-only `gulp test-dom` (folder: `test/dom`)

Gotchas:

* The Unit tests are run with PhantomJS, if you want to debug them open the `test/index.html`
your browser.
* You need to add your _DOM_ tests to the `test/dom/index.js`.

If you want to auto-execute all your test on a file change, run:

~~~
gulp test-watch
~~~

{% hlblock info %}
You can customize the sniper sections with a [local configuration file](https://github.com/biojs/slush-biojs#configuration)
{% endhlblock %}

### 2.4. More tasks

Depending on the settings you select, the slush bootstraper might add more tasks.
You can see [here](https://github.com/biojs/slush-biojs) the entire list.
