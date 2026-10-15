# Terramorpher Excavator (Area Shovel & Land Leveler)

> *"Infused with seismic terra-plates and earthmover energy. Reshapes hills, dunes, and riverbeds with swift, effortless sweeps."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:diamond_shovel` (or `minecraft:netherite_shovel`)
- **Rarity:** `epic`
- **Category:** Landscaping & Excavation Utility
- **Custom Data:** `{utility: "Terramorpher", type: "tool"}`
- **Display Gradient:** Terra Cotta Brown to Emerald Grass (`#8d6e63` → `#a1887f` → `#4caf50` → `#81c784`)
- **Lore Text:**
  ```json
  [
    {"text": "Excavation: Digs soft terrain (dirt, sand, gravel, clay) in a 3x3 plane.", "color": "gray", "italic": false},
    {"text": "Right-click ground: Instant Highway creates a 3x3 flattened dirt path.", "color": "gray", "italic": false},
    {"text": "Passive Sand Stabilizer: Prevents gravel/sand collapses above you.", "color": "gray", "italic": false},
    {"text": "Sneak-Dig: Toggles to single-block precise digging.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Terra Core** (`minecraft:clay[custom_data={core:"terra"}]`)
- **Unlock Trigger:** Digging **200 blocks of dirt/sand** or finding **Clay**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:terracotta`
  - **Sides (N, S, E, W):** 4× `minecraft:slime_ball`
  - **Corners:** 4× `minecraft:packed_mud`

### Step 2: Forging at the Smithing Table
- **Template:** **Terra Core**
- **Base Tool:** `minecraft:diamond_shovel`
- **Addition Catalyst:** `minecraft:honeycomb_block` (or `minecraft:prismarine_brick`)

---

## 3. Tool Attributes & Properties

- **Excavation Speed:** Instant break on dirt, gravel, sand, clay, soul sand, and mud.
- **Durability:** Unbreakable (`unbreakable={}`).
- **Compaction Mode:** Mined blocks are drawn directly into the player's inventory without creating lag from loose ground entities.

---

## 4. Skills & Powers

### Passive 1: 3×3 Wide Area Excavation
- **Trigger:** Digging any shovel-mineable block (`#minecraft:mineable/shovel`) without sneaking.
- **Mechanic:**
  - Clears a 3×3 flat plane centered on the targeted block.
  - Aligns excavation plane relative to the targeted face (horizontal for ceilings/floors, vertical for hills/walls).
  - Perfect for flattening mountains, clearing lake beds, or digging basement foundations in minutes.

### Passive 2: Sand & Gravel Anchor (Cave-in Immunity)
- **Description:** Stabilizes loose geological material.
- **Mechanic:**
  - When mining gravel or sand from beneath, the upper column is locked in place and will **never fall or collapse** onto the player.
  - Eliminates the hazard of gravel suffocation while caving.

### Active Skill: Instant Highway (Pavement Leveler)
- **Trigger:** Right-click on grass, dirt, or coarse dirt while walking.
- **Cooldown:** 0.25 seconds.
- **Mechanic:**
  - Flattens uneven terrain in a 3×3 area in front of the player, converting grass into clean `minecraft:dirt_path`.
  - Clears tall grass, flowers, and pebbles automatically, leaving a smooth road for horses and carts.
  - Grants a brief **Speed I** burst while walking on paths created by this tool.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Excavation Function (`shovel_3x3.mcfunction`):**
  - Triggered via block break advancement.
  - Evaluates player yaw and pitch:
    ```mcfunction
    # Horizontal ground excavation
    fill ~-1 ~ ~-1 ~1 ~ ~1 air replace #minecraft:mineable/shovel
    ```
- **Drop Vacuum:**
  - Teleports newly generated dropped items within 3 blocks to the player:
    `execute at @s run tp @e[type=item,distance=..4] @s`
- **Pathmaker Function (`highway.mcfunction`):**
  - On right-click detection (via carrot on a stick trigger or `minecraft.used:minecraft.diamond_shovel`):
    `execute at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 dirt_path replace grass_block`
    `particle happy_villager ~ ~0.1 ~ 1 0.1 1 0 10`
