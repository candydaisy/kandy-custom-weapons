# Lifebloom Staff

> *"Cut from the heartwood of a tree that grew over a battlefield. It has seen enough dying."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:golden_hoe`, styled as a flowering staff
- **Rarity:** `epic`
- **Role:** **Healer**
- **Theme:** Growth, Renewal, Sanctuary
- **Custom Data:** `{ability: "Lifebloom"}`
- **Display Gradient:** Blossom Pink to Leaf Green (`#ffd6e8` → `#ffafcc` → `#95d5b2` → `#2d6a4f`)
- **Lore Text:**
  ```json
  [
    {"text": "Right-click: Mending Pulse heals nearby players for 2 hearts (12s).", "color": "gray", "italic": false},
    {"text": "Hold right-click 2s: Sanctuary, a 6s healing circle that slows mobs (30s).", "color": "gold", "italic": false},
    {"text": "Charged hits on mobs heal the most hurt player nearby.", "color": "gray", "italic": false},
    {"text": "A healer's oath: weak strikes, and your own healing is halved.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Bloom Core** (shown as `minecraft:flowering_azalea` via `item_model`; real item: an unused spawn egg template such as `minecraft:bee_spawn_egg`)
- **Unlock Trigger:** Brewing any **potion**, or getting a **Golden Apple**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:golden_apple`
  - **Sides (N, S, E, W):** 4× `minecraft:glistering_melon_slice`
  - **Corners:** 4× `minecraft:flowering_azalea`

### Step 2: Forging at the Smithing Table
- **Template:** `Bloom Core`
- **Base Weapon:** `minecraft:golden_hoe`
- **Addition Catalyst:** `minecraft:honeycomb`

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** 4
- **Attack Speed:** 1.2
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

**Allies:** every other player in range. A datapack can't read which scoreboard team you're on, so in PvP the staff heals enemies too; pets aren't healed.

### Active Skill 1: Mending Pulse
- **Trigger:** Right-click (a quick press).
- **Cooldown:** 12 seconds.
- **Mechanic:** Other players within **6 blocks** are healed for **4 HP (Instant Health I)**. Those at 10 HP or less also get **Regeneration I for 4s**. You get Regeneration I for 3s (see Downside).

### Active Skill 2: Sanctuary
- **Trigger:** Hold right-click for **2 seconds** (you're slowed while channeling, like drawing a bow).
- **Cooldown:** 30 seconds.
- **Mechanic:** A blooming circle of **5 blocks** radius stays where you stood for **6 seconds**. Players inside (you included) get **Regeneration II** in 3s doses; monsters inside get **Slowness I**. Petals and spore particles mark the edge.

### Passive: Seed of Life
- A fully charged hit on a **hostile mob** heals the most hurt other player within **8 blocks** for about **1 HP** (a short Regeneration II). Hits on players do nothing extra, so it can't be farmed in PvP.

### Downside: Healer's Oath
- Only **4 attack damage**.
- Your own healing from the staff is halved: you get **Regeneration I for 3s** instead of Instant Health.

---

## 5. Technical Implementation (Datapack)

- **Right-click:** a never-finishing `consumable` component (bow pose, slowed while held) plus `advancement/lifebloom/using.json` sets `lb_use` every tick it's held; `lb_hold` counts ticks. Releasing before 40 ticks runs `lifebloom/pulse`; reaching 40 runs `lifebloom/sanctuary`. Like any hoe, right-clicking dirt or grass tills it instead.
- **Sanctuary:** a `kandy.lb_sanct` marker with a 120-tick `lb_life`; once a second it gives Regeneration II to players within 5 blocks who don't already have Regeneration, and Slowness I to `#kandy:monsters`.
- **Seed of Life:** `advancement/hit/lifebloom.json` (charged melee hit on a non-player) finds the lowest `hp` (the pack's health scoreboard) among other players within 8 blocks.
- **Cooldowns:** `lb_cd` (240 ticks), `lb_scd` (600 ticks).
