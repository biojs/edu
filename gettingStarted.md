---
title: 'How to setup your machine for BioJS 2'
layout: container
author: Iris Shih
category: Tutorial
estimated-time: 5
---



This is how it is done!
----------

There are several steps for installing BioJS 2. Follow the steps and start to have fun with BioJS 2.
We provide the tutorials for different operating system users, feel free to follow the steps based on your requirement.

- [__Mac__](#mac)
- [__Windows__](#windows)
- [__Ubuntu__](#ubuntu)

<br> 
<br> 

<a name="mac"></a>
Mac Users 
------------------------------
###Step 1 : Install node.js & npm
This is the step for building up your working environment for BioJS 2.
<br> 
<br>

1. Clone our BioJS 2 repository
>`git clone https://github.com/biojs/biojs2.git`

2. Install homebrew
>`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

3. Install node
>`brew install node`

 
###Step 2 : Build your components 
This is the step for building a BioJS package.

1. Go into the package folder
 >`cd [Package Destination]`

2. npm install
 >`npm install`

3. Run tests
 >`npm test`

4. Build a file for a browser
 >`nmp run build-browser`

####Working examples of the component can be found in the snippet folder of each package

<br>
<br> 
<br> 

<a name="windows"></a>
Windows Users 
------------------------------
###Step 1 : Install node.js & npm
This is the step for building up your working environment for BioJS 2.
<br>
<br>

1. Clone our BioJS 2 repository
>`git clone https://github.com/biojs/biojs2.git`

2. [install cygwin](http://www.mcclean-cooper.com/valentino/cygwin_install/)
    - Use setup.exe in the cygwin folder to install the following packages:
        * devel → openssl 
        * devel → g++-gcc 
        * devel → make 
        * python → python 
        * devel → git
     - Open the cygwin command line with Start > Cygwin > Cygwin Bash Shell.
<br>    


3. Rub the commands:
    >`git clone git://github.com/ry/node.git`

    >`cd node`

    >`./configure`

    >`make`

    >`sudo make install` 

 
###Step 2 : Build your components 
This is the step for building a BioJS package.

1. Go into the package folder
 >`cd [Package Destination]`

2. npm install
 >`npm install`

3. Run tests
 >`npm test`

4. Build a file for a browser
 >`nmp run build-browser`
 
####Working examples of the component can be found in the snippet folder of each package

<br> 
<br>  
<br> 

<a name="ubuntu"></a>
Ubuntu Users 
------------------------------
###Step 1 : Install node.js & npm
This is the step for building up your working environment for BioJS 2.
<br> 

1. Clone our BioJS 2 repository
>`git clone https://github.com/biojs/biojs2.git`

2. Install the dependencies 
    >`sudo apt-get install g++ curl libssl-dev apache2-utils`
    
    >`sudo apt-get install git-core`


3. Rub the commands:
    >`git clone git://github.com/ry/node.git`

    >`cd node`

    >`./configure`

    >`make`

    >`sudo make install` 

 
###Step 2 : Build your components 
This is the step for building a BioJS package.

1. Go into the package folder
 >`cd [Package Destination]`

2. npm install
 >`npm install`

3. Run tests
 >`npm test`

4. Build a file for a browser
 >`nmp run build-browser`
 
####Working examples of the component can be found in the snippet folder of each package

