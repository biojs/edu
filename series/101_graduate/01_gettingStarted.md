---
title: 'Geting started'
layout: tutorial-container
author: Iris, Seb
category: 101_tutorial
series: 101
estimated-time: 5
---

You will need __`npm`__ and __`git`__ on your shell.

- [__Mac__](#mac)
- [__Linux__](#linux)
- [__Windows__](#windows)

When your machine is ready to rumble, continue to the [tutorial](howToCreate.html)

{% hlblock check %}

See whether you have both commands (`npm`, `git`) installed. You should run the above without 
any error.

~~~
git help
npm help
~~~

{% endhlblock %}

{% hlblock task %}
What does `npm` stand for?
{% endhlblock %}

<a name="mac"></a>

### Mac Users 

Installation via homebrew

~~~
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" # brew is a package manager
brew install node # installs the node package
~~~

If you have not installed `git`, run 

~~~
brew install git
~~~

Alternatively you can also install NodeJs via the [package installer](http://nodejs.org/download/)

<a name="linux"></a>

### Linux users

Install nodejs via [your package manager](https://github.com/joyent/node/wiki/installing-node.js-via-package-manager)

E.g. for Ubuntu run

~~~
sudo apt-get install npm
~~~

We assume that you most likely will know how to install a package, however feel free to add instructions for your favorite distro.
 
<a name="windows"></a>

### Windows Users 

You must be completely crazy if you want to develop anything on Windows.
Be warned that some packages just assume that they have a UNIX-like enviroment.

Way 1) Download & install using the [Windows installer](http://nodejs.org/download/)

Way 2) Build node from the source code  (recommended)

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
