# Verdant Sprig (Nature's Mending & Rooted Stance)

> *"Cut from a tree that grew through a ruined castle. It still remembers sunlight and stone alike."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:stick`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "VerdantSprig", type: "talisman"}`
- **Display Gradient:** Spring Leaf to Old Moss (`#d8f3dc` → `#95d5b2` → `#52b788` → `#2d6a4f`)
- **Lore Text:**
  ```json
  [
    {"text": "Standing on grass, moss or leaves under open sky heals 1 HP every 5s.", "color": "gray", "italic": false},
    {"text": "Sneaking on natural ground roots you: +50% knockback resistance.", "color": "gray", "italic": false},
    {"text": "Too long without sunlight withers it: Hunger I.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Grove Core** (shown as `minecraft:moss_block` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Getting **Moss** or a **Sapling** of any kind
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:moss_block`
  - **Sides (N, S, E, W):** 4× `minecraft:oak_sapling`
  - **Corners:** 4× `minecraft:vine`

### Step 2: Forging at the Smithing Table
- **Template:** `Grove Core`
- **Base Item:** `minecraft:stick`
- **Addition Catalyst:** `minecraft:glow_berries`

---

## 3. Skills & Powers

### Passive: Photosynthesis
- **Trigger:** Standing on **grass, moss, mud, rooted dirt or leaves** with open sky above you (`can_see_sky`).
- **Mechanic:** Heals **1 HP every 5 seconds** (a short Regeneration pulse) and shows a few `happy_villager` / `spore_blossom_air` particles. Works day or night as long as the sky is open.

### Passive: Rooted Stance
- **Trigger:** Sneaking while standing on any of the natural blocks above.
- **Mechanic:** **+0.5 knockback resistance** (attribute modifier `kandy:verdant_root`) while the stance holds. Good for holding a position against knockback-heavy weapons.

### Downside
- **Withering:** after **60 seconds in a row with no sky above you** (caves, the Nether, the End, indoors), you get **Hunger I** until you step back under open sky. Mining trips cost food.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"VerdantSprig"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD (`kandy:hud/b/...`) while recharging, like the other charms.
- **Ground check:** a block tag `kandy:verdant_sprig_ground` (`#minecraft:grass_blocks`, `#minecraft:moss_blocks`, `#minecraft:mud`, rooted_dirt, `#minecraft:leaves`) tested with `if block ~ ~-1 ~ #kandy:verdant_sprig_ground`.
- **Sky check:** location predicate `minecraft:location {light:{...}}` won't distinguish sky light; use `can_see_sky` (`minecraft:location` field) for both Photosynthesis and Withering.
- **Heal:** `effect give @s minecraft:regeneration 3 0 true` every 100 ticks (Regeneration I heals ~1 HP per 2.5s, so a 3s pulse ≈ 1 HP).
