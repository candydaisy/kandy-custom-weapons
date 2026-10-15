# Chronos Stiletto

> *"Woven from strands of fractured timelines and desert hourglass sand. Strike today, bleed yesterday."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:golden_sword` (or `minecraft:iron_sword`)
- **Rarity:** `epic`
- **Theme:** Chronomancy, Time Dilation, Stasis, Rewind, Paradox Bleed
- **Custom Data:** `{ability: "Chronos"}`
- **Display Gradient:** Shimmering Sand Gold to Astral Cyan (`#ffeaa7` → `#fdcb6e` → `#e17055` → `#74b9ff` → `#0984e3`)
- **Lore Text:**
  ```json
  [
    {"text": "Strikes apply Paradox: 25% of all damage dealt is repeated 3 seconds later.", "color": "gray", "italic": false},
    {"text": "Right-click: Temporal Anchor marks your position and health.", "color": "gray", "italic": false},
    {"text": "Sneak + Right-click: Rewind time back to your anchor instantly.", "color": "gray", "italic": false},
    {"text": "Crit hit on immobilized target triggers Chrono Stasis (Time Freeze).", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Chronos Core** (`minecraft:clock[custom_data={core:"chronos"}]`)
- **Unlock Trigger:** Crafting a **Clock** or finding **Suspicious Sand**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:recovery_compass`
  - **Sides (N, S, E, W):** 4× `minecraft:clock`
  - **Corners:** 4× `minecraft:amethyst_shard`

### Step 2: Forging at the Smithing Table
- **Template:** `Chronos Core`
- **Base Weapon:** `minecraft:golden_sword`
- **Addition Catalyst:** `minecraft:echo_shard`

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** +7.0
- **Attack Speed:** 2.0 (Extremely fast, precise flurry attacks)
- **Movement Speed:** +10% while held in mainhand
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Paradox Wound (Temporal Echo)
- **Description:** Wounds inflicted by the stiletto do not fully settle in the present.
- **Mechanic:**
  - Whenever you damage an entity, an ethereal golden clock icon (`dust{color:[255, 215, 0]}` + tick sound) hovers above them.
  - Exactly **3.0 seconds later**, the wound rips open again in a temporal paradox, instantly dealing **40% of the total damage taken during those 3 seconds** as true void damage.
  - Visual: Spawns reverse portal particles snapping into the enemy with `block.amethyst_block.chime`.

### Active Skill 1: Temporal Anchor & Rewind (Snapshot)
- **Trigger:**
  - **Anchor (Right-click):** Sets an anchor at your current position, recording your health, hunger, and location. Spawns a translucent ghost marker display of the player.
  - **Rewind (Sneak + Right-click within 6 seconds):**
    - Instantly teleports the player back to the anchored coordinate.
    - Restores the player's health to whatever it was when the anchor was set (if health was higher).
    - Removes negative debuffs accumulated during those seconds.
    - Leaves behind a temporal shockwave where you teleported from, stunning nearby chasers for 1.5 seconds.
- **Cooldown:** 15.0 seconds after rewind or expiry.

### Active Skill 2: Chrono Stasis (Time Freeze)
- **Trigger:** Landing a critical falling strike.
- **Cooldown:** 10.0 seconds per target.
- **Mechanic:**
  - Suspends the target in time for **2.0 seconds**.
  - All motion for the entity is halted (`NoAI:1b` or zeroed `Motion:[0.0,0.0,0.0]`).
  - Projectiles targeting them stop in mid-air around the entity.
  - Once stasis expires, all stopped momentum and buffered damage instantly resumes at once.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Temporal Anchor:**
  - On right-click detection (via carrot on a stick trigger or interaction entity / food component consumption):
    - Spawn a marker tagged `kandy.chronos_anchor` at player position with data storage:
      `data modify storage kandy:chronos PlayerPos set from entity @s Pos`
      `data modify storage kandy:chronos PlayerHealth set from entity @s Health`
    - Start countdown timer `kandy.anchor_timer` (120 ticks).
  - On sneak right-click:
    - Execute `tp @s` to stored coordinates.
    - Restore health using custom regeneration or `data modify`.
- **Paradox Damage Buffering:**
  - Track damage taken on target using `minecraft:entity_hurt_player` or hurt criteria.
  - Store accumulative damage in a scoreboard objective on the target and release it with `/damage` after a 60-tick countdown.
