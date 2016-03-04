---
title: 'Bootstrapping'
layout: series_item
series: '101'
permalink: /101/bootstrapping/
estimated-time: 20
---

{% alert warn %}
You need to install `npm` before you can start to rock. See <a href="/101/getting_started/"> the getting started guide </a> for more info.
{% endalert %}


1) Create a new package
--------------------------------------------

We use a special [slush generator](https://github.com/biojs/slush-biojs) to bootstrap a new BioJS project.
(you don't need to use it, but it simplifies the work and is specifically targeted towards beginners)

{% alert warn %}
On Linux and Mac you will need to prepend `sudo` for global (`-g`) installations or [configure](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md) global installations into your home directory.
{% endalert %}


### 1.1) Install slush

~~~
npm install -g slush slush-biojs
~~~

(`slush-biojs` is updated frequently, therefore update it from time to time)

`-g` stands for global installation, will download the npm packages to your global npm path (e.g. `/usr/lib/node_modules`) and add the executables
to your `PATH` variable. If you want to install globally into your home directory without using `sudo`, have a look at [this guide](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md) or use [nvm](https://github.com/creationix/nvm).

### 1.2) Bootstrap your new project
{% hlblock info %}
For BioJS 2 components, we have following naming recommendations:

__biojs-[io/rest/vis/algo/...]-[name]__

- Use `io` for components which are responsible for parsing data into a specific format (aka parser)
- Use `vis` for components which are visualizing data sets
- Use `rest` for REST APIs to databases
- Use `algo` for server/client side algorithms processing the data (e.g. alignments, neural networks, markov models, graph algorithms)

If you have a better name for your package, feel free to use it.
This is more of a guideline for when you don't feel like being creative.
{% endhlblock %}

To use our Slush generator create a directory, change into it and run the generator.
Like this:
~~~
mkdir <your-project>
cd <your-project> && slush biojs
~~~

The generator will then create a directory structure and a number of useful files for you, including the package.json 
and license files.

### 1.3) Fill your package with life

#### 1.3.a) Example for bootstrapping a parser

~~~
? Module name? (required) biojs-io-clustal	
? Description? Parses Clustal alignment files
? Module version? 0.1.0
? Author name? greenify
? Author email? <hidden>
? Github username? greenify
? Keywords for npm (separate with comma) clustal, alignment
? A visualization lib? No
? Unit tests: Yes
? Configure a build system? (Gulp) No
? Linting (Check code style with JSHint) No
? Choose your license type: MIT
? Is this correct? Yes
~~~

#### 1.3.b) Example for bootstrapping a visualization component

~~~
? Module name? (required) biojs-vis-seqlogo
? Description? A sequence logo visualizer
? Module version? 0.1.0
? Author name? greenify
? Author email? <hidden>
? Github username? greenify
? Keywords for npm (separate with comma) hmm, logo, seqlogo
? A visualization lib? Yes
? Unit tests: No
? Add a example css file? No
? Configure a build system? (Gulp) No
? Linting (Check code style with JSHint) No
? Choose your license type: MIT
? Is this correct? Yes
~~~

### 1.4) Resulting file structure

The exact structure might vary depending on the settings you choose in slush.
Nevertheless in almost all packages you will find these following six items:

* [`package.json`][package.json]: Information about your package: author, version, …
* `lib` : Folder including your real source code
* `.gitignore`: Files that should be ignored by the git versioning system
* `LICENSE`: The license under which you want your source code to be distributed, e.g. MIT or Apache 2

[package.json]: https://github.com/biojs/biojs/wiki/BioJS-sections-in-the-package.json

You probably never have to modify the last two:

* `node_modules`: all npm packages of your packages
* `build`: target dir for all browserified, minified js or css resources

You can find an overview of all automatically configured npm tasks [here](https://github.com/biojs/slush-biojs).

### Optionally you might find

* [`examples`][examples] (previously: `snippets`): Folder containing visualization examples
* `test`: Folder containing unit tests
* [`css`][css]: Folder contain all stylesheets (SASS and LESS files can be added via transforms)
* `src`: Sometime used as main source folder or by projects with Coffee-Script (those projects transpile the source folder `src` to `lib`)

[css]: https://github.com/biojs/biojs/wiki/Adding-CSS-stylesheets
[examples]: https://github.com/biojs/biojs-sniper

### 1.5) Confirm your installation

If everything went okay, you the following commands should have a similar output

IO packages: `npm test`  
A simple, default test should pass.

~~~
  biojs-io-awesome-parser module
    #hello()
      ✓ should return a hello 

  1 passing (6ms)
~~~

Visualization packages: `npm run w`:
It should start a local webserver and you should see a hello world at [http://localhost:9090/examples](http://localhost:9090/examples) example snippet.

~~~
starting:  'npm run sniper','npm run watch'
[npm-run-sniper]: > biojs-vis-awesome-vis@0.1.0 sniper /tmp/biojs-vis-awesome-vis
[npm-run-sniper]: > sniper .
[npm-run-watch]: > biojs-vis-awesome-vis@0.1.0 watch /tmp/biojs-vis-awesome-vis
[npm-run-watch]: > watchify -r ./:biojs-vis-awesome-vis -v -o build/vis.js
[npm-run-sniper]: running: http://localhost:9090
[npm-run-sniper]: DIR:.
[npm-run-watch]: 1218 bytes written to build/vis.js (0.02 seconds)
~~~

### 1.6) Frequent errors

`[...] not found` or "Cannot find module xyz"   

* Check whether you have a `node_modules` folder
* If `node_modules` does _not_ exist, run `npm install` 
* If `node_modules` does exist, run `rm -r node_modules && npm install` 
* When your still experience the same error, check whether the missing module is part of your `package.json`
* Most common reason: Your npm installation is outdated (especially on Ubuntu/Debian) -> update npm to `2.x`.
* If you still experience a problem, don't hesitate to contact us

### 1.7) Install watchify & sniper (optional)

`slush-biojs` should install these packages all npm dependencies and you can run them
without installing them globally. However if you are lazy, you can install them as shortcuts.

~~~
npm install -g watchify sniper browserify
~~~

`Watchify`: Listens for file changes and incremental runs `browserify`  
`Browserify`: A tool that lets you `require('modules')` in the browser by bundling up all of your dependencies  
`Sniper`: Simulates the BioJS registry and allows you to load files from your disk (it is a local file server)  

With a global installation you can run `sniper instead of `npm run sniper`.


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

(only available if you enabled it, by default for parsers)

~~~
npm test
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
