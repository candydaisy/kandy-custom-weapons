# Predator's Fang (Execute the Wounded)

> *"Torn from something that only ever hunted the weak. It still knows the smell of blood."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:flint`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "PredatorsFang", type: "talisman"}`
- **Display Gradient:** Bone Ivory to Blood Red (`#f8edeb` → `#e5989b` → `#b5179e` → `#7209b7`)
- **Lore Text:**
  ```json
  [
    {"text": "Charged hits on targets below 30% health deal +3 damage.", "color": "gray", "italic": false},
    {"text": "Killing a target this way grants Speed I for 3s.", "color": "gray", "italic": false},
    {"text": "Always hungry for more: -2 max health.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Fang Core** (shown as `minecraft:goat_horn` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Killing a **Wolf**, **Fox** or **Ocelot**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:goat_horn`
  - **Sides (N, S, E, W):** 4× `minecraft:bone`
  - **Corners:** 4× `minecraft:flint`

### Step 2: Forging at the Smithing Table
- **Template:** `Fang Core`
- **Base Item:** `minecraft:flint`
- **Addition Catalyst:** `minecraft:rotten_flesh`

---

## 3. Skills & Powers

### Passive: Execution
- **Trigger:** A fully charged melee hit on a creature that is **below 30% of its max health** after the hit.
- **Mechanic:** Deals **+3 bonus damage** (credited to you). Red crit particles mark the execute.

### Passive: Bloodscent
- **Trigger:** Killing a creature with an Execution hit.
- **Mechanic:** **Speed I for 3 seconds**.

### Downside
- **Gaunt:** **-2 max health** (1 heart) while carried.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"PredatorsFang"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Health ratio:** read `Health` and the `max_health` attribute (`attribute @s minecraft:max_health get`) into scores, compare `Health*10 <= max*3`.
- **Bonus damage:** custom damage type in `#minecraft:bypasses_cooldown` so it lands in the same tick as the hit, with the busy-tag guard like Pyroclast.
