---
layout: series_container
title: 'BioJS Newick Parser'
author: David Dao
category: demo
series: demo
---
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="http://daviddao.de/biojs-io-newick.min.js"></script>

<div id="demo"></div> 

<script>
        var div = document.getElementById('demo');
		d3.select(div).append("em").text("Input Tree (Newick): ");

		var inputform = d3.select(div)
							.append("input");
        var data;

		var button_enter = d3.select(div)
							.append("button")
							.text("Enter")
							.on("click", function() {

								var newick = inputform.node().value;

								data = biojs.io.newick.parse_nwk(newick);
                                console.log(data);
                                
                                d3.select("#demo").append("h3").html(JSON.stringify(data));

							});

</script>

<h5>Open the browser console to inspect the resulting JSON data</h5>