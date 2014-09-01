---
layout: series_container
title: 'BioJS Newick Parser'
contributors: David Dao
category: demo
series: demo
---

<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="http://daviddao.de/biojs-io-newick.min.js"></script>

<div id="demo"></div> 



<p>
  <h4>Example Trees in Newick format: </h4>
  <ul>
  <li>(((((homo_sapiens:9,pan_troglodytes:9)207598:34,callithrix_jacchus:43)314293:52,mus_musculus:95)314146:215,taeniopygia_guttata:310)32524:107,danio_rerio:417)117571:135;
  </li>
  <li>(homo_sapiens:1,(mus_musculus:2,danio_rerio:17):4);
  </li>
  <li>(homo_sapiens:1,(mus_musculus:2,(danio_rerio:13,(pan_troglodytes:9,taeniopygia_guttata:10,callithrix_jacchus:1):12):4);
  </li>
  </ul>

  </p>

<h5>Open the browser console to inspect the resulting JSON data</h5>

<div class="output"></div>

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
                                
                                d3.select(".output").append("h3").html(JSON.stringify(data));

							});

</script>