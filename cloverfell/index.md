---
layout: default
title: Home
---

<h1 class="page-title">Chronicles of Cloverfell</h1>
<p class="page-description">The ongoing journal of three knights bound by oath, traveling a realm of seers, myths, and ruin.</p>

Three knights — Xanthe the Forge Knight, Savari the Ring Knight, and Tuck Tuck the Coin Knight — travel the realm of Cloverfell, honoring their oaths to the seers and seeking the myths that stir beneath the land. What began as a simple directive from a seer in the east — *"seek the breadmaker"* — has led them through swamps, combat, mercy killings, and prophecy.

They have arrived at Haven, seat of the Shield Knight Melarue. But what awaited them at the gates was not the welcome they expected — it was a ghost from Xanthe's past.

---

## Where We Left Off

> The company entered Haven's cobblestone streets. Xanthe heard a cart. On it: piles of ore. Driving it — a broad, scruffy-bearded man in his 50s with long black curly hair and a grim, proud look. **It was Darian.** Xanthe's former enslaver.

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
