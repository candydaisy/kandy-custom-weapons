# Zephyr Charm (Fall Damage Immunity & Wind Cushion)

> *"Infused with the hollow bones of phantom wings and breeze gale-force winds. Gravity loses its grip on whoever carries it."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:feather`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "Zephyr", type: "talisman"}`
- **Display Gradient:** Crisp Sky Blue to Pale Breeze White (`#e0f7fa` → `#80deea` → `#26c6da` → `#00acc1`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried anywhere: no fall damage.", "color": "gray", "italic": false},
    {"text": "Landing from 12+ blocks releases a wind burst (4 damage, knockback).", "color": "gray", "italic": false},
    {"text": "Sneak while falling to glide down gently.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Zephyr Core** (shown as `minecraft:phantom_membrane` via `item_model`; the real item is an unobtainable `minecraft:test_block` template)
- **Unlock Trigger:** Getting a **Phantom Membrane** or a **Breeze Rod**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:breeze_rod`
  - **Sides (N, S, E, W):** 4× `minecraft:phantom_membrane`
  - **Corners:** 4× `minecraft:feather`

### Step 2: Forging at the Smithing Table
- **Template:** `Zephyr Core`
- **Base Item:** `minecraft:feather`
- **Addition Catalyst:** `minecraft:wind_charge`

---

## 3. Skills & Powers

### Passive: Featherweight (Zero Fall Damage)
- While the charm is anywhere in your inventory or offhand, you take **no fall damage**.

### Passive: Kinetic Shockwave
- **Trigger:** Landing after a real fall of **12+ blocks** (gliding down doesn't count).
- **Mechanic:** A wind burst hits everything within **5 blocks** (players included) for **4 damage** with vanilla wind-charge knockback, with `gust` / `cloud` particles and `entity.breeze.wind_burst`.
- **Cooldown:** 3 seconds.

### Active / Utility: Aerial Glide
- **Trigger:** Hold **Sneak** while falling.
- **Mechanic:** Your gravity drops to slow-falling levels. It only works on the way down, so it can't boost jumps.

---

## 4. Technical Implementation (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.zephyr` from `container.*` and `weapon.offhand`.
- **No fall damage:** `fall_damage_multiplier` modifier `kandy:zephyr` (-100%), dropped as soon as the charm leaves the inventory.
- **Glide:** `gravity` modifier `kandy:zephyr_glide` (-87.5%) while sneaking and falling.
- **Shockwave:** fall height is tracked while airborne; on landing from 12+ blocks, `zephyr/shockwave` runs and sets `zeph_cd` (60 ticks).
