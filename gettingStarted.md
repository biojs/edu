---
title: 'How to setup your machine for BioJS 2'
layout: container
author: Iris Shih
category: Tutorial
estimated-time: 5
---

- [__Mac__](#mac)
- [__Linux__](#linux)
- [__Windows__](#windows)

When your machine is ready to rumble, continue to the [tutorial](howToCreateComponent.html)

<a name="mac"></a>
Mac Users 
------------------------------

1. Clone our BioJS 2 repository
>`git clone https://github.com/biojs/biojs2.git`

2. Install homebrew
>`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

3. Install node
>`brew install node`

Alternatively you can also install NodeJs via the [package installer](http://nodejs.org/download/)

<a name="linux"></a>
Linux users
------------------------------

Install nodejs via [your package manager](https://github.com/joyent/node/wiki/installing-node.js-via-package-manager)

E.g. for Ubuntu run

> sudo apt-get install npm

 
<a name="windows"></a>
Windows Users 
------------------------------

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
    >`git clone git://github.com/ry/node.git`

    >`cd node`

    >`./configure`

    >`make`

    >`sudo make install` 
