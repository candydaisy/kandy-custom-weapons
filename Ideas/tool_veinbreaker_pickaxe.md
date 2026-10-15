# Veinbreaker Pickaxe

> *"Forged from dense lodestone and netherite alloys. Its rhythmic strikes resonate through stone, shattering entire veins with a single blow."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:netherite_pickaxe`
- **Rarity:** `epic`
- **Category:** Mining Utility Tool
- **Custom Data:** `{utility: "Veinbreaker", type: "tool"}`
- **Display Gradient:** Bedrock Charcoal to Molten Gold (`#2c3e50` → `#4b6584` → `#f1c40f` → `#f39c12`)
- **Lore Text:**
  ```json
  [
    {"text": "Sneak-Mine: Excavates an entire contiguous ore vein (up to 32 blocks).", "color": "gray", "italic": false},
    {"text": "Right-click on solid rock: Emits a Seismic Pulse revealing nearby ores.", "color": "gray", "italic": false},
    {"text": "Sprinting while mining: Tunnel Bore digs a clean 3x3 shaft.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Seismic Core** (`minecraft:lodestone[custom_data={core:"seismic"}]`)
- **Unlock Trigger:** Finding an **Ancient Debris** or crafting a **Lodestone**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:lodestone`
  - **Sides (N, S, E, W):** 4× `minecraft:tnt`
  - **Corners:** 4× `minecraft:iron_block`

### Step 2: Forging at the Smithing Table
- **Template:** `Seismic Core`
- **Base Tool:** `minecraft:netherite_pickaxe`
- **Addition Catalyst:** `minecraft:netherite_ingot` (or `minecraft:echo_shard`)

---

## 3. Tool Attributes & Properties

- **Mining Tier:** Netherite + 20% Base Mining Speed
- **Durability:** Unbreakable (`unbreakable={}`)
- **Fortune / Silk Touch Compatibility:** Honors existing enchantments applied prior to forging.

---

## 4. Skills & Powers

### Passive 1: Vein Mining (Contiguous Ore Harvesting)
- **Trigger:** Mining any ore block while **Sneaking (Crouching)**.
- **Mechanic:**
  - Automatically breaks all connected ore blocks of the same type within a 10-block radius (up to a maximum cap of 32 blocks per strike).
  - Teleports all dropped items and XP directly to the player's position, preventing loss in lava or dark caverns.
  - Sound: Chain fracture resonance `block.amethyst_cluster.break` with rising pitch.

### Passive 2: Tunnel Bore (3×3 Shaft Mining)
- **Trigger:** Mining stone, deepslate, netherrack, or end stone while **Sprinting**.
- **Mechanic:**
  - Carves out a clean 3×3 square centered on the mined block perpendicular to the player's facing axis.
  - Leaves behind smooth walking terrain (does not break air below feet).
  - Drops blocks compacted into their consolidated forms (e.g. Cobblestone directly into inventory).

### Active Skill: Seismic Sonar (Ore Ping)
- **Trigger:** Right-click on any solid stone/deepslate block.
- **Cooldown:** 10.0 seconds.
- **Mechanic:**
  - Sends a low-frequency ground tremor outward in an 18-block spherical radius (`block.sculk_sensor.clicking`).
  - Scans for rare ores (Diamond, Ancient Debris, Gold, Emerald, Copper, Iron).
  - Outlines detected ores through solid walls using brief glowing outline particles (`glow` and block markers) lasting **4 seconds**.
  - A summary tone chimes: higher pitch means high-value ores (Debris/Diamond) nearby!

---

## 5. Technical Implementation Blueprint (Datapack)

- **Mining Detection:**
  - Use custom advancement trigger `minecraft:player_damaged_block` or `item_used_on_block` / scoreboard tracking `minecraft.mined:minecraft.deepslate` etc.
- **Vein Mining Logic (`veinminer.mcfunction`):**
  - Recursive search function tagging matching adjacent blocks:
    ```mcfunction
    execute positioned ~1 ~ ~ if block ~ ~ ~ #c:ores run function kandy:tool/break_adjacent
    execute positioned ~-1 ~ ~ if block ~ ~ ~ #c:ores run function kandy:tool/break_adjacent
    execute positioned ~ ~1 ~ if block ~ ~ ~ #c:ores run function kandy:tool/break_adjacent
    execute positioned ~ ~-1 ~ if block ~ ~ ~ #c:ores run function kandy:tool/break_adjacent
    execute positioned ~ ~ ~1 if block ~ ~ ~ #c:ores run function kandy:tool/break_adjacent
    execute positioned ~ ~ ~-1 if block ~ ~ ~ #c:ores run function kandy:tool/break_adjacent
    ```
- **Seismic Sonar Marker:**
  - Spawns invisible glowing markers on identified ore coordinates with `Glowing:1b` and `Tags:["kandy.ore_ping"]`.
  - Timer clears markers after 80 ticks (4 seconds).
