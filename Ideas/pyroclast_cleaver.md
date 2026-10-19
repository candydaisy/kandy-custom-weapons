# Pyroclast Cleaver

> *"Forged in the heart of the Nether's lowest magma lakes. It radiates suffocating heat that incinerates everything in its arc."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:netherite_axe`
- **Rarity:** `epic`
- **Theme:** Magma, Volcanic Fissures, Heat Meter / Overheat, Scorched Earth
- **Custom Data:** `{ability: "Pyroclast"}`
- **Display Gradient:** Cinder Orange to Magma Crimson (`#ff9f1a` → `#ff5200` → `#d82b00` → `#7d0b00`)
- **Lore Text:**
  ```json
  [
    {"text": "Hits build Heat (0–100%) and burn for +1 fire damage, +2 at 50%+.", "color": "gray", "italic": false},
    {"text": "At 100%: Overdrive — Speed, and every swing erupts.", "color": "gray", "italic": false},
    {"text": "Sneak + jump-attack: Magma Fissure tears the ground ahead.", "color": "gold", "italic": false},
    {"text": "Overdrive ends in Overheat: slowed, no Fire Resistance for 4s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Pyroclast Core** (shown as `minecraft:magma_block` via `item_model`; the real item is an unobtainable `minecraft:structure_block` template, so a plain magma block can't forge it)
- **Unlock Trigger:** Getting a **Lava Bucket** in the Nether or killing a **Magma Cube**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:respawn_anchor`
  - **Sides (N, S, E, W):** 4× `minecraft:magma_cream`
  - **Corners:** 4× `minecraft:blaze_rod`

### Step 2: Forging at the Smithing Table
- **Template:** `Pyroclast Core`
- **Base Weapon:** `minecraft:netherite_axe`
- **Addition Catalyst:** `minecraft:fire_charge`

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** 10
- **Attack Speed:** 0.9
- **Shield Disabling:** disables shields for 6 seconds on hit
- **Fire Resistance:** while held (paused during Overheat)
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Heat Gauge & Overdrive
- **Trigger:** Fully charged, unblocked hits.
- **Mechanic:**
  - Each hit adds **+10% Heat**. Heat never cools down on its own; it's only spent by Overdrive or Magma Fissure.
  - Hits burn for **+1 fire damage**, or **+2 at 50%+ Heat**.
  - **At 100% Heat: Overdrive for 6 seconds.** You get **Speed I**, swings cleave everything in front of you, hits deal **+3 fire damage**, and every victim **erupts for 4 damage** around it and sets the floor alight.

### Active Skill: Magma Fissure (Ground Eruption)
- **Trigger:** A charged attack while **sneaking and in the air** (sneak + jump-attack; sneaking cancels sprinting, so sprint-attacks don't count).
- **Cooldown:** 10 seconds.
- **Mechanic:**
  - Tears a **10-block** fissure along the ground ahead, following the terrain one block up or down per step and stopping at walls.
  - Everything over it takes **8 damage**, is launched, and gets **Melt Armor** (-20% armor for 5s).
  - Spends **50% Heat** (if you have that much) for **double damage (16)**. During Overdrive it always doubles for free.

### Downside: Overheat
- When Overdrive ends: **Slowness I** and **Mining Fatigue** for **4 seconds**, and the cleaver's Fire Resistance stops for that time.

---

## 5. Technical Implementation (Datapack)

- **Hits:** `advancement/hit/pyroclast.json` → `pyroclast/hit`; the pack's own bonus damage counts as a hit too, so hits made while one is being resolved are ignored.
- **Same-tick damage:** custom damage type `kandy:magma` is in `#minecraft:bypasses_cooldown` (so it lands on the same tick as the hit) and `#minecraft:is_fire`. Death messages use vanilla "burned to a crisp" text.
- **Scoreboards:** `pyro_heat` (0–100), `pyro_od` (120-tick Overdrive), `pyro_oh` (80-tick Overheat), `pyro_cd` (200-tick Fissure cooldown), `pyro_melt` (100-tick Melt Armor).
- **Melt Armor:** `armor` modifier `kandy:melt` (-20%), removed when `pyro_melt` runs out and in uninstall.
- **Molten blade:** shown with particles; a custom texture would need a resource pack.
