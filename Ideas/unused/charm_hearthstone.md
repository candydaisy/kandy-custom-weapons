# Hearthstone (Well-fed Warmth)

> *"A coal from a hearth that never went cold. Meals taste better next to it."*

**Status:** Implemented

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
- **Unlock Trigger:** Getting any **cooked food**
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
- **Trigger:** Finishing any food (checked against a tag of vanilla foods).
- **Mechanic:** **Saturation I for 2 seconds** (about +2 food points and saturation on top of the meal).

### Passive: Hearthside
- **Trigger:** Within 4 blocks of a **lit** campfire, soul campfire, furnace, blast furnace or smoker.
- **Mechanic:** **Regeneration I** while you stay there, topped up only once it runs out (about 1 HP every 3-4s).

### Downside
- **Quick Hunger:** a short **Hunger IV** pulse every 20 seconds, about **20% faster** hunger loss while carried.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"Hearthstone"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Meals:** `consume_item` advancement (any item with the `food` component) → `effect give @s minecraft:saturation 2 0 true`.
- **Hearthside:** once a second, `hearthstone/scan` checks nearby positions (within 4 blocks, 2 up or down, nearest first) for `#kandy:hearthstone_hearths[lit=true]` and tags the player `kandy.hth_warm`.
- **Downside:** `effect give @a[tag=kandy.charm.hearthstone] minecraft:hunger 1 3 true` once every 400 ticks.
