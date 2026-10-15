# Molten Core (Fire Immunity & Nether Survival Charm)

> *"A pulsating seed of living magma. It consumes external flames, converting deadly heat into surging stamina."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:magma_cream` (or `minecraft:fire_charge`)
- **Rarity:** `rare`
- **Custom Data:** `{charm: "MoltenCore", type: "talisman"}`
- **Display Gradient:** Solar Flame Yellow to Magma Red (`#ffe259` → `#ffa751` → `#ff416c` → `#8a0000`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried in inventory: Complete immunity to Fire, Magma, and Lava.", "color": "gray", "italic": false},
    {"text": "Thermal Surge: Swimming in lava grants Speed II & Regeneration I.", "color": "gray", "italic": false},
    {"text": "Flame Retaliation: Melee attackers are set ablaze for 6 seconds.", "color": "gray", "italic": false},
    {"text": "Blaze Ward: Burning projectiles disintegrate before hitting you.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Ignis Core** (`minecraft:blaze_powder[custom_data={core:"ignis"}]`)
- **Unlock Trigger:** Entering the **Nether** or collecting **Blaze Rods**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:blaze_rod`
  - **Sides (N, S, E, W):** 4× `minecraft:magma_block`
  - **Corners:** 4× `minecraft:nether_brick`

### Step 2: Forging at the Smithing Table
- **Template:** `Ignis Core`
- **Base Item:** `minecraft:magma_cream`
- **Addition Catalyst:** `minecraft:lava_bucket`

---

## 3. Skills & Powers

### Passive: Thermal Immunity & Lava Absorption
- **Description:** Complete immunity to environmental extreme heat.
- **Mechanic:**
  - Grants permanent **Fire Resistance** while held or stored in the inventory.
  - Stepping on `magma_block` deals 0 damage and does not slow down movement.
  - Submerging into **Lava** converts danger into power:
    - Grants **Speed II** and **Regeneration I** for the duration of lava submersion.
    - Swimming in lava is smooth and buoyant without heavy liquid dragging.

### Passive: Molten Retaliation (Fire Thorns)
- **Description:** Stored thermal pressure lashes out when attacked.
- **Mechanic:**
  - Any mob or player hitting you with a direct melee strike is set ablaze for **6.0 seconds** and takes **4.0 fire retaliation damage**.
  - Plays the sizzling audio `block.fire.extinguish` with smoke particles.

### Passive: Cinder Ward (Arrow Incinerator)
- **Description:** Incinerates incoming fireballs and flaming arrows.
- **Mechanic:**
  - Flaming arrows or Ghast fireballs entering within a 3-block radius of the carrier lose momentum, evaporate into smoke particles, and drop harmlessly or disintegrate.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Tagging:**
  In `data/kandy/function/holders.mcfunction`:
  ```mcfunction
  tag @a remove kandy.charm.molten_core
  execute as @a if items entity @s container.* *[custom_data~{charm:"MoltenCore"}] run tag @s add kandy.charm.molten_core
  execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"MoltenCore"}] run tag @s add kandy.charm.molten_core
  ```
- **Passive Ticking (`molten_core_tick.mcfunction`):**
  ```mcfunction
  # Permanent Fire Resistance
  effect give @a[tag=kandy.charm.molten_core] minecraft:fire_resistance 3 0 true

  # Lava Submersion bonus
  execute as @a[tag=kandy.charm.molten_core] at @s if block ~ ~ ~ minecraft:lava run effect give @s minecraft:speed 3 1 true
  execute as @a[tag=kandy.charm.molten_core] at @s if block ~ ~ ~ minecraft:lava run effect give @s minecraft:regeneration 3 0 true
  ```
- **Retaliation Advancements:**
  - Trigger `minecraft:entity_hurt_player` with condition that player carries the Molten Core.
  - Rewards function `kandy:charms/molten_retaliate` that ignites the attacker entity.
