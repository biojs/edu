---
layout: container
title: Tutorials
---

<ul>
{% for page in site.pages %}
	{% if page.category == "Tutorial" %}
	<li><a href="{{ page.url }}">
	{% if page.title contains "Tutorial: " %}
		{{ page.title | remove_first: "Tutorial: " }}
	{% else %}
		{{ page.title }}
	{% endif %}
	</a></li>
	{% endif %}
{% endfor %}
</ul>

Demonstrations
---

<ul>
{% for page in site.pages %}
	{% if page.category == "Demo" %}
	<li><a href="{{ page.url }}">
	{% if page.title contains "Demo: " %}
		{{ page.title | remove_first: "Demo: " }}
	{% else %}
		{{ page.title }}
	{% endif %}
	</a></li>
	{% endif %}
{% endfor %}
</ul>

Registry
---

<ul>
    <li>
        <a href="http://biojs.net/registry-ui/client/">BioJS Registry</a>
    </li>
</ul>