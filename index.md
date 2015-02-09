---
layout: container
---


{% sorted_keys_for el in site.series sort_by:sort has_hash:site.series %}
{% if site.series[el].displayed %}
<span class="item-heading"> {{ site.series[el].desc }} </span>
{% for tut in site.series[el].tuts %}
<a class="item" href="/series/{{ el }}/{{ tut[1] }}">{{ tut[0] }}</a>
{% endfor %}
{% endif %}
{% endsorted_keys_for %}

