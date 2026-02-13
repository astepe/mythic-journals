---
layout: default
title: Home
---

<h1 class="page-title">Ballads of Braeburn</h1>
<p class="page-description">The ongoing journal of a knight bound by oath, travelling a realm of seers, myths, and salt.</p>

Braeburn is a flat, weather-beaten land of turnip farmers and fishing towns, where salt water falls as rain from a sky that should not taste of the sea. Strange mists choke sleepers in the night; invasive apple trees spread unchecked across the fields. Seers dwell in hidden places and speak in riddles, and knights wander the roads between holdings — oath-bound, half-lost, trying to do what good they can in a realm that does not make it easy.

This is the chronicle of one such knight, **Igor the Salt Knight**, and his squire **Hygo**, as they travel the breadth of Braeburn following threads of duty, curiosity, and salt.

---

## Where We Left Off

> Igor and Hygo shelter at the edge of a forest where taunting voices drove them to a standstill. The salt-water rain has eased; the road north stretches ahead toward the mountains and the Tattered Tower, where a jewelled seer's emerald must be delivered. Behind them: a fox that watches the dying, a father shaken to his knees, and a realm slowly crusting over with brine.

---

## Latest Chapter

<ul class="card-list">
  {% assign chapters = site.chapters %}
  {% if chapters %}{% assign chapters = chapters | sort: 'chapter_number' | reverse %}{% endif %}
  {% for chapter in chapters limit:1 %}
  <li>
    <a href="{{ chapter.url | relative_url }}" class="card">
      <div class="card-title">{{ chapter.title }}</div>
      <div class="card-meta">Chapter {{ chapter.chapter_number }}</div>
      <div class="card-excerpt">{{ chapter.description }}</div>
    </a>
  </li>
  {% endfor %}
</ul>

[View all chapters &rarr;]({{ '/chapters/' | relative_url }})
