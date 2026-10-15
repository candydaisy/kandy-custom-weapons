# Barbed Caltrops Pouch (Area Denial & Anti-Sprint Utility)

> *"A leather pouch brimming with four-pointed jagged steel caltrops. Scatter them across choke points to puncture armor boots and cripple charging pursuers."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:iron_nugget` (or `minecraft:pointed_dripstone`)
- **Rarity:** `rare`
- **Category:** Hazard Placement & Anti-Pursuit PvP Utility
- **Custom Data:** `{utility: "Caltrops", type: "pvp"}`
- **Display Gradient:** Rusty Steel to Puncture Crimson (`#718093` → `#2f3640` → `#c23616` → `#e84118`)
- **Lore Text:**
  ```json
  [
    {"text": "Right-click: Scatters a 5x5 hazard zone of razor caltrops on the floor.", "color": "gray", "italic": false},
    {"text": "Puncture Wound: Enemies stepping into caltrops take 3 piercing damage.", "color": "gray", "italic": false},
    {"text": "Cripple: Inflicts Slowness III; sprinting inflicts 2 bleed damage per second.", "color": "gray", "italic": false},
    {"text": "Persists on the battlefield for 15 seconds.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Spike Core** (`minecraft:pointed_dripstone[custom_data={core:"spike"}]`)
- **Unlock Trigger:** Collecting **Pointed Dripstone** or **Iron Nuggets**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:pointed_dripstone`
  - **Sides (N, S, E, W):** 4× `minecraft:iron_bars`
  - **Corners:** 4× `minecraft:flint`

### Step 2: Forging at the Smithing Table
- **Template:** **Spike Core**
- **Base Tool:** `minecraft:iron_nugget`
- **Addition Catalyst:** `minecraft:leather`
- **Yield:** 1× Refillable Caltrop Pouch (3 Charges, recharges over time)

---

## 3. Skills & Powers

### Active: Scatter Hazard (Choke Point Denial)
- **Trigger:** Right-click aiming at ground blocks.
- **Cooldown:** 10.0 seconds.
- **Mechanic:**
  - Scatters dozens of sharp iron spikes across a **5×5 floor perimeter** lasting **15.0 seconds**.
  - Visible on ground as small jagged metallic particle clusters (`crit`, `item iron_nugget`, `ash`).
  - Allies and the placer receive a subtle visual indicator and suffer 0 negative effects when stepping through friendly caltrops.

### Passive: Deep Puncture (Armor-Piercing & Bleed)
- **Description:** Pierces through boots and tears flesh.
- **Mechanic:**
  - Stepping into the hazard deals **3.0 armor-ignoring piercing damage** and destroys 5 durability on the victim's boots.
  - Inflicts **Cripple** for **4.0 seconds**:
    - **Slowness III** (makes strafing/sprinting impossible without jumping).
    - If the victim attempts to sprint, the spikes tear open their wounds, dealing **2.0 bleed damage every second** they keep sprinting.
  - Audio: Sharp metal clatter `block.chain.step` and painful flesh slash `entity.player.hurt_sweet_berry_bush`.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Hazard Marker Summon:**
  On right-click:
  ```mcfunction
  execute at @s run summon marker ~ ~ ~ {Tags:["kandy.caltrop_zone"],custom_data:{owner_team:1b,lifetime:300}}
  playsound entity.item.break player @s ~ ~ ~ 1 1.8
  ```
- **Zone Ticking (`caltrop_tick.mcfunction`):**
  - Displays particles:
    `particle item iron_nugget ~ ~0.1 ~ 1.5 0.05 1.5 0.01 10`
  - Detects hostile targets:
    ```mcfunction
    execute as @e[distance=..2.5,type=player,team=!ally] at @s run function kandy:pvp/caltrop_puncture
    ```
- **Puncture Function (`caltrop_puncture.mcfunction`):**
  ```mcfunction
  damage @s 3 kandy:puncture
  effect give @s minecraft:slowness 4 2 true
  tag @s add kandy.crippled
  playsound entity.player.hurt_sweet_berry_bush player @s ~ ~ ~ 1 1
  ```
- **Sprinting Check:**
  If target with `tag=kandy.crippled` is sprinting (`sprint_one_cm` score > 0), deal 2 bleed damage and spawn blood red dust particles.
