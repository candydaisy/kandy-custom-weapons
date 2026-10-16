# Enderbrace (Short-range Blink)

> *"Woven from chorus that never stopped teleporting. It drags you along whenever it twitches."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:popped_chorus_fruit`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "Enderbrace", type: "talisman"}`
- **Display Gradient:** Chorus Pink to Ender Purple (`#ffd6ff` → `#e7c6ff` → `#c77dff` → `#7b2cbf`)
- **Lore Text:**
  ```json
  [
    {"text": "Double-tap Sneak: blink up to 10 blocks where you look (12s cooldown).", "color": "gray", "italic": false},
    {"text": "You never land inside blocks; blinks that can't land fizzle for free.", "color": "gray", "italic": false},
    {"text": "Water burns like it does for endermen: 2 damage every 2s in rain or water.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Chorus Core** (shown as `minecraft:chorus_flower` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Eating **Chorus Fruit** or entering **the End**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:chorus_flower`
  - **Sides (N, S, E, W):** 4× `minecraft:ender_pearl`
  - **Corners:** 4× `minecraft:popped_chorus_fruit`

### Step 2: Forging at the Smithing Table
- **Template:** `Chorus Core`
- **Base Item:** `minecraft:popped_chorus_fruit`
- **Addition Catalyst:** `minecraft:shulker_shell`

---

## 3. Skills & Powers

### Active: Blink
- **Trigger:** Double-tap Sneak (two presses within 7 ticks).
- **Mechanic:** Teleports you up to **10 blocks** along your view, stopping before walls, onto the last spot with clear feet and head room. Portal particles at both ends. **Cooldown: 12 seconds.**

### Downside
- **Water-shy:** while you're in **water or rain**, you take **2 damage every 2 seconds**, like an enderman. Rain is checked with `can_see_sky`, and weather is global, so rain also counts in deserts while it rains elsewhere.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"Enderbrace"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Blink:** double-tap detection on the rising edge of Sneak (`ebr_snk`/`ebr_prev`, a 7-tick `ebr_tap` window), then up to 20 half-block steps along your view with the same passable checks as Tempest's Gale Surge; `ebr_cd` = 240 ticks.
- **Downside:** `is_in_water` flag, or `minecraft:weather_check {raining:true}` + `can_see_sky`, on a 40-tick timer (`ebr_wet`) → `damage @s 2 minecraft:drown`.
