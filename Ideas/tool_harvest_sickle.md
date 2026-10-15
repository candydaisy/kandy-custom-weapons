# Harvest Sickle (Agricultural & Shearing Utility)

> *"Infused with the cyclical blessings of harvest tides. Reaps sprawling farmlands in a single fluid gesture, replanting seeds before the chaff even settles."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:shears` (or `minecraft:golden_hoe`)
- **Rarity:** `rare`
- **Category:** Agriculture & Animal Husbandry Utility
- **Custom Data:** `{utility: "HarvestSickle", type: "tool"}`
- **Display Gradient:** Ripe Golden Wheat to Spring Sprout (`#f39c12` → `#f1c40f` → `#2ecc71` → `#27ae60`)
- **Lore Text:**
  ```json
  [
    {"text": "Right-click mature crops: 5x5 Area Harvest & instant seed replanting.", "color": "gray", "italic": false},
    {"text": "Fortune Harvest: +30% bonus crop yields (wheat, potatoes, carrots, wart).", "color": "gray", "italic": false},
    {"text": "Herd Shearing: Right-clicking any sheep shears all nearby sheep in an 8-block radius.", "color": "gray", "italic": false},
    {"text": "Silk Foliage: Instantly shears leaves, cobwebs, and vines without damage.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Bountiful Core** (`minecraft:hay_block[custom_data={core:"bountiful"}]`)
- **Unlock Trigger:** Harvesting **250 wheat/carrots** or crafting a **Hay Bale**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:hay_block`
  - **Sides (N, S, E, W):** 4× `minecraft:golden_carrot`
  - **Corners:** 4× `minecraft:bone_meal`

### Step 2: Forging at the Smithing Table
- **Template:** **Bountiful Core**
- **Base Tool:** `minecraft:shears`
- **Addition Catalyst:** `minecraft:glistering_melon_slice`

---

## 3. Tool Attributes & Properties

- **Tool Type:** Dual Shears & Scythe function.
- **Durability:** Unbreakable (`unbreakable={}`).
- **Harvest Radius:** 5×5 blocks centered on target crop.

---

## 4. Skills & Powers

### Active Skill 1: 5×5 Area Harvest & Instant Replant
- **Trigger:** Right-click on any mature crop (`wheat`, `carrots`, `potatoes`, `beetroots`, `nether_wart`, `cocoa_beans`).
- **Mechanic:**
  - Scans a 5×5 square around the targeted crop.
  - Automatically identifies and breaks only **fully mature** crops.
  - Leaves immature crops completely untouched so they continue growing.
  - Instantly consumes 1 seed from the harvest drops to replant age-0 seeds on the farmland.
  - Sweeps all harvested produce cleanly into the player's inventory with green chime particles (`happy_villager`).

### Passive 1: Bountiful Fortune
- **Description:** Supernatural agricultural fertility.
- **Mechanic:**
  - Crops harvested by the sickle receive Fortune III equivalents + an extra 10% chance to drop bonus rare items (e.g. Poisonous Potatoes become Golden Carrots, wheat has a chance to drop Golden Apples).

### Active Skill 2: Flock Shearing (Herd Shear)
- **Trigger:** Right-click any adult sheep with the sickle.
- **Mechanic:**
  - Simultaneously shears all unsheared adult sheep within an **8-block spherical radius**.
  - Collects all wool colors directly into tidy stacks.
  - Plays a gentle `entity.sheep.shear` chime and sparkles.

### Passive 2: Silk Foliage Harvesting
- **Trigger:** Breaking leaves, vines, glow lichen, or cobwebs.
- **Mechanic:**
  - Instant break speed with built-in Silk Touch.
  - Never damages farmland or stomps crops while walking on them holding this tool.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Crop Check & Replant (`harvest_area.mcfunction`):**
  - Run relative fill check across `~-2 ~ ~-2` to `~2 ~ ~2`:
    ```mcfunction
    execute positioned ~ ~ ~ if block ~ ~ ~ minecraft:wheat[age=7] run function kandy:tool/reap_wheat
    execute positioned ~ ~ ~ if block ~ ~ ~ minecraft:carrots[age=7] run function kandy:tool/reap_carrots
    execute positioned ~ ~ ~ if block ~ ~ ~ minecraft:potatoes[age=7] run function kandy:tool/reap_potatoes
    execute positioned ~ ~ ~ if block ~ ~ ~ minecraft:nether_wart[age=3] run function kandy:tool/reap_wart
    ```
  - In `reap_wheat.mcfunction`:
    `loot spawn ~ ~ ~ loot minecraft:blocks/wheat`
    `setblock ~ ~ ~ minecraft:wheat[age=0]`
- **Herd Shearing (`herd_shear.mcfunction`):**
  - On entity interact with sheep:
    `execute at @s run execute as @e[type=sheep,distance=..8] run function kandy:tool/shear_single_sheep`
