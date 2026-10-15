# Abyssal Pearl (Aquatic Exploration & Depth Immunity Charm)

> *"Pulled from the mantle of a submerged oceanic trench. Carries the blessing of the deepest abyssal waters."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:heart_of_the_sea` (or `minecraft:nautilus_shell`)
- **Rarity:** `rare`
- **Custom Data:** `{charm: "AbyssalPearl", type: "talisman"}`
- **Display Gradient:** Deep Oceanic Teal to Aqua Glow (`#005c97` → `#363795` → `#00b4db` → `#0083b0`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried in inventory: Endless breath and aquatic mastery.", "color": "gray", "italic": false},
    {"text": "Aquatic Preset: Permanent Water Breathing, Night Vision, & Dolphin's Grace in water.", "color": "gray", "italic": false},
    {"text": "Aqua Haste: Break blocks underwater as fast as on dry land.", "color": "gray", "italic": false},
    {"text": "Depths Ward: Completely prevents drowning and kinetic water damage.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Trench Core** (`minecraft:conduit[custom_data={core:"trench"}]`)
- **Unlock Trigger:** Finding a **Shipwreck Treasure** or harvesting **Prismarine**
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
- **Description:** Submerging in water immediately activates a suite of aquatic buffs.
- **Preset Effects Granted:**
  - **Water Breathing:** Infinite air supply (oxygen bubbles never deplete).
  - **Night Vision (Submerged only):** Crystal-clear visibility in the murkiest oceans or deep trenches.
  - **Dolphin's Grace:** High-speed swimming propulsion.
  - **Conduit Power:** Grants increased attack speed and ambient underwater brightness.

### Passive: Ocean Miner (Aqua Haste)
- **Description:** Water friction on tools is completely canceled.
- **Mechanic:**
  - While submerged, the player receives permanent **Haste II**, allowing mining underwater at identical speeds to mining on dry land even without Aqua Affinity or Depth Strider boots.

### Active / Utility: Abyssal Bubble Burst
- **Trigger:** Double-tap Jump while swimming underwater.
- **Cooldown:** 3.0 seconds.
- **Mechanic:**
  - Emits a sonic jet of pressurized bubbles (`bubble_pop`, `current_down`) launching the player 12 blocks forward.
  - If bursting out of water into air, launches the player up to 8 blocks skyward (ideal for launching into elytra flight straight out of the ocean).

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Tagging:**
  In `data/kandy/function/holders.mcfunction`:
  ```mcfunction
  tag @a remove kandy.charm.abyssal_pearl
  execute as @a if items entity @s container.* *[custom_data~{charm:"AbyssalPearl"}] run tag @s add kandy.charm.abyssal_pearl
  execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"AbyssalPearl"}] run tag @s add kandy.charm.abyssal_pearl
  ```
- **Water Check & Potion Application:**
  In `data/kandy/function/charms/abyssal_pearl_tick.mcfunction`:
  ```mcfunction
  # Check if player is submerged or in water block
  execute as @a[tag=kandy.charm.abyssal_pearl] at @s if block ~ ~ ~ minecraft:water run function kandy:charms/abyssal_pearl_apply
  execute as @a[tag=kandy.charm.abyssal_pearl] at @s if block ~ ~1 ~ minecraft:water run function kandy:charms/abyssal_pearl_apply
  ```
- **Apply Function:**
  ```mcfunction
  effect give @s minecraft:water_breathing 3 0 true
  effect give @s minecraft:night_vision 12 0 true
  effect give @s minecraft:dolphins_grace 3 0 true
  effect give @s minecraft:haste 3 1 true
  ```
