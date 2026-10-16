# Wayfarer's Compass (Homeward Recall)

> *"Its needle doesn't point north. It points home, and it can take you there, for a price."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:compass`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "WayfarersCompass", type: "talisman"}`
- **Display Gradient:** Parchment to Sea Blue (`#fdf0d5` → `#e9c46a` → `#2a9d8f` → `#264653`)
- **Lore Text:**
  ```json
  [
    {"text": "Sneak still for 3s: recall to your respawn point (bed or anchor).", "color": "gray", "italic": false},
    {"text": "Recall only works in the same dimension. 10 minute cooldown.", "color": "gray", "italic": false},
    {"text": "Every recall costs 5 experience levels.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Wayfarer Core** (shown as `minecraft:recovery_compass` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Sleeping in a **bed** or setting a **respawn anchor**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:recovery_compass`
  - **Sides (N, S, E, W):** 4× `minecraft:map`
  - **Corners:** 4× `minecraft:gold_ingot`

### Step 2: Forging at the Smithing Table
- **Template:** `Wayfarer Core`
- **Base Item:** `minecraft:compass`
- **Addition Catalyst:** `minecraft:ender_pearl`

---

## 3. Skills & Powers

### Active: Homeward Recall
- **Trigger:** Sneak without moving for **3 seconds** (a rising chime and portal particles while it charges; moving cancels it).
- **Mechanic:** Teleports you to your **respawn point** (bed or respawn anchor) if it's in your current dimension and still valid; otherwise it fizzles with no cost. **Cooldown: 10 minutes.**

### Downside
- **Toll:** each successful recall costs **5 experience levels**. With fewer than 5 levels, it fizzles.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"WayfarersCompass"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Respawn data:** read the player's respawn compound from player NBT (check the exact 26.3 field, e.g. `respawn.pos` / `respawn.dimension`), copy it into storage and teleport with a macro (`$tp @s $(x) $(y) $(z)`), checking the destination is clear like Void Talisman's rescue.
- **Toll:** `experience query @s levels` stored into a score; `experience add @s -5 levels`.
