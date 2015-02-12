---
layout: front
---

{{ site.pp }} 


<div class="cover">
        <div class="topNavbar">
            <div class="navbar-div" id="logo">
                BIOJS
            </div>
            <div class="navbar-div" id="navbar-links2">
                <li><a class="gitStar" id="gh-btn" href="https://github.com/biojs/biojs/" target="_blank"><i class="fa fa-github"></i><span class="gh-text" id="gh-text">Star</span></a></li>
                <li><a class="gitStar" id="gh-btn" href="https://github.com/biojs/biojs/fork" target="_blank"><i class="fa fa-code-fork"></i><span class="gh-text" id="gh-text">Fork</span></a></li>
                <li><a class="git" id="gh-btn" href="https://github.com/biojs/edu" target="_blank"><i class="fa fa-github-alt"></i></a></li>
            </div>
        </div>
        <div class="learn">
            <div class="learnHeading">
                Learn BIOJS
            </div>
            <div class="getStarted">
                <i class="fa fa-bars fa-2x"></i><span class="gtstd">Get Started</span>
            </div>
        </div>
    </div>

<script>
    $('.getStarted').click(function() {
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
