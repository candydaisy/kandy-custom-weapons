# Bloodhound's Whistle (Anti-Stealth & Hunt Tracker)

> *"Carved from elder goat horn and lined with sculk sensor tendrils. Its piercing blast reverberates through bone, stripping away illusions and exposing fleeing prey."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:goat_horn`
- **Rarity:** `epic`
- **Category:** Information & Anti-Stealth PvP Utility
- **Custom Data:** `{utility: "BloodhoundWhistle", type: "pvp"}`
- **Display Gradient:** Crimson Gold to Sculk Cyan (`#e74c3c` → `#f39c12` → `#1abc9c` → `#16a085`)
- **Lore Text:**
  ```json
  [
    {"text": "Sound Whistle: Emits a 30-block sonar wave that exposes all nearby enemies.", "color": "gray", "italic": false},
    {"text": "Anti-Stealth: Instantly strips Invisibility and applies Glowing for 8 seconds.", "color": "gray", "italic": false},
    {"text": "Blood Trail: Renders a floating crimson footprint trail directly to the lowest-HP enemy.", "color": "gray", "italic": false},
    {"text": "Pack Cry: Grants you and nearby teammates Speed II for 5 seconds.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Sensor Core** (`minecraft:sculk_sensor[custom_data={core:"sensor"}]`)
- **Unlock Trigger:** Ringing a **Bell** or finding a **Sculk Sensor**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:sculk_sensor`
  - **Sides (N, S, E, W):** 4× `minecraft:copper_ingot`
  - **Corners:** 4× `minecraft:amethyst_shard`

### Step 2: Forging at the Smithing Table
- **Template:** **Sensor Core**
- **Base Tool:** `minecraft:goat_horn`
- **Addition Catalyst:** `minecraft:echo_shard`

---

## 3. Skills & Powers

### Active: Sonar Revelation (Anti-Invisibility Scan)
- **Trigger:** Right-click horn to sound the whistle.
- **Cooldown:** 25.0 seconds.
- **Mechanic:**
  - Plays a unique high-pitch acoustic screech (`item.goat_horn.sound.0` modulated).
  - Emits a fast-expanding spherical sonic ring (`sonic_boom` rings + `sculk_soul`).
  - Scans an **entire 30-block radius** around the user through walls and terrain:
    - Automatically removes and prevents **Invisibility** on any hostile players.
    - Afflicts all hostile players with **Glowing** for **8.0 seconds**.
    - Reveals their active held items and armor even through solid obsidian or cobblestone walls.

### Passive: Blood Trail (Scent of Prey)
- **Description:** Automatically highlights the closest wounded runner.
- **Mechanic:**
  - Identifies the enemy player with the lowest health within the 30-block radius.
  - Spawns a glowing directional breadcrumb trail of crimson scent particles (`dust{color:[220, 20, 60]}`) along the ground directly leading to their current position.
  - Perfect for hunting down players who pearl away or hide in caves to eat golden apples.

### Active Buff: Pack Rush
- **Mechanic:**
  - Sounding the whistle galvanizes you and all allies within 15 blocks, granting **Speed II** for **5.0 seconds** to close the distance rapidly.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Use Detection:**
  Advancement trigger `minecraft:consume_item` or `minecraft.used:minecraft.goat_horn`.
- **Whistle Activation Function (`whistle_ping.mcfunction`):**
  ```mcfunction
  playsound item.goat_horn.sound.5 ambient @a ~ ~ ~ 2 1.8
  particle sonic_boom ~ ~1 ~ 0 0 0 0 1
  
  # Strip invisibility & apply glowing
  effect clear @e[distance=..30,type=player,team=!ally] minecraft:invisibility
  effect give @e[distance=..30,type=player,team=!ally] minecraft:glowing 8 0 true
  
  # Team Speed Buff
  effect give @a[distance=..15,team=ally] minecraft:speed 5 1 true
  
  # Target lowest HP runner
  execute as @e[distance=..30,type=player,team=!ally,sort=nearest,limit=1] at @s run function kandy:pvp/mark_prey
  ```
- **Blood Trail Raycast:**
  Draws particle line from user position towards target's current position using recursive vector function.
