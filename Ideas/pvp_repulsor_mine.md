# Repulsor Mine (Anti-Crystal & Kinetic Countermeasure)

> *"Forged from compressed breeze chambers and heavy obsidian plating. Armed to detonate upon enemy proximity, shattering end crystals and hurling rushers backward."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:wind_charge` (or `minecraft:heavy_weighted_pressure_plate`)
- **Rarity:** `epic`
- **Category:** Countermeasure & Anti-Crystal PvP Utility
- **Custom Data:** `{utility: "RepulsorMine", type: "pvp"}`
- **Display Gradient:** Breeze Teal to Heavy Obsidian Violet (`#00d2d3` → `#54a0ff` → `#5f27cd` → `#341f97`)
- **Lore Text:**
  ```json
  [
    {"text": "Deployable Proximity Mine: Arms 1 second after placement on the ground.", "color": "gray", "italic": false},
    {"text": "Anti-Crystal Shockwave: Instantly detonates & clears hostile End Crystals.", "color": "gray", "italic": false},
    {"text": "Kinetic Repulse: Hurls incoming rushers 10 blocks backward, canceling their sprint.", "color": "gray", "italic": false},
    {"text": "Projectile Reflection: Deflects incoming arrows and wind charges back at attackers.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Repulsor Core** (`minecraft:obsidian[custom_data={core:"repulsor"}]`)
- **Unlock Trigger:** Defeating a **Breeze** or mining **Crying Obsidian**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:crying_obsidian`
  - **Sides (N, S, E, W):** 4× `minecraft:breeze_rod`
  - **Corners:** 4× `minecraft:iron_block`

### Step 2: Forging at the Smithing Table
- **Template:** **Repulsor Core**
- **Base Tool:** `minecraft:wind_charge`
- **Addition Catalyst:** `minecraft:slime_ball`
- **Yield:** 2× Deployable Repulsor Mines

---

## 3. Skills & Powers

### Active: Deploy Mine
- **Trigger:** Right-click on ground or wall surface.
- **Cooldown:** 15.0 seconds.
- **Mechanic:**
  - Places a glowing magnetic mine on the floor (`Tags:["kandy.repulsor_mine"]`).
  - Takes **1.0 second to arm** (beeps with `block.note_block.bit` in rising pitch).
  - Can be picked back up by the owner by crouching and right-clicking.

### Passive 1: Anti-Crystal Detonation & Area Sweep
- **Description:** Directly counters modern End Crystal & Respawn Anchor PvP tactics.
- **Mechanic:**
  - Whenever an enemy player, hostile End Crystal (`end_crystal`), or Respawn Anchor is placed within a **6-block radius**, the mine violently detonates.
  - The shockwave vaporizes all placed hostile End Crystals safely before they can be detonated, converting crystal explosions into harmless bursts of wind.

### Passive 2: Kinetic Repulsion Shockwave
- **Description:** Shuts down aggressive melee rushers.
- **Mechanic:**
  - Enemy players caught in the detonation are launched **10 blocks backward** with heavy horizontal velocity.
  - Deals **8 kinetic damage** (scales up if they collide with walls).
  - Resets the owner's fall damage and knocks back any incoming TNT carts.

### Passive 3: Projectile Deflection Dome
- **Description:** For 2.5 seconds following detonation, a shimmering acoustic shield reflects all hostile incoming arrows and projectiles directly back toward the attackers who fired them.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Mine Entity Setup:**
  - Summon invisible interaction/marker entity at block coordinate:
    `summon marker ~ ~ ~ {Tags:["kandy.mine_active","kandy.repulsor"],custom_data:{owner:1b}}`
  - Continuous particle pulse:
    `particle wind_charge ~ ~0.2 ~ 0.2 0.1 0.2 0 1`
- **Detonation Trigger (`mine_check.mcfunction`):**
  ```mcfunction
  # Check enemy proximity
  execute at @s if entity @e[type=player,team=!ally,distance=..4] run function kandy:pvp/repulsor_detonate
  # Check end crystal proximity
  execute at @s if entity @e[type=end_crystal,distance=..6] run function kandy:pvp/repulsor_detonate
  ```
- **Detonation Execution (`repulsor_detonate.mcfunction`):**
  ```mcfunction
  # Kill dangerous crystals safely
  kill @e[type=end_crystal,distance=..6]
  
  # Kinetic blast on hostiles
  execute at @s run damage @e[type=player,team=!ally,distance=..6] 8 kandy:kinetic
  execute at @s run execute as @e[type=player,team=!ally,distance=..6] facing entity @s run tp @s ^ ^0.5 ^-3
  
  # Effects
  particle explosion_emitter ~ ~0.5 ~ 0 0 0 0 1
  particle wind_charge ~ ~0.5 ~ 2 0.5 2 0 40
  playsound entity.breeze.wind_burst player @a ~ ~ ~ 2 0.8
  kill @s
  ```
