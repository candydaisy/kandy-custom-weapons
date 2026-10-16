# Abyssal Pearl (Aquatic Exploration Charm)

> *"Pulled from the mantle of a submerged oceanic trench. Carries the blessing of the deepest abyssal waters."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:heart_of_the_sea`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "AbyssalPearl", type: "talisman"}`
- **Display Gradient:** Deep Oceanic Teal to Abyssal Dark (`#005c97` → `#363795` → `#00b4db` → dark gray)
- **Lore Text:**
  ```json
  [
    {"text": "Charm: works anywhere in your inventory.", "color": "gray", "italic": false},
    {"text": "In water: Water Breathing and Dolphin's Grace; Night Vision while submerged.", "color": "gray", "italic": false},
    {"text": "Aqua Haste: mine underwater as fast as on land.", "color": "gray", "italic": false},
    {"text": "Double-tap Jump in water: Bubble Burst dash (5s cooldown).", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Trench Core** (shown as `minecraft:conduit` via `item_model`; the real item is an unobtainable `minecraft:debug_stick` template)
- **Unlock Trigger:** Looting **Shipwreck treasure** or getting **Prismarine Shards / Crystals**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:conduit`
  - **Sides (N, S, E, W):** 4× `minecraft:nautilus_shell`
  - **Corners:** 4× `minecraft:sea_lantern`

### Step 2: Forging at the Smithing Table
- **Template:** `Trench Core`
- **Base Item:** `minecraft:heart_of_the_sea`
- **Addition Catalyst:** `minecraft:pufferfish_bucket`

---

## 3. Skills & Powers

### Passive: Deep Sea Preset
- **In water:** **Water Breathing** and **Dolphin's Grace**.
- **With your head underwater:** also **Night Vision**.
- No Conduit Power (left out of the original idea).

### Passive: Aqua Haste
- While carried, underwater mining runs at land speed, without needing Aqua Affinity.

### Active / Utility: Bubble Burst
- **Trigger:** Double-tap **Jump** (two presses within 7 ticks) while in water.
- **Cooldown:** 5 seconds.
- **Mechanic:** Dashes up to **8 blocks** where you look, stopping at solid blocks. Bursting out of the water launches you skyward instead (good for opening an elytra), with Slow Falling so you land softly.

---

## 4. Technical Implementation (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.abyssal_pearl` from `container.*` and `weapon.offhand`.
- **Water check:** predicate `kandy:abyssal_pearl_in_water`.
- **Aqua Haste:** `submerged_mining_speed` modifier `kandy:pearl_haste` (+0.8, from 0.2 to land speed 1.0).
- **Bubble Burst:** jump input via predicate `kandy:abyssal_pearl_jump`; cooldown `pearl_cd` (100 ticks).
