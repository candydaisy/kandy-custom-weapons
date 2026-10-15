# Tempest Pike

> *"Forged beneath howling clouds and charged by the fury of ancient storms."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:trident`
- **Rarity:** `epic`
- **Theme:** Storms, Static Electricity, Thunder & Lightning, High Mobility
- **Custom Data:** `{ability: "Tempest"}`
- **Display Gradient:** Cyan to Deep Electric Indigo (`#00e5ff` → `#38b6ff` → `#5271ff` → `#3b14a7`)
- **Lore Text:**
  ```json
  [
    {"text": "Melee and thrown hits chain static bolts to nearby enemies.", "color": "gray", "italic": false},
    {"text": "Sneak + Throw: Discharge into the sky to call down a thunder storm strike.", "color": "gray", "italic": false},
    {"text": "Right-click midair: Gale Surge dash in target direction (3s CD).", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step crafting system:

### Step 1: Crafting the Core
- **Item Name:** **Tempest Core** (`minecraft:heart_of_the_sea[custom_data={core:"tempest"}]`)
- **Unlock Trigger:** Acquiring a **Lightning Rod** or **Heart of the Sea**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:heart_of_the_sea`
  - **Sides (N, S, E, W):** 4× `minecraft:lightning_rod`
  - **Corners:** 4× `minecraft:copper_block`

### Step 2: Forging at the Smithing Table
- **Template:** `Tempest Core`
- **Base Weapon:** `minecraft:trident`
- **Addition Catalyst:** `minecraft:nautilus_shell`

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** +9 (Base 9 damage melee)
- **Attack Speed:** 1.2
- **Range / Reach Bonus:** +1.0 Block Entity Reach
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Static Conduction (Chain Lightning)
- **Description:** Landing a melee strike or throwing the pike onto a target marks them with `Static`.
- **Mechanic:**
  - After striking an enemy, an electric bolt arcs from the target to up to **3 nearby hostiles** within an 8-block radius.
  - Chained enemies suffer **4 magic damage** (`type: "minecraft:lightning_bolt"`) and are briefly staggered (`movement_speed` penalty 40% for 1.5 seconds).
  - Emits `electric_spark` and `glow` particles with sound `entity.lightning_bolt.impact` (pitch 1.8).

### Active Skill 1: Gale Surge (Aerial Dash)
- **Trigger:** Right-click while airborne (falling or jumping) without holding sneak.
- **Cooldown:** 3.0 seconds (tracked via scoreboard / item cooldown).
- **Mechanic:**
  - Propels the player 10 blocks forward in the exact crosshair gaze direction (using motion vector or `tp` raycast).
  - Emits a sonic ring of `cloud` and `sweep_attack` particles along the trajectory.
  - Leaves a gust vortex that knocks back all entities passed through by 3 blocks and deals **5 kinetic damage**.
  - Cancels fall damage until the player touches the ground.

### Active Skill 2: Skyward Wrath (Thunderbolt Strike)
- **Trigger:** Sneak + Throw (Riptide/Throw execution while crouching).
- **Cooldown:** 6.0 seconds.
- **Mechanic:**
  - Rather than a standard throw, the pike ascends vertically into the clouds wrapped in swirling blue spiral particles (`wax_off` + `dust{color:[0, 220, 255]}`).
  - Target location (where crosshair aims up to 25 blocks away) is marked by a converging ground circle of electric particles.
  - After 0.75 seconds, a true **Lightning Bolt** strikes the targeted area regardless of weather (clear skies allowed).
  - Any entity caught within 4 blocks of the impact takes **14 blast/lightning damage** and is launched 3 blocks into the air.
  - The pike instantly returns to the player's mainhand.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Predicates:**
  - `kandy:holding_tempest_pike` (`selected_item` matching `custom_data: {ability: "Tempest"}`)
  - `kandy:sneaking` (`entity_properties: {flags: {is_sneaking: true}}`)
- **Scoreboard Objectives:**
  - `kandy.tempest_cd`: Timer for dash & thunderstorm cooldowns.
  - `kandy.tempest_throw`: `minecraft.used:minecraft.trident`.
- **Entity Marker:**
  - Throwing creates/tracks `minecraft:trident[custom_data={tempest_proj:1b}]` with an invisible display marker running a tick loop for particle trails and hit detection.
- **Raycast / Chain Detection:**
  - On hit advancement trigger (`minecraft:player_hurt_entity`), execute `function kandy:tempest/chain` at `@s` searching `@e[distance=0.1..8,type=!#kandy:friendly_types,limit=3,sort=nearest]` to apply damage and spawn line particles.
