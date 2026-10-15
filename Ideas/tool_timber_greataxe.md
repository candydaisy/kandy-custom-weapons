# Lumberjack's Greataxe (Timber Greataxe)

> *"Infused with ancient woodland vitality. Striking the roots of even the colossal jungle trees causes the entire canopy to yield."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:diamond_axe` (or `minecraft:netherite_axe`)
- **Rarity:** `epic`
- **Category:** Forestry & Woodcutting Utility
- **Custom Data:** `{utility: "TimberAxe", type: "tool"}`
- **Display Gradient:** Forest Green to Sunlit Amber (`#1b4d3e` → `#2d6a4f` → `#52b788` → `#d8f3dc`)
- **Lore Text:**
  ```json
  [
    {"text": "Treecapitator: Breaking the base log fells the entire tree.", "color": "gray", "italic": false},
    {"text": "Foliage Decay: Instantly vaporizes attached leaves into saplings & sticks.", "color": "gray", "italic": false},
    {"text": "Auto-Replant: Automatically plants a new sapling on the felled stump.", "color": "gray", "italic": false},
    {"text": "Sneak-Break: Normal single-block chopping mode.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Verdant Core** (`minecraft:oak_sapling[custom_data={core:"verdant"}]`)
- **Unlock Trigger:** Chopping **100 logs** or collecting any **Mangrove Propagule**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:heart_of_the_sea` (or `minecraft:moss_block`)
  - **Sides (N, S, E, W):** 4× `minecraft:golden_apple`
  - **Corners:** 4× `minecraft:bone_block`

### Step 2: Forging at the Smithing Table
- **Template:** **Verdant Core**
- **Base Tool:** `minecraft:diamond_axe`
- **Addition Catalyst:** `minecraft:emerald_block`

---

## 3. Tool Attributes & Properties

- **Efficiency:** +25% chopping speed on all `#minecraft:logs`.
- **Durability:** Unbreakable (`unbreakable={}`).
- **Combat Stats:** Deals +9 attack damage (can double as a defensive heavy weapon).

---

## 4. Skills & Powers

### Passive 1: Treecapitator (Whole Tree Felling)
- **Trigger:** Breaking any natural tree log without holding Sneak.
- **Mechanic:**
  - Traverses vertically and diagonally through connected `#minecraft:logs` up to 128 blocks high (works seamlessly on giant 2×2 Spruce, Jungle, Dark Oak, and Mega Trees).
  - Breaks all logs in the tree structure in a cascading top-down falling sequence.
  - Draws all dropped wood blocks directly toward the player's feet.

### Passive 2: Instant Canopy Defoliator
- **Description:** No more floating leaves left behind.
- **Mechanic:**
  - As logs break, all connected `#minecraft:leaves` within a 4-block radius of the tree trunk instantly decay in a burst of green leaf particles (`cherry_leaves` / `falling_nectar`).
  - Drops saplings, sticks, and apples at +50% boosted drop rates.

### Passive 3: Arborist Replant
- **Description:** Sustainable lumber harvesting.
- **Mechanic:**
  - If the bottom block broken is resting on `dirt`, `grass_block`, or `podzol`, a matching sapling is instantly planted in the vacant spot.
  - Never leaves barren clear-cut wastelands behind.

### Control Toggle: Precision Mode
- **Trigger:** Hold **Sneak (Shift)** while chopping.
- **Mechanic:** Suppresses the Treecapitator and defoliation abilities, allowing normal single-block wood carving and construction adjustments.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Block Break Advancement:**
  - Trigger: `minecraft:player_damaged_block` or `item_used_on_block` with item condition matching `{utility: "TimberAxe"}` and block tag `#minecraft:logs`.
- **Log Traversal Loop (`tree_fell.mcfunction`):**
  - Recursive search:
    ```mcfunction
    execute as @s at @s run function kandy:tool/chop_recursive
    ```
  - `chop_recursive.mcfunction` searches upward `~ ~1 ~`, `~1 ~1 ~`, etc., breaks logs with `/setblock ~ ~ ~ air destroy`, and schedules leaf clear.
- **Replant Logic:**
  - At the original base coordinate:
    `execute if block ~ ~-1 ~ #minecraft:dirt run setblock ~ ~ ~ <matching_sapling>`
