---
title: 'Tutorial: Get involved into BioJS 2.0'
layout: tutorial-container
author: David Dao
category: tutorials
estimated-time: 45
---

{% highlightblock verification %}
We will use this icon to mark verification points.
A verification point is a way for you to check how you are doing.
{% endhighlightblock %}

{% highlightblock stop %}
For most of the steps in this tutorial we will
provide the code as it should look after the task. It is tempting, we
know, but please, please, do not go for the “copy&paste” way.
{% endhighlightblock %}

{% highlightblock challenge %}
We will use this icon to challenge you
with additional code-related tasks so you can go further at your own
pace. No inline answer will be provide for those challenges but we will
give you some guidelines and tips. By the way, within the instructions
we will use *an italic font* to refer to variables and pieces of code.
{% endhighlightblock %}

{% highlightblock question %}
We will use this icon to ask you some questions related to the task your are working on.
{% endhighlightblock %}

{% highlightblock raise %}
If you are following this tutorial as part of a workshop, do not hesitate to
raise your hand and share any questions or comments you may have.
If you are doing it by your own, you still can raise your hand in our
mailing list, just join our [Google Group](https://groups.google.com/forum/#!forum/biojs).
{% endhighlightblock %}

Objectives
----------

This tutorial shows how to use a Biojs component. We use the BioJS
Sequence component as a case study. By the end of this tutorial you are
expected to know how to

-   Get the javascript files required by a BioJS component
-   Instantiate a BioJS component on the window.onload funtion
-   Modify the default options when instantiating a component
-   Activate, deactivate, and use the Biojs.console
-   Use some methods provided by a component
-   Use a web service and proxy to retrieve a sequence from UniProt
-   Be comfortable when reading a BioJS component documentation

Requirements and recommendations
--------------------------------

### Previous knowledge

-   Basics on JavaScript
-   Basics on HTML
-   A bit more than basics on Web developer tools for Chrome of Firefox
-   Optional: jQuery
-   Optional: Basic php

### Tools and files

-   BioJS components and dependencies (we will tell you how to get them)
-   Web server like apache. We suggest to use
    [XAMPP](http://www.apachefriends.org/en/xampp.html), an easy to
    install Apache Distribution for Linux, Windows, Mac OS X, and
    Solaris.
-   Optional: Web development IDE such us [Aptana](http://aptana.com/),
    [Brackets](http://brackets.io/), or any other you like (although you
    can also use a plain text editor)

### Data and folder setup

Initially you do not need any special data other than a String, but
later in the tutorial you will use some sequences from UniProt. Below
there is the folder organization that we use in this tutorial, please
create the folders and retrieve the required files from the links
provided.

-   biojs folder: Biojs.core, Biojs.Sequence, and Biojs.tooltip (we will
    tell you how to get them)
-   css folder: Biojs tooltip CSS (we will tell you how to get this one)
-   proxy folder: proxy.php (we will tell you how to get this one)
-   js folder: [jQuery](http://code.jquery.com/jquery-1.11.1.min.js),
    [jQuery
    UI](http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js),
    [jQuery UI
    CSS](https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/themes/base/jquery.ui.all.css)
-   html folder: all HTML files that we will create in this tutorial

Tutorial
--------

### Step 1: Get the BioJS files

Please make sure you have installed the required software, you have
created the required folders in your working space, and you have
populated those folders with the required files.

As already mentioned, you will also need some BioJS files. You can
retrieve them from the [BioJS GitHub
repository](https://github.com/biojs/biojs). Yoy can fork the project or
download a zip to your computer so you will get all the BioJS code.

If you are interested only in retrieving a particular file, js or css,
you can navigate the repository and get the raw version of the file. We
will use the latter method in order to retrive just the files we need
for this tutorial.

Go to the repository and navigate to
[src/main/javascript](https://github.com/biojs/biojs/tree/master/src/main/javascript).
Look for Biojs.js and go
[there](https://github.com/biojs/biojs/blob/master/src/main/javascript/Biojs.js);
now click on the “Raw” button, copy the code, and paste it into a file
named Biojs.js under workspace/biojs/. Alternatively, you can use the
right click on the “Raw” button to save the link content as
workspace/biojs/Biojs.js. Below there are some shortcuts to the raw
BioJS files required for this tutorial. Make sure you get all of the
JavaScript in your workspace/biojs folder, the CSS file in your
workspace/css folder, and the proxy to your workspace/proxy/ folder.

-   [Biojs.js](https://github.com/biojs/biojs/raw/master/src/main/javascript/Biojs.js)
-   [Biojs.Sequence.js](https://raw.githubusercontent.com/biojs/biojs/master/src/main/javascript/Biojs.Sequence.js)
-   [Biojs.Tooltip.js](https://github.com/biojs/biojs/raw/master/src/main/javascript/Biojs.Tooltip.js)
-   [biojs.Tooltip.css](https://raw.githubusercontent.com/biojs/biojs/master/src/main/resources/css/biojs.Tooltip.css)
-   [proxy.php](https://raw.githubusercontent.com/biojs/biojs/master/src/main/resources/dependencies/proxy/proxy.php)

{% highlightblock verification %}
This is how your folders and files should look like right now:
{% endhighlightblock %}

-   biojs
    -   Biojs.js
    -   Biojs.Sequence.js
    -   Biojs.Tooltip.js
-   css
    -   biojs.Tooltip.css
    -   jquery.ui.all.css
-   proxy
    -   proxy.php
-   js
    -   jquery-1.11.1.min.js
    -   jquery-ui.min.js
-   html

### Step 2: Create an (almost) empty HTML

Create a web page importing the Biojs core component, the Sequence
component, the Tooltip component and JQuery. Also include links to the
CSS files. In the body, include a div named “sequenceDiv” that will act
as the component container. Save that HTML as **step2.html** in your
workspace/html folder. We are using jQuery compatibility style. If you
want to use any of the 2 jQuery version, you will need the migration
package, see more about it [here](http://jquery.com/download/).

{% highlightblock verification %}
You web page should look like this.
{% endhighlightblock %}

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <!--JQuery-->
            <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript">
                jQuery.noConflict();
            </script>
            <script src="../js/jquery-ui.min.js"></script>
            <link rel="stylesheet" href="../css/jquery.ui.all.css" />
            <!--Biojs-->
            <script type="text/javascript" src="../biojs/Biojs.js"></script>
            <script type="text/javascript" src="../biojs/Biojs.Sequence.js"></script>
            <script src="../biojs/Biojs.Tooltip.js"></script>
            <link href="../css/biojs.Tooltip.css" rel="stylesheet" type="text/css" />
        </head>
        <body>
            <div id="sequenceDiv" />
        </body>
    </html>
        

{% highlightblock verification %}
Make sure your page loads without any errors. In order to look for errors,
use the Web Development tools on your browser and check the console logs.
And keep checking this after any step involving changes in the code.
{% endhighlightblock %}

### Step 3: Instantiate the Sequence component

We will use the window.onload function in order to load the component
using its default options. In order to do so, you need to add a script
element at the end of the head section and use the window.onload
function.

Any BioJS component is intantiated by creating a new component object.
In this case you need to create a new Biojs.Sequence object. It takes as
unique argument a JSON object, by now we will specify only the mandatory
options. Those are “sequence” to specify the sequence to be displayed,
“target” to specify the DOM element where the component will be
rendered, and the “id” to specify the sequence id.

Create a variable named *theSequence* and store there this string

<pre>
METLCQRLNVCQDKILTHYENDSTDLRDHIDYWKHMRLECAIYYKAREMGFKHINHQVVPTLAVSKNKALQAIELQLTLETIYNSQYSNEKWTLQDVSLEVYLTAPTGCIKKHGYTVEVQFDGDICNTMHYTNWTHIYICEEASVTVVEGQVDYYGLYYVHEGIRTYFVQFKDDAEKYSKNKVWEVHAGGQVILCPTSVFSSNEVSSPEIIRQHLANHPAATHTKAVALGTEETQTTIQRPRSEPDTGNPCHTTKLLHRDSVDSAPILTAFNSSHKGRINCNSNTTPIVHLKGDANTLKCLRYRFKKHCTLYTAVSSTWHWTGHNVKHKSAIVTLTYDSEWQRDQFLSQVKIPKTITVSTGFMSI
</pre>

Now create a variable *mySequence* that will be a *new Biojs.Sequence*

Use the following options as the argument for the *new*

-   target: “sequenceDiv”, (which corresponds to the div that we added
    to the HTML body)
-   sequence: theSequence,
-   id: “P91283”

Then save your web page as workspace/html/**step3.html**.

{% highlightblock verification %}
Your web page should look like this.
{% endhighlightblock %}

Additions/changes to the previous code are in bold blue.

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <!--JQuery-->
            <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript">
                jQuery.noConflict();
            </script>
            <script src="../js/jquery-ui.min.js"></script>
            <link rel="stylesheet" href="../css/jquery.ui.all.css" />
            <!--Biojs-->
            <script type="text/javascript" src="../biojs/Biojs.js"></script>
            <script type="text/javascript" src="../biojs/Biojs.Sequence.js"></script>
            <script src="../biojs/Biojs.Tooltip.js"></script>
            <link href="../css/biojs.Tooltip.css" rel="stylesheet" type="text/css" />
        
            <script>
                window.onload = function() {
                    var theSequence = "METLCQRLNVCQDKILTHYENDSTDLRDHIDYWKHMRLECAIYYKAREMGFKHINHQVVPTLAVSKNKALQAIELQLTLETIYNSQYSNEKWTLQDVSLEVYLTAPTGCIKKHGYTVEVQFDGDICNTMHYTNWTHIYICEEAojs SVTVVEGQVDYYGLYYVHEGIRTYFVQFKDDAEKYSKNKVWEVHAGGQVILCPTSVFSSNEVSSPEIIRQHLANHPAATHTKAVALGTEETQTTIQRPRSEPDTGNPCHTTKLLHRDSVDSAPILTAFNSSHKGRINCNSNTTPIVHLKGDANTLKCLRYRFKKHCTLYTAVSSTWHWTGHNVKHKSAIVTLTYDSEWQRDQFLSQVKIPKTITVSTGFMSI";
                    var mySequence = new Biojs.Sequence({
                        target : "sequenceDiv",
                        sequence : theSequence,
                        id : 'P91283'
                    });
                };
            </script>
        
        </head>
        <body>
            <div id="sequenceDiv" />
        </body>
    </html>

{% highlightblock challenge %}
Using the window.onload function is a
good starting point, but how would you do it on, for instance, clicking
a button?
{% endhighlightblock %}

### Step 4: Modify the default options

We just did the minimum required in order to use the Sequence component.
Now we will modify some of the default options and will explore others.
In order to know better any of the BioJS components it is always a good
idea to go to the component documentation. So please go the [BioJS
registry](http://www.ebi.ac.uk/Tools/biojs/registry/) (a web site
summarizing information for all of the official/not-under-development
BioJS components) and take a look to the [Sequence component
documentation](http://www.ebi.ac.uk/Tools/biojs/registry/Biojs.Sequence.html).
Go to the “Options” tab. There you can find what options you can specify
when instantiating this component. We will modify the sequence format
here. The default format is “FASTA”, but CODATA is also possible. So

-   Add a new option to the argument used to instantiate the component,
    that option should be named *format*
-   The value for the format option should be “CODATA”

Then save your web page as workspace/html/**step4.html**.

{% highlightblock verification %}
Your web page should look like this.
{% endhighlightblock %}
Additions/changes to the previous code are in bold blue.

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <!--JQuery-->
            <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript">
                jQuery.noConflict();
            </script>
            <script src="../js/jquery-ui.min.js"></script>
            <link rel="stylesheet" href="../css/jquery.ui.all.css" />
            <!--Biojs-->
            <script type="text/javascript" src="../biojs/Biojs.js"></script>
            <script type="text/javascript" src="../biojs/Biojs.Sequence.js"></script>
            <script src="../biojs/Biojs.Tooltip.js"></script>
            <link href="../css/biojs.Tooltip.css" rel="stylesheet" type="text/css" />
            <script>
                window.onload = function() {
                    var theSequence = "METLCQRLNVCQDKILTHYENDSTDLRDHIDYWKHMRLECAIYYKAREMGFKHINHQVVPTLAVSKNKALQAIELQLTLETIYNSQYSNEKWTLQDVSLEVYLTAPTGCIKKHGYTVEVQFDGDICNTMHYTNWTHIYICEEAojs SVTVVEGQVDYYGLYYVHEGIRTYFVQFKDDAEKYSKNKVWEVHAGGQVILCPTSVFSSNEVSSPEIIRQHLANHPAATHTKAVALGTEETQTTIQRPRSEPDTGNPCHTTKLLHRDSVDSAPILTAFNSSHKGRINCNSNTTPIVHLKGDANTLKCLRYRFKKHCTLYTAVSSTWHWTGHNVKHKSAIVTLTYDSEWQRDQFLSQVKIPKTITVSTGFMSI";
                    var mySequence = new Biojs.Sequence({
                        target : "sequenceDiv",
        
                        format : "CODATA",
            
                        sequence : theSequence,
                        id : 'P91283'
                    });
                };
            </script>
        </head>
        <body>
            <div id="sequenceDiv" />
        </body>
    </html>

{% highlightblock question %}
What do you see on the initial documentation page for the Sequence component?
What can you do there?
What are the different tabs about?
{% endhighlightblock %}

{% highlightblock question %}
We provided you the direct link to the
Sequence component documentation, but how would you get there starting
from the main BioJS registry page?
{% endhighlightblock %}

{% highlightblock challenge %}
Take a deeper look to the [Sequence component
documentation](http://www.ebi.ac.uk/Tools/biojs/registry/Biojs.Sequence.html).
What are the possible formats that you can use? What if you want to
display the sequence grouping 20 amino acids (in this case we are
working with an protein sequence) in one “column”? What does a column
mean in this context? You may need to take a look to the actual code of
the component in order to figure it out.
{% endhighlightblock %}

### Step 5: Activate Biojs.console

You can activate the Biojs.console and see the activity with Firefox or
Chrome developer tools. As the bit of code we are using does not have so
many comments, you better add a couple of them to see console output. It
is also possible to use it in IE but it usually looks better in Firefox
or Chrome. If you did a bit of the additional task in the previous step,
you have already seen how components are documented in the BioJS
registry, for instance [the Sequence
component](http://www.ebi.ac.uk/Tools/biojs/registry/Biojs.Sequence.html).
There is also an [API
documentation](http://www.ebi.ac.uk/Tools/biojs/jsdoc/index.html) that
includes not only the components but also the core and utilities. Please
take a look to the documentation for the [BioJS
console](http://www.ebi.ac.uk/Tools/biojs/jsdoc/symbols/Biojs.Utils.html#.console)
to see how to:

-   Enable the console
-   Add comments to the logs

We do not have any comments so far, so after enabling the console right
before instantiating the component, please add some debug logs:

-   Add a log with the message “Before creating the sequence”
-   Add another log with the message “After creating the sequence”

Then save your web page as workspace/html/**step5.html**.

{% highlightblock verification %}
Additions/changes to the previous code are in bold blue
{% endhighlightblock %}

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <!--JQuery-->
            <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript">
                jQuery.noConflict();
            </script>
            <script src="../js/jquery-ui.min.js"></script>
            <link rel="stylesheet" href="../css/jquery.ui.all.css" />
            <!--Biojs-->
            <script type="text/javascript" src="../biojs/Biojs.js"></script>
            <script type="text/javascript" src="../biojs/Biojs.Sequence.js"></script>
            <script src="../biojs/Biojs.Tooltip.js"></script>
            <link href="../css/biojs.Tooltip.css" rel="stylesheet" type="text/css" />
            <script>
                window.onload = function() {
            
                    Biojs.console.enable();
                    Biojs.console.log("Before creating the sequence");
            
                    var theSequence = "METLCQRLNVCQDKILTHYENDSTDLRDHIDYWKHMRLECAIYYKAREMGFKHINHQVVPTLAVSKNKALQAIELQLTLETIYNSQYSNEKWTLQDVSLEVYLTAPTGCIKKHGYTVEVQFDGDICNTMHYTNWTHIYICEEAojs SVTVVEGQVDYYGLYYVHEGIRTYFVQFKDDAEKYSKNKVWEVHAGGQVILCPTSVFSSNEVSSPEIIRQHLANHPAATHTKAVALGTEETQTTIQRPRSEPDTGNPCHTTKLLHRDSVDSAPILTAFNSSHKGRINCNSNTTPIVHLKGDANTLKCLRYRFKKHCTLYTAVSSTWHWTGHNVKHKSAIVTLTYDSEWQRDQFLSQVKIPKTITVSTGFMSI";
                    var mySequence = new Biojs.Sequence({
                        sequence : theSequence,
                        target : "sequenceDiv",
                        format : 'CODATA',
                        id : 'P918283'
                    });
            
                    Biojs.console.log("After creating the sequence");
            
                };
            </script>
        </head>
        <body>
            <div id="sequenceDiv" />
        </body>
    </html>

{% highlightblock verification %}
Those logs messages were probably not to exciting.
Why not to try to display some information about the different
options used to instantiate this component?
{% endhighlightblock %}

### Step 6: Select a portion of the sequence displayed

So far you have instantiated a component and changed some initial
options. Now we will take a look on how to update data after the
componente has been created. Go again to the
[documentation](http://www.ebi.ac.uk/Tools/biojs/registry/Biojs.Sequence.html)
and this time click on the “Methods”; look for the setSelection method.
Right after the last Biojs.console.log:

-   Call the setSelection method
-   Use 10 as the start position and 25 as the end position

Then save your web page as workspace/html/**step6.html**.

{% highlightblock verification %}
Additions/changes to the previous code are in bold blue
{% endhighlightblock %}

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <!--JQuery-->
            <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript">
                jQuery.noConflict();
            </script>
            <script src="../js/jquery-ui.min.js"></script>
            <link rel="stylesheet" href="../css/jquery.ui.all.css" />
            <!--Biojs-->
            <script type="text/javascript" src="../biojs/Biojs.js"></script>
            <script type="text/javascript" src="../biojs/Biojs.Sequence.js"></script>
            <script src="../biojs/Biojs.Tooltip.js"></script>
            <link href="../css/biojs.Tooltip.css" rel="stylesheet" type="text/css" />
            <script>
                window.onload = function() {
                    Biojs.console.enable();
                    Biojs.console.log("Before creating the sequence");
                    var theSequence = "METLCQRLNVCQDKILTHYENDSTDLRDHIDYWKHMRLECAIYYKAREMGFKHINHQVVPTLAVSKNKALQAIELQLTLETIYNSQYSNEKWTLQDVSLEVYLTAPTGCIKKHGYTVEVQFDGDICNTMHYTNWTHIYICEEAojs SVTVVEGQVDYYGLYYVHEGIRTYFVQFKDDAEKYSKNKVWEVHAGGQVILCPTSVFSSNEVSSPEIIRQHLANHPAATHTKAVALGTEETQTTIQRPRSEPDTGNPCHTTKLLHRDSVDSAPILTAFNSSHKGRINCNSNTTPIVHLKGDANTLKCLRYRFKKHCTLYTAVSSTWHWTGHNVKHKSAIVTLTYDSEWQRDQFLSQVKIPKTITVSTGFMSI";
                    var mySequence = new Biojs.Sequence({
                        sequence : theSequence,
                        target : "sequenceDiv",
                        format : 'CODATA',
                        id : 'P918283'
                    });
                    Biojs.console.log("After creating the sequence");
            
                    mySequence.setSelection(10, 25);
            
                };
            </script>
        </head>
        <body>
            <div id="sequenceDiv" />
        </body>
    </html>

{% highlightblock question %}
Have you already tried to select a portion of the sequence with your mouse?
{% endhighlightblock %}

{% highlightblock question %}
Go to the component [documentation](http://www.ebi.ac.uk/Tools/biojs/registry/Biojs.Sequence.html)
again and look the methods tab, can you figure out what the
difference between a selection and a highlight is?
{% endhighlightblock %}

{% highlightblock challenge %}
Add a text box and a button to your page.
Use the text box to enter a new sequence and the button to call the
setSequence method. You can also add a second text box to capture the
sequence identifier.
{% endhighlightblock %}

### Step 7: Use a web service to retrieve the sequence

You can use UniProt in order to retrieve a protein sequence. Because of
same-origin-restrictions, you will need to use a proxy. BioJS provides
proxies for
[Tomcat](https://raw.githubusercontent.com/biojs/biojs/master/src/main/resources/dependencies/proxy/proxy.php)
and
[PHP](https://raw.githubusercontent.com/biojs/biojs/master/src/main/resources/dependencies/proxy/proxy.jsp).
We will use the PHP parser here, so besides the proxy code (that you
aleady got when setting up the environment on step 1), you will also
need an Apache server. That is why we asked you to have XAMPP or any
other Apache server for this tutorial. Additionally, you will need as
well the jQuery.ajax(). Keep in mind that we will not properly deal here
with services down or errors in the response.

Please go to your htdocs and copy there your workspace folder. Under
workspace/html/, create an HTML file named **step7.html**. You can use
the code from any of the steps from 3 to 6 ans initial code for this
step. Now, please follow the next steps:

Remove the code inside window.onload except for the
Biojs.console.enable(); line

Create *theSequence* variable, do not asign any value to it yet

Create a variable *proxyUrl*, asign to it the path to your local proxy

Create a vaiable *proteinAcc*, asign to it the value “P99999” (or any
other valid UniProt accession)

Use jQuery ajax to asynchronoulsy retrieve the UniProt sequence, more
information at [jQuery API](http://api.jquery.com/jquery.ajax/)

You will need to specify the *url* option, the asigned value should be
your *proxyUrl*

*datatype* should take the value “xml”

*data* should take the value
“url=http://www.ebi.ac.uk/das-srv/uniprot/das/uniprot/sequence?segment=”,
at the end you should also concatenate your *proteinAcc* variable

On the *success* option, you will actually instantiate the component.
The success option is a function with parameters *response* and
*callOptions*. Inside that function you should:

-   Add a Biojs.console.log with a message “SUCCESS: data received” so
    you will be sure the ajax call has succeed
-   Add another Biojs.console.log showing the *response*
-   The response will be an XML, so use jQuery get the content,
    *jQuery(reponse)*, and store it in a variable named *sequenceXML*.
    Display the *sequenceXML* as a Biojs.console.log
-   Now retrieve the sequence from the XML content. Using the variable
    *sequenceXML*, call the method find with *‘SEQUENCE[id=“+ proteinAcc
    + ”]’* as argument. Chain the method text() and store the result in
    the variable *theSequence*
-   Add a Biojs.console.log showing the retrieved sequence, i.e.,
    *theSequence*
-   Now you can instantiate the component as you have done before, use
    *theSequence* as the value for the option *sequence*

Do not forget to save your page as workspace/html/**step7.html**, this
time inside you htdocs in your XAMPP

{% highlightblock verification %}
Additions/changes to the
previous code are in bold blue
{% endhighlightblock %}

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <!--JQuery-->
            <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript">
                jQuery.noConflict();
            </script>
            <script src="../js/jquery-ui.min.js"></script>
            <link rel="stylesheet" href="../css/jquery.ui.all.css" />
            <!--Biojs-->
            <script type="text/javascript" src="../biojs/Biojs.js"></script>
            <script type="text/javascript" src="../biojs/Biojs.Sequence.js"></script>
            <script src="../biojs/Biojs.Tooltip.js"></script>
            <link href="../css/biojs.Tooltip.css" rel="stylesheet" type="text/css" />
            <script>
                window.onload = function() {
                    Biojs.console.enable();
                            
                    var theSequence;
                    var proxyUrl = "http://www.ebi.ac.uk/Tools/biojs/biojs/dependencies/proxy/proxy.php";
                    var proteinAcc = "P99999";
                    jQuery.ajax({
                        url: proxyUrl,
                        dataType: 'xml',
                        data: "url=" + "http://www.ebi.ac.uk/das-srv/uniprot/das/uniprot/sequence?segment=" + proteinAcc,
                        success: function (response, callOptions) {
                            Biojs.console.log("SUCCESS: data received");
                            Biojs.console.log(response);
                            var sequenceXML = jQuery(response);
                            Biojs.console.log(sequenceXML);
                            theSequence = sequenceXML.find('SEQUENCE[id="+ proteinAcc + "]').text();
                            Biojs.console.log(theSequence);
            
                            var mySequence = new Biojs.Sequence({
                                sequence : theSequence,
                                target : "sequenceDiv",
                                format : 'CODATA',
                                id : proteinAcc
                            });
            
                        }
                    });
            
                };
            </script>
        </head>
        <body>
            <div id="sequenceDiv" />
        </body>
    </html>

{% highlightblock challenge %}
Add a text box and a button to your page.
Use the text box to enter a protein identifier and the button to call
ajax request.
{% endhighlightblock %}

{% highlightblock challenge %}
Add a try/catch in the *success* option of the AJAX request
so you can do some error handling there.
{% endhighlightblock %}

{% highlightblock challenge %}
Add support to the *error* option for the AJAX request so you can do
some more error handling there.
{% endhighlightblock %}

* * * * *

Thanks for following this tutorial, we hope you have enjoyed it. If you want to know more about BioJS 2.0, you can go to our [registry](http://www.ebi.ac.uk/Tools/biojs/registry/), or visit our [GitHub repository](https://github.com/biojs/biojs2), or participate in our [mailing list](https://groups.google.com/forum/#!forum/biojs).

This tutorial has been done by David Dao. 
