# Shadow Smoke Grenade (Tactical Obscuration & Disengagement)

> *"Filled with crushed sculk catalysts and dried wither rose ash. When shattered, it unleashes a choking blackout veil that blinds senses and disrupts ender frequencies."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:snowball` (or `minecraft:splash_potion`)
- **Rarity:** `rare`
- **Category:** Tactical PvP Utility
- **Custom Data:** `{utility: "SmokeGrenade", type: "pvp"}`
- **Display Gradient:** Shadow Charcoal to Ash White (`#1e272c` → `#34495e` → `#7f8c8d` → `#bdc3c7`)
- **Lore Text:**
  ```json
  [
    {"text": "Thrown: Detonates a dense 7x7 Smoke Screen on impact lasting 6 seconds.", "color": "gray", "italic": false},
    {"text": "Blackout Veil: Enemies inside receive Blindness, Darkness, and cannot be targeted.", "color": "gray", "italic": false},
    {"text": "Pearl Disruption: Ender Pearls passing through the smoke detonate harmlessly in air.", "color": "gray", "italic": false},
    {"text": "Cleanse: Cleanses Glowing outlines from yourself when stepping inside.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Obscurity Core** (`minecraft:wither_rose[custom_data={core:"obscurity"}]`)
- **Unlock Trigger:** Collecting a **Wither Rose** or brewing an **Invisibility Potion**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:wither_rose`
  - **Sides (N, S, E, W):** 4× `minecraft:gunpowder`
  - **Corners:** 4× `minecraft:ink_sac`

### Step 2: Forging at the Smithing Table
- **Template:** **Obscurity Core**
- **Base Tool:** `minecraft:snowball` (or `minecraft:potion`)
- **Addition Catalyst:** `minecraft:fermented_spider_eye`
- **Yield:** 4× Reusable / Stackable Smoke Grenades

---

## 3. Skills & Powers

### Active: Smoke Detonation & Blind Cloud
- **Trigger:** Throwing the grenade (Right-click).
- **Cooldown:** 12.0 seconds.
- **Mechanic:**
  - On surface or entity impact, bursts into a 7×7 cubic cloud of thick black and grey smoke particles (`campfire_signal_smoke`, `smoke`, `squid_ink`).
  - The smoke persists for **6.0 seconds**.
  - Any opponent inside or entering the smoke receives **Blindness I** and **Darkness** for 3 seconds (refreshes while remaining inside).
  - Melee hit indicator particles and nameplates are completely masked within the cloud.

### Passive: Ender Frequency Jammer (Anti-Pearl)
- **Description:** Disrupts teleportation projectiles thrown by opponents.
- **Mechanic:**
  - Any hostile `ender_pearl` passing through the smoke cloud is instantly intercepted and extinguished in mid-air, preventing enemy rushers from pearling into your position or pearling away to escape.

### Utility: Target Lock & Glow Breaker
- **Description:** Clears tracking effects on allies.
- **Mechanic:**
  - Stepping into your own smoke immediately clears the **Glowing** status effect and breaks arrow target tracking.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Projectile Tracking:**
  - Throwing detected via `minecraft.used:minecraft.snowball` while holding `{utility: "SmokeGrenade"}`.
  - Tag spawned projectile: `tag @e[type=snowball,limit=1,sort=nearest] add kandy.smoke_proj`.
- **Detonation Function (`smoke_explode.mcfunction`):**
  - Summon a marker tagged `kandy.smoke_cloud` with scoreboard lifetime `kandy.timer = 120` (6s).
  - Sound: `block.fire.extinguish` and `entity.generic.explode` (low pitch).
- **Cloud Tick Function (`smoke_cloud_tick.mcfunction`):**
  ```mcfunction
  # Visuals
  particle campfire_signal_smoke ~ ~1 ~ 1.8 1.0 1.8 0.01 15
  particle squid_ink ~ ~1 ~ 1.5 0.8 1.5 0.02 10

  # Debuff enemies
  effect give @e[distance=..3.5,type=player,team=!ally] minecraft:blindness 2 0 true
  effect give @e[distance=..3.5,type=player,team=!ally] minecraft:darkness 2 0 true

  # Anti-Pearl Interception
  execute at @e[type=ender_pearl,distance=..3.5] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.1 20
  kill @e[type=ender_pearl,distance=..3.5]
  ```
