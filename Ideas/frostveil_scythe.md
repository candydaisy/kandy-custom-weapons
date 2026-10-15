# Frostveil Scythe

> *"Carved from eternal permafrost, every swing chills the air until blood itself turns to crystal."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:diamond_hoe` (or `minecraft:diamond_axe`) styled as a Grim War-Scythe
- **Rarity:** `epic`
- **Theme:** Cryomancy, Glacial Shards, Freezing Stacks, Execution Shatter
- **Custom Data:** `{ability: "Frostveil"}`
- **Display Gradient:** Ice White to Glacial Blue (`#ffffff` → `#cbe9f7` → `#7bc5eb` → `#2d88c4`)
- **Lore Text:**
  ```json
  [
    {"text": "Hits inflict Hypothermia (1-5 stacks). Stacks slow and freeze.", "color": "gray", "italic": false},
    {"text": "At 5 stacks: Target is Frozen Solid for 2.5 seconds.", "color": "gray", "italic": false},
    {"text": "Sneak-Attack: Frost Nova burst around you.", "color": "gray", "italic": false},
    {"text": "Attacking a Frozen Solid target causes Shatter (Double Crit Damage).", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Glacial Core** (`minecraft:blue_ice[custom_data={core:"glacial"}]`)
- **Unlock Trigger:** Mining or holding **Blue Ice**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:blue_ice`
  - **Sides (N, S, E, W):** 4× `minecraft:packed_ice`
  - **Corners:** 4× `minecraft:snow_block`

### Step 2: Forging at the Smithing Table
- **Template:** `Glacial Core`
- **Base Weapon:** `minecraft:diamond_hoe` (or `minecraft:diamond_axe`)
- **Addition Catalyst:** `minecraft:powder_snow_bucket`

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** +8.5
- **Attack Speed:** 1.0 (Sweeping, weighty scythe swings)
- **Attribute Modifiers:**
  - `minecraft:generic.attack_damage`: 8.5
  - `minecraft:generic.attack_speed`: 1.0
  - `minecraft:player.block_interaction_range`: +1.0
  - `minecraft:player.entity_interaction_range`: +1.0
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Hypothermia & Glacial Freeze
- **Description:** Basic melee attacks coat the victim in frost.
- **Mechanic:**
  - Each attack adds **+1 Hypothermia Stack** (up to 5) to the target for 6 seconds.
  - **1–4 Stacks:** Applies progressive Slowness I through IV and increases powder snow freezing vignette screen tick on players/mobs (`ticks_frozen` component).
  - **At 5 Stacks (Frozen Solid):**
    - The target is encased in temporary ice particles (`snowflake`, `item_snowball`, `dust{color:[180, 230, 255]}`).
    - The target is completely immobilized (`movement_speed` reduced by 100%, cannot jump or attack) for **2.5 seconds**.
    - Emits sound `block.glass.break` pitched deep.

### Passive: Glacial Shatter (Execution)
- **Description:** Delivering a direct melee strike to a target that is **Frozen Solid** consumes all freeze stacks.
- **Mechanic:**
  - Causes a violent explosion of ice shards dealing **150% additional True Damage** (ignoring armor).
  - The shatter launches jagged icicle particles in all directions, dealing **5 splash cold damage** to nearby hostiles within 4 blocks.
  - Plays the sharp crystalline sound `block.amethyst_block.shatter` with heavy screen shake.

### Active Skill: Frost Nova (Area Freeze)
- **Trigger:** Crouch (Sneak) + Attack.
- **Cooldown:** 5.0 seconds.
- **Mechanic:**
  - The player slams the scythe into the ground, creating an expanding ring of frosted ice spikes on the floor up to a 6-block radius.
  - Temporarily converts water in a 4-block radius to frosted ice for 4 seconds.
  - All enemies caught in the nova are knocked back 2 blocks, dealt **6 cold damage**, and immediately receive **3 stacks of Hypothermia**.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Damage Type:** Custom damage type `kandy:frost` using `damage_type` json with `bypasses_armor` or tagged as freeze damage.
- **Hypothermia Tracking:**
  - Target tagged with `kandy.frost_target` and scoreboard objective `kandy.frost_stacks` (dummy).
  - Timer scoreboard `kandy.frost_timer` decrements every tick; clears stacks after 120 ticks without refresh.
- **Entity Freezing:**
  - Modify `data modify entity @s TicksFrozen set value 300`.
  - Apply `slowness` attribute modifier or potion effect level 5 for the 2.5 second duration.
- **Visuals:**
  - `particle snowflake ~ ~1 ~ 0.5 0.8 0.5 0.05 30`
  - Ring generation using local coordinates `^ ^ ^` in a recursive function.
