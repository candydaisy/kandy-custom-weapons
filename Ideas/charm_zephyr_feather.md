# Zephyr Charm (Fall Damage Immunity & Wind Cushion)

> *"Infused with the hollow bones of phantom wings and breeze gale-force winds. Gravity loses its grip on whoever carries it."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:feather`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "Zephyr", type: "talisman"}`
- **Display Gradient:** Crisp Sky Blue to Pale Breeze White (`#e0f7fa` → `#80deea` → `#26c6da` → `#00acc1`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried in inventory: Grants total immunity to Fall Damage.", "color": "gray", "italic": false},
    {"text": "High Falls (>12 blocks): Triggers a Kinetic Wind Shockwave upon landing.", "color": "gray", "italic": false},
    {"text": "Sneak while airborne: Slows fall speed to a gentle glide.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Zephyr Core** (`minecraft:phantom_membrane[custom_data={core:"zephyr"}]`)
- **Unlock Trigger:** Collecting a **Phantom Membrane** or **Breeze Rod**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:breeze_rod`
  - **Sides (N, S, E, W):** 4× `minecraft:phantom_membrane`
  - **Corners:** 4× `minecraft:feather`

### Step 2: Forging at the Smithing Table
- **Template:** `Zephyr Core`
- **Base Item:** `minecraft:feather`
- **Addition Catalyst:** `minecraft:wind_charge`

---

## 3. Skills & Powers

### Passive: Featherweight (Zero Fall Damage)
- **Description:** The laws of terminal velocity are softened around the carrier.
- **Mechanic:**
  - Carrying this charm anywhere in your inventory (`container.*`) completely eliminates all fall damage.
  - The player's `FallDistance` tag is continuously dampened or set to `0.0f` before impact.
  - No armor durability damage is taken from falling.

### Passive: Kinetic Shockwave (Impact Burst)
- **Description:** Stored kinetic potential energy explodes outward when landing from great heights.
- **Mechanic:**
  - If the player falls from a height of **12 blocks or greater**, the landing detonates a **Wind Blast** identical to a breeze burst.
  - All hostile mobs within a **5-block radius** are thrown backwards 6 blocks and dealt **6 kinetic damage**.
  - Creates a visible expanding ripple of `cloud` and `wind_charge` particles with sound `entity.breeze.wind_burst`.

### Active / Utility: Aerial Glide (Glider Mode)
- **Trigger:** Holding **Sneak** while falling or mid-air.
- **Mechanic:**
  - Reduces downward velocity to terminal glide speed (similar to Slow Falling), granting total directional air-control.
  - Allows players to bridge large gaps, leap from mountains safely, or maneuver smoothly during elytra transitions.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:**
  In `data/kandy/function/holders.mcfunction`:
  ```mcfunction
  tag @a remove kandy.charm.zephyr
  execute as @a if items entity @s container.* *[custom_data~{charm:"Zephyr"}] run tag @s add kandy.charm.zephyr
  execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Zephyr"}] run tag @s add kandy.charm.zephyr
  ```
- **Damage Negation:**
  In `data/kandy/function/charms/zephyr_tick.mcfunction`:
  ```mcfunction
  # Continuously reset fall distance or detect fall impact
  execute as @a[tag=kandy.charm.zephyr] run data modify entity @s FallDistance set value 0.0f
  ```
- **High Fall Shockwave:**
  - Track falling ticks via scoreboard objective: `scoreboard objectives add kandy.fall_ticks dummy`
  - When airborne, increment `kandy.fall_ticks`.
  - On landing (on ground), if `kandy.fall_ticks >= 20`, execute shockwave:
    `execute at @s run damage @e[distance=0.1..5,type=!#kandy:friendly_types] 6 kandy:kinetic`
    `execute at @s run particle wind_charge ~ ~0.2 ~ 1.5 0.2 1.5 0 25`
    `scoreboard players set @s kandy.fall_ticks 0`
