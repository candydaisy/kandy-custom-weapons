# Tinker's Whetstone (Field Repairs)

> *"A worn stone with a hundred smiths' fingerprints on it. Every blade it touches comes back a little better."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:brick`
- **Rarity:** `uncommon`
- **Custom Data:** `{charm: "TinkersWhetstone", type: "talisman"}`
- **Display Gradient:** Stone Grey to Forge Orange (`#e9ecef` → `#adb5bd` → `#e76f51` → `#9d0208`)
- **Lore Text:**
  ```json
  [
    {"text": "Every 5s, mends 1 durability on the item in your main hand.", "color": "gray", "italic": false},
    {"text": "Sneak still for 2s to sharpen: +1 attack damage for 20s (60s cooldown).", "color": "gray", "italic": false},
    {"text": "Constant tinkering: -10% attack speed.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Tinker Core** (shown as `minecraft:anvil` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Using an **Anvil** or **Grindstone**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:anvil`
  - **Sides (N, S, E, W):** 4× `minecraft:iron_ingot`
  - **Corners:** 4× `minecraft:flint`

### Step 2: Forging at the Smithing Table
- **Template:** `Tinker Core`
- **Base Item:** `minecraft:brick`
- **Addition Catalyst:** `minecraft:grindstone`

---

## 3. Skills & Powers

### Passive: Field Mending
- **Mechanic:** Every **5 seconds**, the damageable item in your **main hand** recovers **1 durability**. Doesn't work on items that are already full or unbreakable.

### Active: Sharpen
- **Trigger:** Sneak without moving for **2 seconds** holding a weapon.
- **Mechanic:** **+1 attack damage for 20 seconds** (attribute `kandy:tinker_edge`). **Cooldown: 60 seconds.**

### Downside
- **Fidgeting:** **-10% attack speed** while carried.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"TinkersWhetstone"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Mending:** `item modify entity @s weapon.mainhand {function:"minecraft:set_damage",damage:<+fraction>,add:true}`; `set_damage` works in fractions of max durability, so compute the fraction for 1 point or accept a small fixed fraction (e.g. 0.5%).
- **Sharpen:** stillness check like Wayfarer's Compass; attribute modifier with a 400-tick timer.
