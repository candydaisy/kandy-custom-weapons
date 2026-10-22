# Moonlit Pendant (Night Hunter)

> *"Silver that only shines after dusk. By day it's just a cold weight around your neck."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:firework_star`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "MoonlitPendant", type: "talisman"}`
- **Display Gradient:** Moon Silver to Midnight Blue (`#f0f0ff` → `#c0c6e8` → `#5e60ce` → `#240046`)
- **Lore Text:**
  ```json
  [
    {"text": "At night under open sky: Strength I and Night Vision.", "color": "gray", "italic": false},
    {"text": "During a full moon: also Speed I.", "color": "gray", "italic": false},
    {"text": "Overworld nights: +2 max hearts, even under a roof.", "color": "gray", "italic": false},
    {"text": "By day it weighs on you: Slowness I and -10% attack speed.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Moon Core** (shown as `minecraft:end_crystal` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Being outside at **midnight** or killing a **Phantom**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:phantom_membrane`
  - **Sides (N, S, E, W):** 4× `minecraft:iron_ingot`
  - **Corners:** 4× `minecraft:glowstone_dust`

### Step 2: Forging at the Smithing Table
- **Template:** `Moon Core`
- **Base Item:** `minecraft:firework_star`
- **Addition Catalyst:** `minecraft:nether_star`

---

## 3. Skills & Powers

### Passive: Moonlight
- **Trigger:** Night time (13000-23000) with open sky above you.
- **Mechanic:** **Strength I** and **Night Vision**. During a **full moon** (moon phase 0), also **Speed I**.

### Passive: Night Vigor
- **Trigger:** Night time (13000-23000) in the **Overworld**, open sky or not.
- **Mechanic:** **+4 max health (2 hearts)**. The new hearts start empty, and they vanish at dawn (or when you leave the Overworld), taking any health in them with them.

### Downside
- **Daylight Burden:** during the day with open sky above you, **Slowness I** and **-10% attack speed** (attribute `kandy:moon_burden`). Underground or indoors you're unaffected either way.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"MoonlitPendant"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Time:** `minecraft:time_check` predicate with `value:{min:13000,max:23000}` and `period:24000`.
- **Moon phase:** `(day count) % 8 == 0`; day count from `time query day`.
- **Sky:** `minecraft:location {can_see_sky:true}`.
- **Night Vigor:** `max_health` modifier `kandy:moon_vigor` (+4) while the night predicate passes in the Overworld, removed otherwise and in uninstall.
