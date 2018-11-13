---
layout: front
---

<div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">BioJS Edu</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="http://www.biojs.net"><i class="fa fa-home"></i> BioJS Registry</a></li>
                  <li><a href="https://gitlab.com/biojs/biojs"><i class="fa fa-github-alt"></i> BioJS on GitHub</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading" style="font-size:60px">Learn BioJS</h1>
            <p class="lead">Beautiful. Interactive. Reusable.</p>
            <p class="lead">
              <a href="/101/intro" class="btn btn-lg btn-default" id="getStarted"><img src="/img/logo.png" width="30px"> Get Started</a>
            </p>
            <!--
            <p class="lead">
              <a href="http://try.biojs.net" class="btn btn-lg btn-default" id="terminal"><i class="fa fa-terminal"></i> Try it online (beta)</a>
            </p>
            -->
          </div>



          <div class="mastfoot">
            <div class="inner">
              <p><div class="withLove"><span class="alpha">Made with</span> <svg class="heart" enable-background="new 0 0 92.515 73.161" height="73.161px" version="1.1" viewBox="0 0 92.515 73.161" width="92.515px" x="0px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" y="0px"> <g> <path d="M82.32,7.888c-8.359-7.671-21.91-7.671-30.271,0l-5.676,5.21l-5.678-5.21c-8.357-7.671-21.91-7.671-30.27,0
            c-9.404,8.631-9.404,22.624,0,31.255l35.947,32.991L82.32,39.144C91.724,30.512,91.724,16.52,82.32,7.888z" fill="#010101"></path> </g> </svg> <span class="omega">for Biology!</span></div></p>

            </div>
          </div>

        </div>

      </div>

    </div>

<script>
    $('#getStarted').click(function() {
        $(".Menu").css("width", "100%");
        $(".Menu").css("left", "0");
        $('.pullButton').css("display", "none")
    });
    $('.Menu').click(function() {
        $(".Menu").css("width", "250px");
        $(".Menu").css("left", "-250px");
        $('.pullButton').css("display", "block")
    })
</script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
