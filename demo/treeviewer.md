---
layout: container
title: 'BioJS Tree Viewer'
author: David Dao
category: demo
---
<meta charset="utf-8">

<div id="body">
  <!-- D3.js -->
  <script src="http://d3js.org/d3.v3.min.js"></script>

  <!-- BioJS 2.0 Component -->
  <!-- link rel="stylesheet" href="/biojs-vis-tree/tnt.css" type="text/css" /-->
  <script src="biojs-vis-tree/build/biojs_vis_tree.min.js"></script>

  <!-- Tree.js -->
  <script src="biojs-vis-tree/snippets/swap_nodes/swap_nodes.js"></script>

  <h3>Swap tree nodes</h3>
  <div id="1"></div>

  <script>
    (function() {
    var tree_vis = biojs.vis.tree.tree()
    var theme = tnt_theme_tree_swap_nodes();
    theme(tree_vis, document.getElementById("1"));
    }());
  </script>

  <!-- Tree.js -->
  <script src="biojs-vis-tree/snippets/newick_input/newick_input.js"></script>

  <h3>Newick Annotation Theme</h3>
  <div id="2"></div>

  <script>
    //var options = ["A","B","C","D"];

    //Choose the overall layout ta
    var ta = biojs.vis.tree.tree();
    //var theme = tnt_theme().newick("(((human, chimp), mouse))").buttons(options);

    //Use the theme we just generated!
    var theme = tnt_theme();

    theme(ta,document.getElementById('2'));

  </script>

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

  <script src="/biojs-vis-tree/snippets/sort_nodes/sort_nodes.js"></script>

  <h3>Sorting nodes</h3>
  <div id="3"></div>

  <script>
    var tree_vis = biojs.vis.tree.tree();
    var theme = sort_tree_theme();
    theme(tree_vis, document.getElementById("3"));
  </script>

  <script src="/biojs-vis-tree/snippets/scaled_branches/scaled_branches.js"></script>

  <h3>Scaled branches</h3>
  <div id="4"></div>

  <script>
    (function() {
    var tree_vis = biojs.vis.tree.tree()
    var theme = tnt_theme_tree_scaled_branches();
    theme(tree_vis, document.getElementById("4"));
    }());
  </script>

  <script src="/biojs-vis-tree/snippets/ensembl_species/ensembl_species.js"></script>

  <h3>Ensembl Species</h3>
  <div id="5"></div>

  <script>
    (function() {
    var tree_vis = biojs.vis.tree.tree()
    var theme = tnt_theme_tree_ensembl_species();
    theme(tree_vis, document.getElementById("5"));
    }());
  </script>

  <!-- Tree.js -->
  <script src="/biojs-vis-tree/snippets/colors/colors.js"></script>

  <h3>Colors</h3>
  <div id="6"></div>

  <script>
    (function() {
    var tree_vis = biojs.vis.tree.tree()
    var theme = tnt_theme_tree_colors();
    theme(tree_vis, document.getElementById("6"));
    }());
  </script>

  <script src="/biojs-vis-tree/snippets/collapse_nodes/collapse_nodes.js"></script>

  <h3>Collapse tree nodes</h3>
  <div id="7"></div>

  <script>
    (function() {
    var tree_vis = biojs.vis.tree.tree()
    var theme = tnt_theme_tree_collapse_nodes();
    theme(tree_vis, document.getElementById("7"));
    }());
  </script>

<h4>Released under <a href="http://www.opensource.org/licenses/apache2.0.php">Apache 2.0</a> by David Dao for BioJS 2 based on the TnT Library</h4>



</div>

