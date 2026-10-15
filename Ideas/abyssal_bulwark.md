# Abyssal Bulwark

> *"Forged from deep oceanic trenches and elder guardian carapace. Those who strike this shield find the entire weight of the sea crashing back upon them."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:shield`
- **Rarity:** `epic`
- **Theme:** Ocean Depths, Pressure, Perfect Parry, Guard Counter, Tidal Shockwave
- **Custom Data:** `{ability: "Abyssal"}`
- **Display Gradient:** Deep Sea Cyan to Abyssal Navy (`#00f2fe` → `#4facfe` → `#0052d4` → `#001f3f`)
- **Lore Text:**
  ```json
  [
    {"text": "Blocking stores kinetic energy as Abyssal Pressure (0–5 charges).", "color": "gray", "italic": false},
    {"text": "Perfect Parry (block within 0.35s of hit): Negates damage and stuns the attacker.", "color": "gray", "italic": false},
    {"text": "Crouch-Release Block: Releases a crushing Tidal Surge that sweeps enemies away.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Abyssal Core** (`minecraft:prismarine_shard[custom_data={core:"abyssal"}]`)
- **Unlock Trigger:** Defeating an **Elder Guardian** or mining **Dark Prismarine**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:sponge` (or `minecraft:conduit`)
  - **Sides (N, S, E, W):** 4× `minecraft:dark_prismarine`
  - **Corners:** 4× `minecraft:prismarine_crystals`

### Step 2: Forging at the Smithing Table
- **Template:** `Abyssal Core`
- **Base Weapon:** `minecraft:shield`
- **Addition Catalyst:** `minecraft:heart_of_the_sea` (or `minecraft:echo_shard`)

---

## 3. Weapon Attributes & Stat Profile

- **Knockback Resistance:** +0.4 (Prevents being knocked back when hit)
- **Armor Toughness Bonus:** +3
- **Durability:** Unbreakable (`unbreakable={}`)
- **Shield Stun Immunity:** Cannot be disabled by axes when performing a Perfect Parry.

---

## 4. Skills & Powers

### Passive: Abyssal Pressure Absorption
- **Description:** Absorbs the force of blocked strikes.
- **Mechanic:**
  - Blocking any melee or projectile attack adds **+1 Charge of Abyssal Pressure** (up to 5 charges max).
  - Charges are displayed above the hotbar with sea bubble icons.
  - Each charge passively increases the wielder's **Resistance** level by 1 for 4 seconds after blocking.

### Active Skill 1: Perfect Parry & Riposte
- **Trigger:** Raising the shield within **0.35 seconds (7 ticks)** before an incoming attack lands.
- **Mechanic:**
  - Completely nullifies the incoming attack damage and prevents shield cooldown (even against Axes!).
  - Flashes a sharp oceanic burst of `splash` and `elder_guardian` curse ring particles.
  - The attacking enemy is deflected, receiving **Heavy Stagger** (cannot attack or move for 1.8 seconds).
  - Plays the resounding metallic bell chime `block.anvil.land` pitched high.
  - Instantly grants the player **3 full Abyssal Pressure charges**.

### Active Skill 2: Tidal Surge (Guard Counter)
- **Trigger:** Releasing block while crouching with at least 1 Abyssal Pressure charge.
- **Mechanic:**
  - Thrusts the shield forward, unleashing a massive concussive **Tidal Wave** in a 120-degree cone spanning 8 blocks forward.
  - Each stored charge increases the wave's damage and knockback:
    - **1–2 Charges:** Deals 6 drowned damage, knocks targets back 4 blocks.
    - **3–4 Charges:** Deals 12 drowned damage, knocks targets back 8 blocks into walls (causing impact damage).
    - **5 Charges (Max Depth Crush):** Deals **20 crushing damage**, launches enemies 6 blocks into the air, and inflicts `Mining Fatigue III` and `Slowness IV` for 6 seconds as ocean pressure crushes them.
  - Floods the path with torrential water particles (`splash`, `bubble_pop`, `current_down`).

---

## 5. Technical Implementation Blueprint (Datapack)

- **Parry Detection:**
  - Track `minecraft.used:minecraft.shield` in combination with `player_hurt_entity` / `entity_hurt_player` advancements.
  - When shield is raised, start a tick timer `kandy.parry_window`. If hurt while `kandy.parry_window <= 7`, count as Perfect Parry.
- **Tidal Surge Raycast / Cone:**
  - On releasing sneak+block with charges:
    - Execute `function kandy:abyssal/wave` expanding in fan angles `^ ^ ^` up to 8 blocks.
    - Play `playsound entity.player.splash ambient @a ~ ~ ~ 2 0.8`.
    - Apply custom damage and motion vectors to affected entities.
- **Cooldown & Reset:**
  - Resets charges to 0 and triggers shield cooldown animation if desired.
