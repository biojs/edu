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

We use a customized [slush generator called slush-biojs](https://github.com/biojs/slush-biojs) to bootstrap each new BioJS project.
`slush-biojs` helps you to get started with creating your own BioJS component, by creating a directory structure and a number of useful files for you, including the package.json for maintaining all your other project dependencies and license files.

If you are a beginner it is highly recommended to use the slush generator by following the steps on this tutorial page. 

{% alert warn %}
On Linux and Mac you will need to prepend `sudo` for global (`-g`) installations or [configure](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md) global installations into your home directory.
{% endalert %}


### 1.1) Install slush

Before creating your first slush-generated BioJS component, you will have to install the required tools via the terminal as follows:

First, install `slush` with the following command:

~~~
npm install -g slush
~~~

After the installation has finished successfully, it's time for you to install `slush-biojs` as well. You can do it like this:

~~~
npm install -g slush-biojs
~~~

`-g` stands for global installation, will download the npm packages to your global npm path (e.g. `/usr/lib/node_modules`) and add the executables
to your `PATH` variable. If you want to install globally into your home directory without using `sudo`, have a look at [this guide](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md) or use [nvm](https://github.com/creationix/nvm).


`slush-biojs` is updated frequently, so make sure to update it from time to time.

### 1.2) Bootstrap your new project
{% hlblock info %}
For BioJS 2 components, we recommend the following naming conventions:

__biojs-[io/rest/vis/algo/...]-[name]__

- Use `io` for components which are responsible for parsing data into a specific format (aka parser)
- Use `vis` for components which are visualizing data sets
- Use `rest` for REST APIs to databases
- Use `algo` for server/client-side data processing algorithms (e.g. alignments, neural networks, markov models, graph algorithms)

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

When initialising the slush generator in your project, you will be prompted with a couple of questions
which help you to setup your `package.json` file. If you are unsure about what to fill in, you can use the two configuration examples below as a guideline:

#### 1.3.a) Package.json configuration example for bootstrapping a parser

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



#### 1.3.b) Package.json configuration example for bootstrapping a visualization component

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

After you confirm your entries by answering the final question with a Yes, `slush-biojs` will start installing dependencies 
and setting up a suitable directory structure. This process might take up to 10 mins, so please be patient and
enjoy a cup of coffee in the meanwhile.

### 1.4) Resulting file structure

The exact structure might vary depending on the settings you choose in slush.
Nevertheless in almost all packages you will find the following six items:

* [`package.json`][package.json]: Information about your package: author, version, …
* `lib` : Folder including your real source code
* `.gitignore`: Files that should be ignored by the Git versioning system
* `LICENSE`: The license under which you want your source code to be distributed, e.g. MIT or Apache 2

[package.json]: https://github.com/biojs/biojs/wiki/BioJS-sections-in-the-package.json

You probably never have to modify the last two:

* `node_modules`: all npm packages of your package
* `build`: target dir for all browserified, minified js or css resources

You can find an overview of all automatically configured npm tasks [here](https://github.com/biojs/slush-biojs).

### Optionally you might find

* [`examples`][examples] (previously called: `snippets`): Folder containing visualization examples
* `test`: Folder containing unit tests
* [`css`][css]: Folder containing all stylesheets (SASS and LESS files can be added via transforms)
* `src`: Sometime used as main source folder or by projects with Coffee-Script (those projects transpile the source folder `src` to `lib`)

[css]: https://github.com/biojs/biojs/wiki/Adding-CSS-stylesheets
[examples]: https://github.com/biojs/biojs-sniper

### 1.5) Confirm your installation

If everything went okay, you should check your BioJS project setup with the following commands, depending on your type of component:

#### 1.5.a) IO packages 

Run the following command in your terminal to test if your project is set up properly:

~~~
npm test
~~~

A simple, default test should pass.

~~~
  biojs-io-awesome-parser module
    #hello()
      ✓ should return a hello 

  1 passing (6ms)
~~~

#### 1.5.b) Visualization packages

First prebuild your component, so it can be checked in the browser afterwards. You can build your BioJS project with this command:

~~~
npm run build
~~~

After this task has completed, spin up a local webserver hosting your BioJS project with this short command:

~~~
npm run w
~~~

You should see some output like this in your terminal:

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

Visit your example page, which will greet you with a short "hello world", at this URL: [http://localhost:9090/examples/simple](http://localhost:9090/examples/simple){:target="_blank"}.


If these tests fail, checkout the following frequent errors to fix your current setup:

### 1.6) Frequent errors

`[...] not found` or "Cannot find module xyz"   

* Check whether you have a `node_modules` folder
* If `node_modules` does _not_ exist, run `npm install` 
* If `node_modules` does exist, run `rm -r node_modules && npm install` 
* If the error persists, check whether the missing module is part of your `package.json`
* Most common reason: Your npm installation is outdated (especially on Ubuntu/Debian) -> update npm to `2.x`.
* If you still experience a problem, don't hesitate to contact us

### 1.7) Install watchify & sniper (optional)

`slush-biojs` should install these packages as npm dependencies, and you can run them
without installing them globally. However if you are lazy, you can install them as shortcuts.

~~~
npm install -g watchify sniper browserify
~~~

`Watchify`: Listens for file changes and incrementally runs `browserify`
`Browserify`: A tool that lets you `require('modules')` in the browser by bundling up all of your dependencies
`Sniper`: Simulates the BioJS registry and allows you to load files from your disk (it is a local file server)

With a global installation you can run `sniper` instead of `npm run sniper`.


2) Available commands
----------------------

### 2.1. Snippets (only available for visualization -> skip)

Allows you to write minimal example [snippets](https://github.com/biojs/sniper) of your visualization.
These snippets will be used for the [BioJS registry](http://biojs.io).

~~~
npm run sniper
~~~

and open [http://localhost:9090/examples](http://localhost:9090/examples). See the [Sniper repository](https://github.com/biojs/sniper) for more details.


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

* The Unit tests are run with PhantomJS. If you want to debug them, open
`test/index.html` in your browser.
* You need to add your _DOM_ tests to `test/dom/index.js`.

If you want to auto-execute all your tests on a file change, run:

~~~
gulp test-watch
~~~

{% hlblock info %}
You can customize the sniper sections with a [local configuration file](https://github.com/biojs/slush-biojs#configuration)
{% endhlblock %}

### 2.4. More tasks

Depending on the settings you select, the slush bootstrapper might add more tasks.
You can see the entire list [here](https://github.com/biojs/slush-biojs).
