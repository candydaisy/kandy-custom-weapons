# Falconer's Recurve

> *"Strung with gut from a hawk that never missed. The arrows still remember how to hunt."*

**Status:** Proposed (not implemented)

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
    {"text": "Locking onto a player makes you glow to them for 3s.", "color": "red", "italic": false}
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
- **Mechanic:** The target gets **Glowing** for as long as the lock lasts (up to 8s after your last shot). Only one lock at a time; drawing on a new target for 0.75s switches it.

### Passive: Homing Flight
- Full-draw arrows fired while locked **curve toward the target**, turning up to about 12° per tick. They can't turn through walls and lose the lock if the target is more than 64 blocks away.
- Homing arrows deal **15% less damage** than a normal full-draw arrow.

### Active Skill: Falcon Volley
- **Trigger:** A full-draw shot while **sneaking** and locked on.
- **Cooldown:** 14 seconds.
- **Mechanic:** 3 extra spectral arrows fan out above you and dive at the target over 1s, **3 damage each**. They can't be picked up.

### Downside: Two-way Sight
- Locking onto a **player** gives **you** Glowing for 3s, so they know they're being hunted.

---

## 5. Technical Implementation Notes (Datapack)

- **Lock On:** a `using_item` advancement on the bow fires every tick it's drawn (Watcher's Lens / Chronos pattern); a raycast from the eyes in 0.5-block steps finds the creature, and a per-player score counts 15 ticks.
- **Target link:** players get a stable id score (like Eclipse's `ecl_pid`); the locked creature carries the matching score.
- **Homing:** each tick, a temporary marker at the arrow is turned `facing entity <target>` and moved `^ ^ ^<speed>`; the position difference is written into the arrow's `Motion`, blended with the old motion to cap the turn rate.
- **Damage:** set the arrow's `damage` to 85% of its default on spawn.
- **Volley:** summon `minecraft:spectral_arrow` with `pickup:0b` and the same homing tag.
