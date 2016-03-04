---
title: 'Getting started'
layout: series_item
series: '101'
permalink: 101/getting_started/
estimated-time: 5
---

#### This page will help you prepare your computer for work with BioJS

You will need to work in a terminal using __`npm`__ and __`git`__. 
* [Git](https://github.com) is a version control system that will keep track of the changes you have made in code.
* [Node.js](http://nodejs.org) is a 'runtime environment platform for server-side JavaScript applications'. 
Node's package managing system is called [npm](https://www.npmjs.com).


{% hlblock check %}

Open your terminal of choice and check whether you have both commands (`npm`, `git`) installed. You should run these without
any error.

~~~
git help
npm help
~~~

{% endhlblock %}

If your machine is already set up, continue to the [tutorial](/101/modularity).

Otherwise, choose your operating system below to learn more: 

- [__Mac__](#mac)
- [__Linux__](#linux)
- [__Windows__](#windows)


{% hlblock info %}
If you want to fresh up your `git` skills, check out the [Git guide](https://rogerdudler.github.io/git-guide/) or [15 minutes interactive lesson](https://try.github.io/levels/1/challenges/1) by Codeschool.
{% endhlblock %}

{% hlblock question %}
What does `npm` stand for?
{% endhlblock %}

<a name="mac"></a>

### Mac OSX

On Mac we recommend installing git and node.js via [Homebrew](http://brew.sh). Homebrew is called the 'missing package manager for OS X'. 
It allows you to download packages onto your Mac from your command line.
Homebrew, git and node.js are packages worth having if you want to do software development on your Mac.
  
To get started, open a Terminal session first.

Then install Homebrew using this command:

~~~
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # brew is a package manager
~~~

Homebrew is quite a large package so downloading can take a while depending on your internet connection.

Then use Homebrew to install node.js:

~~~
brew install node
~~~

If you have not installed `git`, this command uses homebrew to install git:

~~~
brew install git
~~~

Check if the installation was successful by typing "git help" and "npm help" into the command line again.

Alternatively you can also install node.js via the [package installer](http://nodejs.org/download/) and  download [Github for Mac](https://mac.github.com/).


<a name="linux"></a>

### Linux

{% hlblock help %}
Install nodejs via [your package manager](https://github.com/joyent/node/wiki/installing-node.js-via-package-manager)
{% endhlblock %}

E.g.

~~~
curl -sL https://deb.nodesource.com/setup | sudo bash - # Ubuntu, Debian
pacman -S nodejs #  Arch
emerge nodejs # Gentoo
yum install npm # Fedora
~~~


{% hlblock info %}
If you want to avoid installing packages with sudo, you can use the node version manager [nvm.](https://github.com/creationix/nvm)
Install it like this:

~~~
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash # install nvm
~~~

Then set the most recent node version (or LTS in this case) as your default:

~~~
nvm install 4.2.2 && nvm alias default 4.2.2 && nvm use default # install node & npm in userenv
~~~

{% endhlblock %}

Now you can install node packages like this:

~~~
npm install drawrnajs
~~~

<a name="windows"></a>

### Windows

Windows is definitely not the preferred operating system for software development of this kind. So some additional 
and often unexpected effort will probably be necessary to get everything running. 
Be warned that some packages just assume that they have a UNIX-like environment. So consider using Linux or Mac OS if you have choice.

If you don't have a choice or want to try anyway, installing git and npm on windows is still easy:
Just download & install using the Windows installer for [node](http://nodejs.org/download/) and [git](https://git-scm.com/).

After installation, you can use the Git Bash terminal for both npm and git commands in a UNIX-like environment. 

Another possibility would be the [Cygwin](http://www.mcclean-cooper.com/valentino/cygwin_install/) terminal emulator. 
This allows you to install git via a package manager. **Please beware** that node and npm don't support Cygwin at the moment.
However you can still use it through Cygwin after installing node via it's installer or building an older version (< 4.2.2) from source.  