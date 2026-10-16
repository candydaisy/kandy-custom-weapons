# Frostveil Scythe

> *"Carved from eternal permafrost, every swing chills the air until blood itself turns to crystal."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:diamond_hoe`, styled as a grim war-scythe
- **Rarity:** `epic`
- **Theme:** Cryomancy, Freezing Stacks, Execution Shatter
- **Custom Data:** `{ability: "Frostveil"}`
- **Display Gradient:** Ice White to Glacial Blue (`#ffffff` → `#cbe9f7` → `#7bc5eb` → `#2d88c4`)
- **Lore Text:**
  ```json
  [
    {"text": "Charged hits stack Hypothermia (max 5): -10% speed per stack.", "color": "gray", "italic": false},
    {"text": "At 5 stacks the target is Frozen Solid for 1.5s.", "color": "gray", "italic": false},
    {"text": "Hitting a Frozen target Shatters it for 6 true damage.", "color": "gray", "italic": false},
    {"text": "Sneak-attack: Frost Nova chills everything within 5 blocks.", "color": "aqua", "italic": false},
    {"text": "Its chill slows you 5%, and powder snow bites harder.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Glacial Core** (shown as `minecraft:blue_ice` via `item_model`; the real item is an unobtainable `minecraft:dirt_path` template)
- **Unlock Trigger:** Getting **Blue Ice**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:blue_ice`
  - **Sides (N, S, E, W):** 4× `minecraft:packed_ice`
  - **Corners:** 4× `minecraft:snow_block`

### Step 2: Forging at the Smithing Table
- **Template:** `Glacial Core`
- **Base Weapon:** `minecraft:diamond_hoe`
- **Addition Catalyst:** `minecraft:powder_snow_bucket`

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** 8
- **Attack Speed:** 1.0
- **Reach:** +0.5 entity reach, +1 block reach
- **Movement Speed:** -5% while held (the Chill downside)
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Hypothermia & Frozen Solid
- **Trigger:** A fully charged, unblocked hit.
- **Mechanic:**
  - Each hit adds **+1 Hypothermia stack** (max 5). Every stack is **-10% movement speed**, and all stacks clear **6 seconds** after the last one.
  - **At 5 stacks:** the target is **Frozen Solid for 1.5 seconds** and can't walk or jump, though it can still attack. After thawing it can't be frozen again for **5 seconds**.
  - Ice particles and `block.glass.break` mark the freeze.

### Passive: Glacial Shatter (Execution)
- **Trigger:** A charged hit on a target that is Frozen Solid.
- **Mechanic:** The ice breaks for **6 armor-ignoring damage**, plus **3 damage** to other creatures within **4 blocks**.

### Active Skill: Frost Nova (Area Freeze)
- **Trigger:** Sneak + charged attack.
- **Cooldown:** 8 seconds.
- **Mechanic:**
  - An expanding frost ring hits everything within **5 blocks** for **4 damage** and adds **+2 Hypothermia stacks**, with knockback.
  - Still water nearby freezes over for **4 seconds**, then turns back into water.
  - The ice spikes are particles only.

### Downside: Chill
- **-5% movement speed** while held.
- In **powder snow**, holding the scythe deals an extra **1 freeze damage per second**.

---

## 5. Technical Implementation (Datapack)

- **Hits:** `advancement/hit/frostveil.json` → `frostveil/hit`; frozen victims shatter, everyone else gains a stack.
- **Self-hit guard:** Shatter and Nova damage count as hits too, so hits made while one is being resolved are ignored.
- **Slow:** a `movement_speed` modifier `kandy:frost_slow` (-10% to -40%) per stack; Frozen Solid uses `kandy:frost_freeze` (-100%) for 30 ticks.
- **Scoreboards:** `frost_stacks`, `frost_timer` (120 ticks), `frost_frozen`, `frost_imm` (100-tick immunity), `frost_cd` (160-tick Nova cooldown), `frost_chill`.
- **Frost Nova water:** `kandy.frost_ice` markers on each frozen water block with an 80-tick timer (`frost_ice`) turn the ice back into water; uninstall melts any left over.
