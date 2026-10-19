# Eclipse Longbow

> *"Formed from remnants of the End's collapsed stars. Arrows shot from this bow bend space and drink the light."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:bow`
- **Rarity:** `epic`
- **Theme:** Void, Space Distortion, Singularity, Shadow Archery, Gravity
- **Custom Data:** `{ability: "Eclipse"}`
- **Display Gradient:** Cosmic Purple to Pale Lilac (`#7a1fb0` → `#a855f7` → `#d8b4fe`)
- **Lore Text:**
  ```json
  [
    {"text": "Arrows pierce up to 3 targets and trail void dust.", "color": "gray", "italic": false},
    {"text": "Full-draw hits mark targets: Glowing 3s, Darkness 1s.", "color": "gray", "italic": false},
    {"text": "Full draw: Singularity Arrow pulls enemies in, then implodes (12s).", "color": "light_purple", "italic": false},
    {"text": "Sneak while your arrow flies: Shadow Warp to it (10s).", "color": "light_purple", "italic": false},
    {"text": "Shadow Warp costs 2 HP.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Eclipse Core** (shown as `minecraft:ender_eye` via `item_model`; the real item is an unobtainable `minecraft:vault` template)
- **Unlock Trigger:** Getting an **Ender Eye** or **Dragon's Breath**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:ender_eye`
  - **Sides (N, S, E, W):** 4× `minecraft:crying_obsidian`
  - **Corners:** 4× `minecraft:ender_pearl`

### Step 2: Forging at the Smithing Table
- **Template:** `Eclipse Core`
- **Base Weapon:** `minecraft:bow`
- **Addition Catalyst:** `minecraft:dragon_breath`

---

## 3. Weapon Attributes & Stat Profile

- **Arrow Damage:** vanilla bow damage **+15%** (arrow base damage 2.3 instead of 2.0)
- **Piercing:** every arrow pierces up to **3 targets**
- **Durability:** Unbreakable (`unbreakable={}`)
- Keeps bow enchantments (Power, Infinity, Flame...).

---

## 4. Skills & Powers

### Passive: Void Piercing
- Arrows pierce up to 3 targets and leave a void-dust trail.
- **Full-draw hits** give targets **Glowing for 3s** and **Darkness for 1s**.

### Active Skill 1: Event Horizon (Singularity Arrow)
- **Trigger:** A full-draw (critical) shot while Singularity is ready. Works from either hand.
- **Cooldown:** 12 seconds.
- **Mechanic:**
  - Where the arrow lands (or the creature it hits), a **2.5s vortex** opens.
  - It pulls everything within **5 blocks** toward the core: mobs fast, players gently, never the shooter.
  - Everything inside takes **1 armor-piercing damage every 0.5s**.
  - At the end it **implodes for 6 damage** at the core.

### Active Skill 2: Shadow Warp
- **Trigger:** **Start** sneaking (holding Sneak doesn't repeat it) while one of your Eclipse arrows is flying, or landed within the last 3 seconds.
- **Cooldown:** 10 seconds.
- **Mechanic:**
  - Teleports you to the arrow, only onto a safe spot (feet and head clear, no lava or fire). If the arrow is stuck in a wall, it backs off along the arrow's path.
  - A shadow decoy at your departure spot gives **Blindness for 1s** to players right next to it.
  - You get a moment of Slow Falling, and you don't keep your momentum.
  - No safe spot means it fizzles without spending the cooldown.
  - The arrow Shadow Warp would pick is highlighted (only you see it).

### Downside: Void Tax
- Each Shadow Warp costs **2 HP**.

---

## 5. Technical Implementation (Datapack)

- **Arrow pickup:** each new arrow is checked once (`eclipse/check_arrow`) for `weapon.components."minecraft:custom_data"{ability:"Eclipse"}`, then gets `PierceLevel:2b` and `damage:2.3d`.
- **Ownership:** arrows store the shooter's `Owner` UUID, compared against the player's UUID (`execute on owner` doesn't resolve arrow owners in 26.3).
- **Full-draw hits:** `advancement/hit/eclipse.json` (projectile damage ≥ 5, bow in either hand).
- **Singularity:** a tracker marker follows the arrow and opens a vortex marker when the arrow lands or vanishes; `ecl_life` times it (50 ticks for the vortex).
- **Scoreboards:** `ecl_cd` (240-tick Singularity cooldown), `ecl_warp` (200-tick Shadow Warp cooldown), `ecl_n` (warpable arrows in range, shown on the boss bar).
