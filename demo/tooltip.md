---
layout: series_container
title: 'BioJS Tooltip Plugin'
contributors: David Dao
category: demo
series: demo
---

<!-- BioJS 2.0 Component -->
<script src="http://daviddao.de/biojs-vis-tree.min.js"></script>
  
<link rel="stylesheet" href="biojs-vis-track/tnt.css" type="text/css" />

<!-- Tree.js -->
<script src="biojs-vis-tree/snippets/tooltip/tooltip.js"></script>

<h3>Tooltip for BioJS Phylogenetic Tree Viewer</h3>
<h4>Please click on the elements!</h4>
<div id="1"></div>



<!-- BioJS -->

<script src="http://daviddao.de/biojs-vis-track.min.js"></script>
<script src="biojs-vis-track/snippets/tooltips/tooltips.js"></script>

<h3>Tooltip for BioJS Feature Viewer</h3>
<h4>Please click on the elements!</h4>
<div id="2"></div>
<script>
        (function () {
            var tnt = biojs.vis.track;
            var gB = tnt.board.genome().species("human").gene("brca2").width(950);
            var gBTheme = tnt_theme_track_tooltips();
            gBTheme(gB, document.getElementById("2"));
        })();
</script>
<script>
    (function () {
            var tree_vis = biojs.vis.tree.tree();
            var theme = tnt_theme_tree_tooltip();
            theme(tree_vis, document.getElementById("1"));
        }());
</script>