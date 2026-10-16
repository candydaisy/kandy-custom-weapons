# Hearthstone (Well-fed Warmth)

> *"A coal from a hearth that never went cold. Meals taste better next to it."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:charcoal`
- **Rarity:** `uncommon`
- **Custom Data:** `{charm: "Hearthstone", type: "talisman"}`
- **Display Gradient:** Ember Orange to Hearth Brown (`#ffb703` → `#fb8500` → `#bc6c25` → `#6f4518`)
- **Lore Text:**
  ```json
  [
    {"text": "Eating any food also gives Saturation I for 2s.", "color": "gray", "italic": false},
    {"text": "Standing near a lit campfire, furnace or smoker: Regeneration I.", "color": "gray", "italic": false},
    {"text": "A warm belly empties fast: you get hungry 20% quicker.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Hearth Core** (shown as `minecraft:campfire` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Cooking any food in a **Furnace, Smoker or Campfire**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:campfire`
  - **Sides (N, S, E, W):** 4× `minecraft:coal_block`
  - **Corners:** 4× `minecraft:bread`

### Step 2: Forging at the Smithing Table
- **Template:** `Hearth Core`
- **Base Item:** `minecraft:charcoal`
- **Addition Catalyst:** `minecraft:baked_potato`

---

## 3. Skills & Powers

### Passive: Hearty Meals
- **Trigger:** Finishing any food (`consume_item` with `#minecraft:food`-style check).
- **Mechanic:** **Saturation I for 2 seconds** (about +2 food points and saturation on top of the meal).

### Passive: Hearthside
- **Trigger:** Within 4 blocks of a **lit** campfire, soul campfire, furnace, blast furnace or smoker.
- **Mechanic:** **Regeneration I** while you stay there.

### Downside
- **Quick Hunger:** a small constant exhaustion drain (Hunger effect pulses) equal to about **20% faster** hunger loss while carried.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"Hearthstone"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Meals:** `consume_item` advancement (any item with the `food` component) → `effect give @s minecraft:saturation 2 0 true`.
- **Hearthside:** check a 9×9×9 area cheaply with `execute if block` on nearby positions every 20 ticks, or require the block within 2 blocks (smaller scan) for performance; `lit=true` block state.
- **Downside:** `effect give @s minecraft:hunger 1 1 true` once every 10 seconds.
