# Watcher's Lens (Awareness & Target Marking)

> *"Ground from the eye of something that never slept. Through it, nothing that hunts you stays hidden."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:spyglass`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "WatchersLens", type: "talisman"}`
- **Display Gradient:** Pale Lilac to Deep Violet (`#e0c3fc` → `#b388eb` → `#8e44ad` → `#5b2c6f`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried: monsters hunting you within 16 blocks briefly glow.", "color": "gray", "italic": false},
    {"text": "Look through it at a creature for 1s to Mark it: Glowing for 10s (20s cooldown).", "color": "gray", "italic": false},
    {"text": "Marking reveals you too: you glow for 3s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Watcher Core** (shown as `minecraft:ender_eye` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Getting a **Spyglass** or killing an **Enderman**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:ender_eye`
  - **Sides (N, S, E, W):** 4× `minecraft:amethyst_shard`
  - **Corners:** 4× `minecraft:glass_pane`

### Step 2: Forging at the Smithing Table
- **Template:** `Watcher Core`
- **Base Item:** `minecraft:spyglass`
- **Addition Catalyst:** `minecraft:phantom_membrane`

---

## 3. Skills & Powers

### Passive: Hunter's Sense
- **Mechanic:** Any mob within **16 blocks** whose current attack target is **you** (angry wolves and golems too) gets **Glowing for 1s**, checked twice a second. A creeper targeting you within **5 blocks** also plays a warning click only you hear (a creeper's fuse state can't be read).
- Only mobs, never players, so it doesn't work as a free wallhack in PvP.

### Active: Mark
- **Trigger:** Look through the Watcher's Lens (use it like a normal spyglass) at a creature within **48 blocks** for **1 second**.
- **Mechanic:** The creature gets **Glowing for 10 seconds**. Works on players. **Cooldown: 20 seconds**.

### Downside
- **Two-way Glass:** each Mark also gives **you Glowing for 3 seconds**, so marking an enemy player reveals your position to everyone too.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"WatchersLens"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD (`kandy:hud/b/...`) while recharging, like the other charms.
- **Hunter's Sense:** mobs within 16 blocks run `execute on target` and check for the carrier tagged `kandy.wat_self`.
- **Mark:** a `using_item` advancement sets `wat_use` every tick the lens is scoped; after 1s, a raycast from the eyes in 0.5-block steps (up to 48 blocks, stopping at solid blocks) gives the first creature Glowing. Cooldown `wat_cd` = 400 ticks.
