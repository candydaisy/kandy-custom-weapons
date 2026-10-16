# Alchemist Catalyst (Debuff Cleansing & Potion Charm)

> *"Distilled by ancient herbalists and apothecaries. It purifies vile toxins into rejuvenating elixirs and amplifies the soul's resilience."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Status Transmuter (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:amethyst_shard`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "AlchemistCatalyst", type: "talisman"}`
- **Display Gradient:** Mystic Amethyst Purple to Emerald Green (`#9b59b6` → `#8e44ad` → `#2ecc71` → `#27ae60`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried anywhere: cleanses Poison, Wither, Slowness, Weakness,", "color": "gray", "italic": false},
    {"text": "Mining Fatigue, Darkness and Blindness into brief buffs (15s cooldown).", "color": "gray", "italic": false},
    {"text": "Beneficial potions (drunk, splash or lingering) last 50% longer, up to 8 min.", "color": "gray", "italic": false},
    {"text": "Carrying 3+ brewed potions: +1 max heart.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Apothecary Core** (shown as `minecraft:brewing_stand` via `item_model`; the real item is a `minecraft:trial_spawner` template, which can be placed in survival but never drops a usable template)
- **Unlock Trigger:** Brewing any potion or getting an **Amethyst Cluster**
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

### Passive: Toxin Transmutation
- **Cooldown:** 15 seconds (only spent when something was cleansed).
- **Transmutation Table:**
  | Affliction | Becomes |
  | :--- | :--- |
  | **Poison** | Regeneration I, 4s |
  | **Wither** | Regeneration I, 4s |
  | **Slowness** | Speed I, 4s |
  | **Weakness** | cleansed only (never becomes Strength) |
  | **Mining Fatigue** | Haste I, 8s |
  | **Darkness / Blindness** | Night Vision, 10s |
- Drawbacks from the pack's own weapons are left alone: Blood Pact's Slowness and Darkness, and World Breaker's Slowness while you hold it.
- Plays `block.amethyst_block.chime` with sparkle particles.

### Passive: Elixir Infusion
- Beneficial potions you **drink**, or **splash / lingering** potions that land on you, last **50% longer**, capped at **8 minutes**. Only effects between 20s and 8 min are extended, so beacons and the pack's short effects are skipped, and the same potion is never extended twice.

### Passive: Reserve
- Carrying **3+ brewed potions** (water bottles don't count) gives **+1 max heart**.

### Left out
- **Aura of Vitality** (faster ally regeneration) was dropped.

---

## 4. Technical Implementation (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.alchemist` from `container.*` and `weapon.offhand`.
- **Transmutation:** `alchemist/transmute` uses `execute store success ... run effect clear` per debuff; cooldown `alch_cd` (300 ticks).
- **Elixir Infusion:** a snapshot of beneficial effect durations each tick; a jump in duration after drinking (or an `effects_changed` advancement for splash/lingering) marks a fresh potion, and a macro re-applies it with 50% more time at the same level.
- **Reserve:** `max_health` modifier `kandy:alchemist` (+2).
