# Alchemist Catalyst (Status Purification & Potion Preset Charm)

> *"Distilled by ancient herbalists and apothecaries. It purifies vile toxins into rejuvenating elixirs and amplifies the soul's resilience."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Status Transmuter (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:amethyst_shard` (or `minecraft:glass_bottle`)
- **Rarity:** `rare`
- **Custom Data:** `{charm: "AlchemistCatalyst", type: "talisman"}`
- **Display Gradient:** Mystic Amethyst Purple to Emerald Green (`#9b59b6` → `#8e44ad` → `#2ecc71` → `#27ae60`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried in inventory: Transmutes harmful debuffs into healing elixirs.", "color": "gray", "italic": false},
    {"text": "Purification: Poison/Wither turns to Regeneration. Slowness turns to Speed.", "color": "gray", "italic": false},
    {"text": "Potion Potency: All positive potion effects you drink are extended by +50%.", "color": "gray", "italic": false},
    {"text": "Aura of Vitality: Nearby allies regenerate health 25% faster.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Apothecary Core** (`minecraft:brewing_stand[custom_data={core:"apothecary"}]`)
- **Unlock Trigger:** Brewing any potion or harvesting an **Amethyst Cluster**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:brewing_stand`
  - **Sides (N, S, E, W):** 4× `minecraft:golden_carrot`
  - **Corners:** 4× `minecraft:amethyst_cluster`

### Step 2: Forging at the Smithing Table
- **Template:** `Apothecary Core`
- **Base Item:** `minecraft:amethyst_shard`
- **Addition Catalyst:** `minecraft:honey_bottle`

---

## 3. Skills & Powers

### Passive: Toxin Transmutation (Debuff Inversion)
- **Description:** Hostile afflictions are instantly neutralized and re-routed as restorative vitality.
- **Transmutation Table:**
  | Incoming Affliction | Transmuted Outcome | Duration |
  | :--- | :--- | :--- |
  | **Poison** | **Regeneration II** | Equal to remaining poison duration |
  | **Wither** | **Absorption II + Regeneration I** | 8 seconds |
  | **Slowness** | **Speed II** | 6 seconds |
  | **Weakness** | **Strength I** | 8 seconds |
  | **Mining Fatigue** | **Haste II** | 10 seconds |
  | **Darkness / Blindness** | **Night Vision** | 15 seconds |
- **Audio / Visuals:**
  - Spawns shimmering `witch` and `happy_villager` emerald sparkle particles.
  - Chime sound `block.amethyst_block.chime` upon successful conversion.

### Passive: Elixir Infusion (Extended Brews)
- **Description:** Enhances the physiological absorption of consumed potions.
- **Mechanic:**
  - Whenever the carrier drinks a beneficial potion (e.g. Strength, Speed, Invisibility, Fire Resistance), its duration is extended by **+50%** automatically.
  - Grants a persistent +1 extra heart of permanent Absorption while carrying at least 3 brewed potions in inventory.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Tagging:**
  In `data/kandy/function/holders.mcfunction`:
  ```mcfunction
  tag @a remove kandy.charm.alchemist
  execute as @a if items entity @s container.* *[custom_data~{charm:"AlchemistCatalyst"}] run tag @s add kandy.charm.alchemist
  execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"AlchemistCatalyst"}] run tag @s add kandy.charm.alchemist
  ```
- **Debuff Detection & Inversion (`alchemist_tick.mcfunction`):**
  Using predicates checking active status effects on `@s`:
  ```mcfunction
  # Poison Inversion
  execute as @a[tag=kandy.charm.alchemist] if entity @s[predicate=kandy:has_poison] run function kandy:charms/transmute_poison

  # Wither Inversion
  execute as @a[tag=kandy.charm.alchemist] if entity @s[predicate=kandy:has_wither] run function kandy:charms/transmute_wither
  ```
- **Transmute Function (`transmute_poison.mcfunction`):**
  ```mcfunction
  effect clear @s minecraft:poison
  effect give @s minecraft:regeneration 8 1 true
  particle happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10
  playsound block.amethyst_block.chime player @s ~ ~ ~ 1.5 1.5
  ```
