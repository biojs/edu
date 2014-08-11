---
layout: series_container
title: 'BioJS MSA Viewer'
author: Sebastian Wilzbach
category: demo
series: demo
---

<link type="text/css" rel="stylesheet" href="biojs-vis-msa/css/msa.css" />
<body>
<script src="biojs-vis-msa/build/biojs_vis_msa.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="biojs-vis-msa/node_modules/biojs-model/biojs.model.min.js"></script>
<div id='msa'></div>


Another snippet
<div id='msa-ordering'></div>
<script src="biojs-vis-msa/snippets/msa_ordering.js"></script>

<script>
var msa_viewer = biojs.vis.msa;
var msa = new msa_viewer.msa('msa');
msa.seqmgr.addDummySequences();
</script>
</body>
