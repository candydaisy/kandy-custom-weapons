# Phoenix Plume (Last Stand & Rebirth)

> *"A single ember-feather that refuses to go out. When your flame gutters, it burns brighter in your place."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:blaze_powder`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "PhoenixPlume", type: "talisman"}`
- **Display Gradient:** Ember Gold to Phoenix Crimson (`#ffd166` → `#ff9f1c` → `#f3722c` → `#c1121f`)
- **Lore Text:**
  ```json
  [
    {"text": "Falling to 2 hearts or less triggers Rebirth (5 min cooldown):", "color": "gray", "italic": false},
    {"text": "a healing surge and a ring of fire that scorches nearby foes.", "color": "gray", "italic": false},
    {"text": "Afterwards your body is ash: -2 max hearts for 60s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Phoenix Core** (shown as `minecraft:fire_charge` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Using a **Totem of Undying** (`minecraft:used_totem`)
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:totem_of_undying`
  - **Sides (N, S, E, W):** 4× `minecraft:blaze_rod`
  - **Corners:** 4× `minecraft:gold_block`

### Step 2: Forging at the Smithing Table
- **Template:** `Phoenix Core`
- **Base Item:** `minecraft:blaze_powder`
- **Addition Catalyst:** `minecraft:golden_apple`

---

## 3. Skills & Powers

### Passive: Rebirth (Last Stand)
- **Trigger:** Your health drops to **4 HP (2 hearts) or less** while the charm is carried and Rebirth is ready.
- **Mechanic:**
  - Instantly grants **Regeneration III for 4s**, **Absorption II for 8s** and **Fire Resistance for 8s**.
  - A ring of fire bursts out: everything within **4 blocks** (except you) takes **4 fire damage** and mobs are set on fire for 4s. It uses vanilla `in_fire` damage, so fire-immune mobs ignore it.
  - Plays `item.totem.use` (pitch 1.4) with `flame`, `lava` and `totem_of_undying` particles.
  - **Cooldown: 5 minutes.** It does not stop a single hit that kills you outright from above 4 HP; it's a comeback tool, not a totem.

### Downside
- **Ash Body:** after Rebirth fires, your **max health is reduced by 4 (2 hearts) for 60 seconds** via an attribute modifier (`kandy:phoenix_ash`).
- Rebirth can't trigger again until the 5-minute cooldown ends, so a second low-health moment in the same fight is on you.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"PhoenixPlume"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD (`kandy:hud/b/...`) while recharging, like the other charms.
- **Trigger:** a `health` scoreboard objective; when it reads `..4` and the cooldown score is 0, run `phoenix/rebirth`.
- **Ring of fire:** `damage @e[distance=..4,...] 4 minecraft:in_fire by <carrier>` plus `data merge entity @s {Fire:80s}` for non-players (players can't be set on fire by command).
- **Ash Body:** `attribute @s minecraft:max_health modifier add kandy:phoenix_ash -4 add_value`, removed by a 1200-tick timer and in uninstall.
