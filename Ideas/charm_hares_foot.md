# Hare's Foot (Fleet-footed Agility)

> *"Lucky for some. Fast for everyone. Just don't get caught."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:rabbit_foot`
- **Rarity:** `uncommon`
- **Custom Data:** `{charm: "HaresFoot", type: "talisman"}`
- **Display Gradient:** Field Tan to Meadow Green (`#f6e7c1` → `#e0c097` → `#a7c957` → `#6a994e`)
- **Lore Text:**
  ```json
  [
    {"text": "Jump Boost I and +10% movement speed while carried.", "color": "gray", "italic": false},
    {"text": "Sprint-jumping kicks up a short burst of speed.", "color": "gray", "italic": false},
    {"text": "Light as a rabbit, frail as one too: -2 armor.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Warren Core** (shown as `minecraft:rabbit_hide` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Getting a **Rabbit's Foot**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:rabbit_hide`
  - **Sides (N, S, E, W):** 4× `minecraft:carrot`
  - **Corners:** 4× `minecraft:feather`

### Step 2: Forging at the Smithing Table
- **Template:** `Warren Core`
- **Base Item:** `minecraft:rabbit_foot`
- **Addition Catalyst:** `minecraft:sugar`

---

## 3. Skills & Powers

### Passive: Fleet Foot
- **Mechanic:** **Jump Boost I** and **+10% movement speed** (attribute `kandy:hare_speed`).

### Passive: Hop Burst
- **Trigger:** Jumping while sprinting.
- **Mechanic:** a **+40% speed** burst (like Speed II) for exactly **1.5s**. Cooldown **4 seconds**.

### Downside
- **Frail:** **-2 armor** (attribute `kandy:hare_frail`) while carried.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"HaresFoot"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Hop Burst:** detect the jump with the `type_specific/player` `input.jump` predicate (as Abyssal Pearl does) while the `is_sprinting` flag is set.
- **Hop Burst attribute:** `movement_speed` modifier `kandy:hare_burst` (+40%) for 30 ticks (`hare_bt`); cooldown `hare_cd` = 80 ticks.
- **Attributes:** added when the charm tag appears, removed when it goes away (like Abyssal Pearl's mining modifier).
