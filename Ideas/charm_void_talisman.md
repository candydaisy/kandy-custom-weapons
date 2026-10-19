# Void Talisman (Void Fall Rescue & Shadow Charm)

> *"Resonating with the dark frequencies of the End. The abyss recognizes you as its own and refuses to swallow you."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Emergency Lifesaver (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:echo_shard`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "VoidTalisman", type: "talisman"}`
- **Display Gradient:** Void Purple to Sculk Cyan (`#8a4fe0` → `#00d8a8`)
- **Lore Text:**
  ```json
  [
    {"text": "Charm: works from anywhere in your inventory.", "color": "gray", "italic": false},
    {"text": "Void Rescue: falling into the void returns you to safe ground (120s cooldown).", "color": "gray", "italic": false},
    {"text": "Shadow Cloak: sneak in low light for 2s to turn Invisible.", "color": "gray", "italic": false},
    {"text": "Standing up, attacking or taking damage breaks the cloak.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Abyssal Echo Core** (shown as `minecraft:sculk_catalyst` via `item_model`; the real item is an unobtainable `minecraft:command_block_minecart` template)
- **Unlock Trigger:** Entering **the End** or looting an **Ancient City** chest
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:sculk_catalyst`
  - **Sides (N, S, E, W):** 4× `minecraft:echo_shard`
  - **Corners:** 4× `minecraft:crying_obsidian`

### Step 2: Forging at the Smithing Table
- **Template:** `Abyssal Echo Core`
- **Base Item:** `minecraft:echo_shard`
- **Addition Catalyst:** `minecraft:chorus_fruit`

---

## 3. Skills & Powers

### Passive: Void Rescue
- **Trigger:** Falling below **Y -70 in the Overworld**, **Y -6 in the Nether** or **Y -10 in the End**.
- **Cooldown:** 120 seconds (keeps ticking even if the talisman is put away).
- **Mechanic:**
  - Returns you to the **last safe spot you stood on** in this dimension, if it's still clear. Otherwise it finds the nearest surface around you (the End falls back to the main island).
  - Grants **Slow Falling (5s)** and **Regeneration I (5s)**, with a sculk/portal helix and `entity.warden.sonic_charge`.
  - If nothing safe is found, you float up with Levitation and Slow Falling and it tries again in 5s.

### Passive: Shadow Cloak
- **Trigger:** Hold **Sneak** in low light (light level 5 or lower) for **2 seconds**.
- **Mechanic:** **Invisibility** for as long as you keep sneaking in the dark. Standing up ends it; attacking or getting hurt breaks it and blocks re-cloaking for 5s. Only the cloak's own Invisibility is cleared, never a potion's.

### Left out
- **End Ward** (enderman pacification) couldn't be done reliably in a datapack.

---

## 4. Technical Implementation (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.void_talisman` from `container.*` and `weapon.offhand`.
- **Predicates:** `kandy:void_talisman_in_void` (per-dimension thresholds), `kandy:void_talisman_dark` (light ≤ 5), `kandy:void_talisman_on_ground`.
- **Safe footing:** `void_talisman/save_ground` remembers the last clear spot each tick you're on the ground.
- **Surface search:** `spreadplayers` lands on the highest safe block (no lava or fire); the Nether needs a ceiling under the bedrock roof.
- **Scoreboards:** `void_cd` (2400 ticks), `void_cloak` (sneak-in-dark timer, 40 ticks), `void_cloak_cd` (100 ticks after a break).
