# Falconer's Recurve

> *"Strung with gut from a hawk that never missed. The arrows still remember how to hunt."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:bow`
- **Rarity:** `epic`
- **Theme:** Falconry, Lock-on, Homing Arrows, Single-target Hunting
- **Custom Data:** `{ability: "Falconer"}`
- **Display Gradient:** Sky Gold to Feather Brown (`#ffe29a` → `#f4a259` → `#bc6c25` → `#6b4226`)
- **Lore Text:**
  ```json
  [
    {"text": "Aim at a creature while drawing for 0.75s to Lock On (it glows).", "color": "gray", "italic": false},
    {"text": "Full-draw arrows curve toward your locked target, for 15% less damage.", "color": "gray", "italic": false},
    {"text": "Sneak + full draw: Falcon Volley, 3 extra homing arrows (14s cooldown).", "color": "gold", "italic": false},
    {"text": "Locking onto a player makes you glow for 3s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Falcon Core** (shown as `minecraft:feather` via `item_model`; real item: an unused spawn egg template such as `minecraft:parrot_spawn_egg`)
- **Unlock Trigger:** Killing a **Phantom** with an arrow, or getting a **Spyglass**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:spyglass`
  - **Sides (N, S, E, W):** 4× `minecraft:arrow`
  - **Corners:** 4× `minecraft:feather`

### Step 2: Forging at the Smithing Table
- **Template:** `Falcon Core`
- **Base Weapon:** `minecraft:bow`
- **Addition Catalyst:** `minecraft:phantom_membrane`

---

## 3. Weapon Attributes & Stat Profile

- **Arrow damage:** vanilla bow (keeps Power, Punch, Flame, Infinity)
- **Durability:** Unbreakable (`unbreakable={}`)

Where Eclipse Longbow is crowd control (pierce, vortex, repositioning), the Recurve is the single-target finisher: it hits a target you can't line up yourself, like fleeing players, flying Phantoms, or a Ghast behind cover.

---

## 4. Skills & Powers

### Passive: Lock On
- **Trigger:** Keep your crosshair on a creature within **48 blocks** for **0.75s** while drawing the bow.
- **Mechanic:** The target gets **Glowing** for as long as the lock lasts: 8s, refreshed by every homing shot. Only one lock at a time; drawing on a new target for 0.75s switches it.

### Passive: Homing Flight
- Full-draw arrows fired while locked **curve toward the target**: each tick their motion is blended a third of the way toward 2.5 blocks/tick straight at it. They stop homing once they land, or if the target is more than 64 blocks away.
- Homing arrows deal **15% less damage** than a normal full-draw arrow.

### Active Skill: Falcon Volley
- **Trigger:** A full-draw shot while **sneaking** and locked on.
- **Cooldown:** 14 seconds.
- **Mechanic:** 3 extra spectral arrows fan out above you and dive at the target over 1s, **3 damage each**. They can't be picked up.

### Downside: Two-way Sight
- Locking onto a **player** gives **you** Glowing for 3s, so they know they're being hunted.

---

## 5. Technical Implementation (Datapack)

- **Lock On:** `advancement/falconer/using.json` (`using_item`) sets `fl_use` every tick the bow is drawn; `falconer/aim` raycasts from the eyes in 0.5-block steps (up to 48 blocks) and counts 15 ticks on the same creature (`fl_cand`, `fl_ct`). Creatures get a stable id in `fl_eid` and the tag `kandy.fl_marked`; the player stores `fl_lock` and a 160-tick `fl_lt`.
- **Homing:** new full-draw (`crit:1b`) Recurve arrows from a locked player get the tag `kandy.fl_homing`, `damage:1.7d` (85% of 2.0) and the target id in `fl_tgt`. Each tick `falconer/steer` places a temporary marker 2.5 blocks toward the target's eyes and writes `(2 × old motion + that offset) / 3` into the arrow's `Motion`.
- **Volley:** 3 `spectral_arrow`s (`damage:1.2d`, `pickup:0b`, Owner set to you) launched upward above you, homing on the same target; cooldown `fl_cd` = 280 ticks.
- **Ownership:** compared through the arrow's `Owner` UUID, like Eclipse.
