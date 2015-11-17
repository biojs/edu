---
title: 'Getting started'
layout: series_item
series: '101'
permalink: 101/getting_started/
estimated-time: 5
---

You will need __`npm`__ and __`git`__ on your shell.

- [__Mac__](#mac)
- [__Linux__](#linux)
- [__Windows__](#windows)

When your machine is ready to rumble, continue to the [tutorial]({{site.baseurl}}/101/modularity)

{% hlblock check %}

See whether you have both commands (`npm`, `git`) installed. You should run the above without
any error.

~~~
git help
npm help
~~~

{% endhlblock %}

{% hlblock info %}
If you want to fresh up your `git` skills, check out the [Git guide](https://rogerdudler.github.io/git-guide/) or [15 minutes interactive lesson](https://try.github.io/levels/1/challenges/1) by Codeschool.
{% endhlblock %}

{% hlblock question %}
What does `npm` stand for?
{% endhlblock %}

<a name="mac"></a>

### Mac Users

Homebrew, git and node.js are three packages that are worth having on your Mac if you want to do software development.

* [Homebrew](http://brew.sh) is called the 'missing package manager for OS X'. It allows you to download packages onto your Mac from your command line.  
* [Git](https://github.com) is a version control system that will keep track of the changes you have made in code.
* [Node.js](http://nodejs.org) is a 'runtime environment platform for server-side JavaScript applications'.

You need to open a Terminal session first.

Installing homebrew:

~~~
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # brew is a package manager
~~~

This installs Homebrew. Homebrew is quite a large package so downloading can take a while depending on your internet connection.

Using Homebrew to install node.js:

~~~
brew install node # installs the node package
~~~

If you have not installed `git`, this command uses homebrew to install git:

~~~
brew install git
~~~

To ensure you have installed these correctly, it is worth checking by typing "git help" and "npm help" into the command line again.

Alternatively you can also install NodeJs via the [package installer](http://nodejs.org/download/).

You can also download [Github for Mac](https://mac.github.com/).


<a name="linux"></a>

### Linux users

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

### Windows Users

Windows is definitely not the preferred operating system for software development of this kind. So some additional 
and often unexpected effort will probably be necessary to get everything running. 
Be warned that some packages just assume that they have a UNIX-like enviroment.
Anyway, installing npm on windows is still easy:

Just download & install using the [Windows installer](http://nodejs.org/download/)

You can now use it from the Node.js Command Prompt or by installing [Cygwin](http://www.mcclean-cooper.com/valentino/cygwin_install/)