# Lifebloom Staff

> *"Cut from the heartwood of a tree that grew over a battlefield. It has seen enough dying."*

**Status:** Proposed (not implemented)

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
    {"text": "Right-click: Mending Pulse heals allies within 6 blocks for 2 hearts (12s).", "color": "gray", "italic": false},
    {"text": "Hold right-click 2s: Sanctuary, a 6s healing circle that slows monsters (30s).", "color": "gold", "italic": false},
    {"text": "Charged hits on monsters heal your most injured ally nearby.", "color": "gray", "italic": false},
    {"text": "A healer's oath: weak strikes, and your own healing is halved.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Bloom Core** (shown as `minecraft:flowering_azalea` via `item_model`; real item: an unused spawn egg template such as `minecraft:bee_spawn_egg`)
- **Unlock Trigger:** Brewing a **Potion of Healing**, or getting a **Golden Apple**
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

**Allies:** other players on your scoreboard team, plus your tamed pets. If you're not on a team, every other player counts, so in PvP put allies on a team or you'll heal your enemies too.

### Active Skill 1: Mending Pulse
- **Trigger:** Right-click (a quick press).
- **Cooldown:** 12 seconds.
- **Mechanic:** Allies within **6 blocks** are healed for **4 HP (Instant Health I)**. Allies below half health also get **Regeneration I for 4s**. You're healed too, at half strength (see Downside).

### Active Skill 2: Sanctuary
- **Trigger:** Hold right-click for **2 seconds** (you're slowed while channeling, like drawing a bow).
- **Cooldown:** 30 seconds.
- **Mechanic:** A blooming circle of **5 blocks** radius stays where you stood for **6 seconds**. Allies inside get **Regeneration I**; hostile mobs inside get **Slowness I** and can't regenerate. Petals and spore particles mark the edge.

### Passive: Seed of Life
- A fully charged hit on a **hostile mob** heals the most injured ally within **8 blocks** (not you) for **1 HP**. Hits on players do nothing extra, so it can't be farmed in PvP.

### Downside: Healer's Oath
- Only **4 attack damage**.
- Your own healing from the staff is halved: you get **Regeneration I for 3s** instead of Instant Health.

---

## 5. Technical Implementation Notes (Datapack)

- **Right-click:** a never-finishing `consumable` component plus a `using_item` advancement (Chronos Stiletto's pattern); a short press is a Pulse, 40 held ticks is Sanctuary.
- **Allies:** `@a[team=<your team>]` via a macro on the caster's team name, or all players when the caster has no team; tamed pets via an `Owner` UUID compare.
- **Sanctuary:** a marker with a 120-tick life; effects pulse every 20 ticks to entities within 5 blocks.
- **Most injured ally:** read each candidate's health into a score and pick the lowest.
