# Deepdelver Lamp (Underground Sight & Ore Pinging)

> *"A miner's lamp that burns on cave air. It never runs out, and it never stops listening to the stone."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:glowstone_dust`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "DeepdelverLamp", type: "talisman"}`
- **Display Gradient:** Lantern Amber to Cave Teal (`#ffe8a3` → `#ffc857` → `#3fa7a3` → `#1d5c63`)
- **Lore Text:**
  ```json
  [
    {"text": "Below Y 40 in the dark: Night Vision.", "color": "gray", "italic": false},
    {"text": "Sneak still for 2s to Ping: ores within 6 blocks glow for 5s (30s cooldown).", "color": "gray", "italic": false},
    {"text": "The lamp gives you away: you glow to other players underground.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Delver Core** (shown as `minecraft:lantern` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Mining **Deepslate** or finding a **Mineshaft** chest
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:lantern`
  - **Sides (N, S, E, W):** 4× `minecraft:glow_ink_sac`
  - **Corners:** 4× `minecraft:raw_iron`

### Step 2: Forging at the Smithing Table
- **Template:** `Delver Core`
- **Base Item:** `minecraft:glowstone_dust`
- **Addition Catalyst:** `minecraft:amethyst_shard`

---

## 3. Skills & Powers

### Passive: Cave Eyes
- **Trigger:** Below **Y 40** with block light 7 or lower at your position.
- **Mechanic:** **Night Vision** (refreshed for 12s, so it doesn't flicker when you pass a torch).

### Active: Ore Ping
- **Trigger:** Sneak without moving for **2 seconds**.
- **Mechanic:** Every ore block within **6 blocks** (`#minecraft:*_ores`, ancient debris) gets a glowing outline for **5 seconds**, color-coded by ore type (diamond aqua, gold yellow, iron white, redstone red, etc.). Plays a low `block.amethyst_block.resonate` ping. The outlines are visible to nearby players too. **Cooldown: 30 seconds.**

### Downside
- **Lamplight:** while you're below Y 40 and the lamp is lit (Cave Eyes active), you have **Glowing** visible to other players within 32 blocks. Great for mining with friends, bad for hiding from enemies.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"DeepdelverLamp"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD (`kandy:hud/b/...`) while recharging, like the other charms.
- **Ping scan:** a recursive function over a 13×13×13 cube (2,197 checks) run once per ping, summoning a `block_display` with `Glowing:1b` and a `glow_color_override` on each ore; displays removed after 100 ticks (`dlv_life`). Nearby players see the outlines too. Ores come from the block tag `kandy:deepdelver_lamp_ores`; cooldown `dlv_cd` = 600 ticks.
- **Downside:** `effect give @s minecraft:glowing 2 0 true` while Cave Eyes is active.
