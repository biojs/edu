---
title: 'Using the Tooltip Plugin'
layout: tutorial-container
author: David Dao
category: howto
series: howto
estimated-time: 5
---

### BioJS Tooltip Plugin

Biojs Tooltip is a Visualization Plugin for BioJS Components.
It allows the creation of tooltip windows on specific events.

Call the `tooltip.table()` method for a table template and design by editing `obj.header` and `obj.rows`

For example this is how `biojs-vis-track` implements tooltip:

~~~
var tooltip = function () {
        var tooltip = biojs.vis.tooltip.table();
        var gene_tooltip = function (gene) {
            var obj = {};
            obj.header = {
                label: "HGNC Symbol",
                value: gene.external_name
            };
            obj.rows = [];
            obj.rows.push({
                label: "Name",
                value: "<a href=''>" + gene.ID + "</a>"
            });
            obj.rows.push({
                label: "Gene Type",
                value: gene.biotype
            });
            obj.rows.push({
                label: "Location",
                value: "<a href=''>" + gene.seq_region_name + ":" + gene.start + "-" + gene.end + "</a>"
            });
            obj.rows.push({
                label: "Strand",
                value: (gene.strand === 1 ? "Forward" : "Reverse")
            });
            obj.rows.push({
                label: "Description",
                value: gene.description
            });

            tooltip.call(this, obj);
        };

        return gene_tooltip;
    };
~~~

Use `tnt.css` or your custom CSS file to design the tooltip.

* * * * *

Thanks for following this tutorial, we hope you have enjoyed it. If you want to know more about BioJS 2.0, you can go to our [registry](http://www.ebi.ac.uk/Tools/biojs/registry/), or visit our [GitHub repository](https://github.com/biojs/biojs2), or participate in our [mailing list](https://groups.google.com/forum/#!forum/biojs).

This tutorial has been done by David Dao. 
