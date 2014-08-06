---
layout: container
title: Tutorials
---

<ul>
{% for page in site.pages %}
	{% if page.category == "tutorials" %}
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
