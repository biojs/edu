---
layout: container
---
Registry
---

<ul>
    <li>
        <a href="http://biojs.net/registry-ui/client/">BioJS Registry (Under construction!)</a>
    </li>
</ul>

Tutorials
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
    <li><a href="https://github.com/biojs/biojs2/wiki/Migrate-from-BioJS-0.1">How to migrate your old component to BioJS 2</a></li>
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
