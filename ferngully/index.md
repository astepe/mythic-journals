---
layout: default
title: Home
---

<h1 class="page-title">Fern Gully Annals</h1>
<p class="page-description">A chronicle of knights errant in a realm where the trees grow hungry and the old bones will not stay buried.</p>

Four knights, oath-bound and road-weary, have been sent into the gully by their seer. The realm is strange and darkening. A great tree has swallowed the sky. The holdings squabble and fracture. Somewhere beneath the soil, something is growing that should not be.

This is their chronicle.

---

## Where We Left Off

> The company has arrived at Fen and met its ruler — Kernick, the Mule Knight, who walks among his people disguised as a common man called Roose. He has directed them to seek out the nearest seer for answers about the great tree whose canopy now blots out the sky across the realm. The twig cut from the tree has grown into a heavy log. The company must decide whether to carry it or leave it behind before they set out. The road ahead leads to the seer's sanctum, and the tree is still growing.

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
