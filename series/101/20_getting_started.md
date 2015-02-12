---
title: 'Getting started'
layout: series_item
contributors: Iris, Paul, Seb
series: '101'
estimated-time: 5
---

You will need __`npm`__ and __`git`__ on your shell.

- [__Mac__](#mac)
- [__Linux__](#linux)
- [__Windows__](#windows)

When your machine is ready to rumble, continue to the [tutorial](22_headstart.html)

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
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" # brew is a package manager
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
If you want to install the packages globally in your userdir (without sudo), see [these instructions](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo-linux.md)
{% endhlblock %}

{% hlblock info %}
If you want to avoid installing packages with sudo, you can also use [nvm](https://github.com/creationix/nvm)

~~~
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | bash # install nvm
nvm install 0.10.30 && nvm alias default 0.10.30 && nvm use default # install node & npm in userenv
~~~

{% endhlblock %}


We assume that you most likely will know how to install a package, however feel free to add instructions for your favorite distro.
 
<a name="windows"></a>

### Windows Users 

You must be completely crazy if you want to develop anything on Windows.
Be warned that some packages just assume that they have a UNIX-like enviroment.
Anyway installing npm on windows is still easy.

Way 1) Download & install using the [Windows installer](http://nodejs.org/download/)

Way 2) Build node from the source code  

1. [install cygwin](http://www.mcclean-cooper.com/valentino/cygwin_install/)
    - Use setup.exe in the cygwin folder to install the following packages:
        * devel → openssl 
        * devel → g++-gcc 
        * devel → make 
        * python → python 
        * devel → git
     - Open the cygwin command line with Start > Cygwin > Cygwin Bash Shell.
  

2. Build node from the source:

~~~
git clone git://github.com/ry/node.git
cd node
./configure
make
sudo make install
~~~
