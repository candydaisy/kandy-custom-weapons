# Pyroclast Cleaver

> *"Forged in the heart of the Nether's lowest magma lakes. It radiates suffocating heat that incinerates everything in its arc."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:netherite_axe`
- **Rarity:** `epic`
- **Theme:** Magma, Volcanic Fissures, Heat Meter / Overheat, Scorched Earth
- **Custom Data:** `{ability: "Pyroclast"}`
- **Display Gradient:** Cinder Orange to Magma Crimson (`#ff9f1a` → `#ff5200` → `#d82b00` → `#7d0b00`)
- **Lore Text:**
  ```json
  [
    {"text": "Attacking builds Heat (0–100%). Higher heat ignites your swings.", "color": "gray", "italic": false},
    {"text": "At 100% Heat: Enter Overdrive — attacks ignite ground into Molten Lava Fissures.", "color": "gray", "italic": false},
    {"text": "Jump + Attack: Magma Slam causes an eruptive shockwave in front of you.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Pyroclast Core** (`minecraft:magma_block[custom_data={core:"pyroclast"}]`)
- **Unlock Trigger:** Obtaining a **Lava Bucket** in the Nether or killing a **Magma Cube**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:respawn_anchor`
  - **Sides (N, S, E, W):** 4× `minecraft:magma_cream`
  - **Corners:** 4× `minecraft:blaze_rod`

### Step 2: Forging at the Smithing Table
- **Template:** `Pyroclast Core`
- **Base Weapon:** `minecraft:netherite_axe`
- **Addition Catalyst:** `minecraft:fire_charge` (or `minecraft:lava_bucket`)

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** +11 (Heavy single-target damage)
- **Attack Speed:** 0.9 (Heavy, deliberate blows)
- **Shield Disabling:** Disables shields for 6 seconds on hit (heavy axe trait)
- **Passive Fire Resistance:** Holding this weapon grants immunity to fire and lava damage while drawn.
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Heat Gauge & Overdrive
- **Description:** Landing hits feeds the cleaver thermal energy, tracked via a **Heat Meter (0–100%)**.
- **Mechanic:**
  - **+20% Heat** per melee hit. Heat decays by 5% every second if not hitting enemies.
  - **Below 50% Heat:** Regular fiery strikes dealing +2 bonus fire damage and setting targets ablaze for 4 seconds.
  - **Above 50% Heat:** Weapon begins smoking heavily with `flame` and `lava` droplets; +4 bonus fire damage.
  - **At 100% Heat (Overdrive - lasts 8 seconds):**
    - The blade turns molten white.
    - Grants the wielder **Strength I** and **Speed I**.
    - Cleaves in a 180° sweep hitting all enemies in front, leaving burning floor fire (`block.fire`).
    - Every hit triggers a mini-explosion dealing **6 blast damage** without destroying terrain.

### Active Skill: Magma Fissure (Ground Eruption)
- **Trigger:** Jump-Attack or Sprint-Attack while holding Sneak.
- **Cooldown:** 6.0 seconds (consumes 50% Heat if available for double damage).
- **Mechanic:**
  - The wielder drives the heavy cleaver into the bedrock, tearing open a linear **Magma Fissure** 10 blocks forward in the facing direction.
  - Erupts jagged columns of `lava` particles, `flame`, and `campfire_cosy_smoke`.
  - Any entity standing over the fissure is launched into the air, dealt **12 fire/physical damage**, and inflicted with `Melt Armor` (reduces armor rating by 20% for 5 seconds).
  - Sound: `entity.generic.explode` followed by sizzling `block.lava.extinguish`.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Heat Meter Tracking:**
  - Objective: `scoreboard objectives add kandy.heat dummy`
  - Displayed on actionbar when holding weapon:
    `title @s actionbar [{"text":"HEAT: ","color":"gold"},{"score":{"name":"@s","objective":"kandy.heat"},"color":"red"},{"text":"%","color":"dark_red"}]`
- **Linear Fissure Raycast:**
  - Function `kandy:pyroclast/fissure_step`:
    Uses `execute positioned ^ ^ ^1` for 10 iterations.
    At each step:
    - Spawns lava/flame particles.
    - Checks ground block and plays `particle block magma_block ~ ~ ~`.
    - Damages `@e[dx=1,dy=2,dz=1,type=!#kandy:friendly_types] 12 kandy:magma`.
- **Custom Damage Type:**
  - `kandy:magma` with fire death message `"was incinerated by Pyroclast Cleaver"`.
