---
layout: series_container
title: 'BioJS Track Viewer'
author: David Dao
category: demo
series: demo
---

<meta charset="utf-8">

<div id="body">
  <!-- D3.js -->
  <script src="http://d3js.org/d3.v3.min.js"></script>

  <!-- BioJS 2.0 Component -->
  <!-- link rel="stylesheet" href="/biojs-vis-track/tnt.css" type="text/css" /-->
  <script src="http://daviddao.de/biojs-vis-track.min.js"></script>
  <link rel="stylesheet" href="biojs-vis-track/tnt.css" type="text/css" />


   <script src="/biojs-vis-track/snippets/2_data_and_features/2_data_and_features.js"></script>

    <h3>Showing 2 Features in one Track</h3>
    <div id="1"></div>

    <script>
        (function () {
            var board = biojs.vis.track.board().from(20).to(500);
            var theme = tnt_theme_track_2_data_and_features();
            theme(board, document.getElementById("1"));
        })();
    </script>
    
    <script src="/biojs-vis-track/snippets/buttons/buttons.js"></script>
    
    <h3>The Buttons-based theme</h3>
    <div id="2"></div>
    <script>
        (function () {
            var tnt = biojs.vis.track;
            var gB = tnt.board.genome().species("human").gene("brca2").width(950).allow_drag(false);
            var gBTheme = tnt_theme_track_buttons();
            gBTheme(gB, document.getElementById("2"));
        })();
    </script>
  
    <script src="/biojs-vis-track/snippets/compact/compact.js"></script>

    <h3>The Compact Theme</h3>
    <div id="3"></div>
    <script>
        (function () {
            var tnt = biojs.vis.track
            var gB = tnt.board.genome().species("human").gene("brca2").width(950);
            var gBTheme = tnt_theme_track_compact()
                .show_title(false)
                .foreground_color("#586471")
                .background_color("#DDDDDD");
            gBTheme(gB, document.getElementById("3"));
        })();
    </script>
    
     <script src="/biojs-vis-track/snippets/comparative/comparative.js"></script>


    <h3>The Comparative Theme</h3>

    <div id="4"></div>
    <script>
        (function () {
            var width = 800;
            var gene = "BRCA2";
            var bgColor = "#DCE6E6";
            var fgColor = "#0099CC";
            var tnt = biojs.vis.track;
            var gBs = [tnt.board.genome().species("human").width(width).gene(gene).allow_drag(false),
                    tnt.board.genome().species("mouse").width(width).gene(gene).allow_drag(false)];
            gBTheme = tnt_theme_track_comparative();
            gBTheme(gBs, document.getElementById("4"));

        })();
    </script>
    
    <script src="/biojs-vis-track/snippets/dynamic_track/dynamic_track.js"></script>

    <h3>Adaptative track</h3>
    <div id="5"></div>

    <script>
        (function () {
            var tnt = biojs.vis.track;
            var board = tnt.board().from(20).to(500);
            var theme = tnt_theme_track_dynamic_track();
            theme(board, document.getElementById("5"));
        })();
    </script>
    
    <script src="/biojs-vis-track/snippets/line_track/line_track.js"></script>

    <h3>Line Tracks</h3>
    <div id="6"></div>
    <script>
        (function () {
            var tnt = biojs.vis.track;
            var board = tnt.board().from(20).to(500);
            var theme = tnt_theme_track_line_track();
            theme(board, document.getElementById("6"));
        })();
    </script>
    
    <script src="/biojs-vis-track/snippets/sequence_track/sequence_track.js"></script>

    <h3>A Sequence Track</h3>
    <div id="8"></div>

    <script>
        (function () {
            var tnt = biojs.vis.track;
            var board = tnt.board().from(50).to(100);
            var theme = tnt_theme_track_sequence_track();
            theme(board, document.getElementById("8"));
        })();
    </script>
    
    <script src="/biojs-vis-track/snippets/swap_tracks/swap_tracks.js"></script>

    <h1>Swapping Tracks</h1>
    <div id="9"></div>
    <script>
        (function () {
            var tnt = biojs.vis.track;
            var board = tnt.board().from(0).to(1000);
            var theme = tnt_theme_track_swap_tracks();
            theme(board, document.getElementById("9"));
        })();
    </script>
    
    <h4>Released under <a href="http://www.opensource.org/licenses/apache2.0.php">Apache 2.0</a> by David Dao and Miguel Pignatelli for BioJS 2 based on the TnT Library</h4>

  