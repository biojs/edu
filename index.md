---
layout: container
---

<div class="Menu">
        <div class="list">
            <div class="logoDiv">
                <img src="/img/logo.svg" id="logoImg">
                <div class="logoDivName">BIOJS Edu</div>
            </div>
{% sorted_keys_for el in site.series sort_by:sort has_hash:site.series %}
{% if site.series[el].displayed %}
<span class="item-heading"> {{ site.series[el].desc }} </span>
{% for tut in site.series[el].tuts %}
<a class="item" href="/series/{{ el }}/{{ tut[1] }}">{{ tut[0] }}</a>
{% endfor %}
{% endif %}
{% endsorted_keys_for %}
</div>
</div>

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