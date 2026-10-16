# Harvester's Sheaf (Farming Charm)

> *"Bound from the last sheaf of a good year. Fields remember it."*

**Status:** Proposed (not implemented) · **PvE-only:** farming and animals only

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:wheat`
- **Rarity:** `uncommon`
- **Custom Data:** `{charm: "HarvestersSheaf", type: "talisman"}`
- **Display Gradient:** Straw Gold to Soil Brown (`#fff3b0` → `#e09f3e` → `#9e2a2b` → `#540b0e`)
- **Lore Text:**
  ```json
  [
    {"text": "Crops within 5 blocks of you sometimes grow a stage.", "color": "gray", "italic": false},
    {"text": "Animals you breed have a 25% chance of twins.", "color": "gray", "italic": false},
    {"text": "A farmer, not a fighter: -1 attack damage.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Harvest Core** (shown as `minecraft:hay_block` via `item_model`; real item: an unused spawn egg template such as `minecraft:llama_spawn_egg`)
- **Unlock Trigger:** Breeding any animal, or getting a **Hay Bale**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:composter`
  - **Sides (N, S, E, W):** 4× `minecraft:hay_block`
  - **Corners:** 4× `minecraft:bone_meal`

### Step 2: Forging at the Smithing Table
- **Template:** `Harvest Core`
- **Base Item:** `minecraft:wheat`
- **Addition Catalyst:** `minecraft:golden_carrot`

---

## 3. Skills & Powers

### Passive: Green Thumb
- Every **2 seconds**, a few random spots within **5 blocks** are checked; a crop found there (wheat, carrots, potatoes, beetroot, nether wart, sweet berries, cocoa) grows **one stage**. On average this roughly doubles crop growth while you stand in your field.

### Passive: Twin Births
- Breeding animals has a **25% chance** to produce a **second baby** of the same kind.

### Downside: Farmhand
- **-1 attack damage** while carried.

---

## 4. Technical Implementation Notes (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.harvesters_sheaf`.
- **Growth:** pick random x/z offsets with `random value` and a macro, then `execute if block <pos> #kandy:sheaf_crops` and bump the `age` state with a small per-crop function (each crop has a different max age).
- **Twins:** a `bred_animals` advancement; the reward finds the newest baby near the player (`Age` close to -24000) and summons a copy with the same variant data.
- **Damage:** `attack_damage` modifier `kandy:sheaf_farmhand` (-1).
