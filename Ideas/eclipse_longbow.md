# Eclipse Longbow

> *"Formed from remnants of the End's collapsed stars. Arrows shot from this bow bend space and drink the light."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:bow`
- **Rarity:** `epic`
- **Theme:** Void, Space Distortion, Singularity, Shadow Archery, Gravity
- **Custom Data:** `{ability: "Eclipse"}`
- **Display Gradient:** Obsidian Black to Cosmic Purple (`#1b0026` → `#390050` → `#6c0ba9` → `#a855f7` → `#d8b4fe`)
- **Lore Text:**
  ```json
  [
    {"text": "Arrows leave a trail of cosmic void dust and pierce through all targets.", "color": "gray", "italic": false},
    {"text": "Full Draw: Fires a Singularity Arrow that pulls enemies into an event horizon.", "color": "gray", "italic": false},
    {"text": "Sneak while arrow flies: Shadow Swap places you where the arrow strikes.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Eclipse Core** (`minecraft:ender_eye[custom_data={core:"eclipse"}]`)
- **Unlock Trigger:** Acquiring an **Ender Eye** or **Dragon Breath**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:ender_eye`
  - **Sides (N, S, E, W):** 4× `minecraft:crying_obsidian`
  - **Corners:** 4× `minecraft:ender_pearl`

### Step 2: Forging at the Smithing Table
- **Template:** `Eclipse Core`
- **Base Weapon:** `minecraft:bow`
- **Addition Catalyst:** `minecraft:dragon_breath`

---

## 3. Weapon Attributes & Stat Profile

- **Draw Speed:** Fast-tuned (or vanilla bow with custom arrow velocity tag).
- **Arrow Damage Multiplier:** +35% projectile velocity & damage.
- **Components:**
  - `unbreakable={}`
  - `enchantment_glint_override=true`
  - Built-in `infinity` or custom quiver mechanics.

---

## 4. Skills & Powers

### Passive: Void Piercing & Phase Velocity
- **Description:** Arrows shot from the Eclipse Longbow are transformed into ethereal void projectiles.
- **Mechanic:**
  - Arrows do not stop on impact with mobs; they pierce infinitely through all entities in their flight path.
  - Arrows leave a heavy particle trail of `portal`, `witch`, and `reverse_portal`.
  - Passing through an enemy deals **10 void damage** and afflicts them with **Darkness** and **Glow** for 3 seconds.

### Active Skill 1: Event Horizon (Singularity Arrow)
- **Trigger:** Fully charging the bow (full draw) and releasing while standing still or aiming down sights.
- **Cooldown:** 8.0 seconds.
- **Mechanic:**
  - When the arrow strikes a surface or entity, it collapses into an **Event Horizon (Vortex)** lasting 3.5 seconds.
  - The vortex generates a pulsating sphere of black/purple particles (`entity_effect{color:[0.3, 0.0, 0.5]}` and `dragon_breath`).
  - Pulls all entities within an 8-block radius violently toward the center point every tick.
  - Enemies inside take **2 void damage every 0.5 seconds**.
  - At the end of the 3.5 seconds, the singularity implodes with a deafening void boom (`entity.warden.sonic_boom`), dealing **12 explosion damage** to everything caught at the core.

### Active Skill 2: Shadow Warp (Spatial Swap)
- **Trigger:** Pressing **Sneak** while any shot arrow is currently in mid-air.
- **Cooldown:** 4.0 seconds.
- **Mechanic:**
  - Instantly teleports the player to the exact coordinates of the arrow in mid-flight or at impact point.
  - Swaps the player's momentum and leaves a shadow decoy at the departure spot that blinds nearby enemies.
  - Allows traversing chasms, dodging incoming attacks, or instantly engaging flying targets (such as Phantoms or Withers).

---

## 5. Technical Implementation Blueprint (Datapack)

- **Bow Charge Detection:**
  - Use scoreboard tracking `minecraft.used:minecraft.bow`.
  - Read `player_weapon` when firing or track arrow spawn via `minecraft:arrow[custom_data={kandy_eclipse:1b}]`.
- **Arrow Ticking Marker:**
  - Spawn an `interaction` or `marker` riding the arrow:
    `execute at @e[type=arrow,tag=!kandy.processed] run summon marker ~ ~ ~ {Tags:["kandy.eclipse_tracker"]}`
- **Piercing Logic:**
  - Use `damage @e[distance=..1.5,type=!#kandy:allies] 10 kandy:void` along the raycast path while retaining arrow flight.
- **Singularity Gravity Pull:**
  - When arrow lands (`inGround:1b`), summon a marker tagged `kandy.singularity` with lifetime 70 ticks.
  - In `singularity/tick.mcfunction`:
    Execute `facing entity @s` and apply subtle positive motion vector or `tp ^ ^ ^0.25` on non-player hostiles.
