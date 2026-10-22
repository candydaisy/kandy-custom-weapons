# Chronos Stiletto

> *"Woven from strands of fractured timelines and desert hourglass sand. Strike today, bleed yesterday."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:golden_sword`
- **Rarity:** `epic`
- **Theme:** Chronomancy, Time Dilation, Stasis, Rewind, Paradox Bleed
- **Custom Data:** `{ability: "Chronos"}`
- **Display Gradient:** Shimmering Sand Gold to Astral Cyan (`#ffeaa7` → `#fdcb6e` → `#e17055` → `#74b9ff` → `#0984e3`)
- **Lore Text:**
  ```json
  [
    {"text": "Charged hits leave a Paradox: +1.5 damage per hit (max 3) strikes 3s later.", "color": "gray", "italic": false},
    {"text": "Right-click: set a Temporal Anchor for 6s.", "color": "gray", "italic": false},
    {"text": "Sneak + right-click: rewind to it and recover some health (20s cooldown).", "color": "gray", "italic": false},
    {"text": "Critical hits freeze the target in time (10s per target).", "color": "gold", "italic": false},
    {"text": "Rewinding leaves you weakened for 3s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Chronos Core** (shown as `minecraft:clock` via `item_model`; the real item is an unobtainable `minecraft:budding_amethyst` template)
- **Unlock Trigger:** Getting a **Clock** or **Suspicious Sand**
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

- **Attack Damage:** 6
- **Attack Speed:** 1.8
- **Movement Speed:** +5% while held
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Paradox Wound
- **Trigger:** Fully charged, unblocked hits.
- **Mechanic:** Each hit adds a Paradox stack (**max 3**). When the target's **3-second** window closes, the wound opens again for **1.5 damage per stack** (up to 4.5), ignoring armor. A golden mark hovers over wounds waiting to reopen.

### Active Skill 1: Temporal Anchor & Rewind
- **Anchor (right-click):** marks your spot and health for **6 seconds**, shown as a ghost at the anchor.
- **Rewind (sneak + right-click while an anchor is up):**
  - Teleports you back to the anchor, if it's in the same dimension and the spot is still clear. Otherwise the timeline snaps and the cooldown starts anyway.
  - Recovers some of the health lost since the anchor: Instant Health (4 HP) if you lost 4+, otherwise a short Regeneration II. Player health can't be set directly, so it's an approximation, and hunger isn't restored.
  - Cleanses Poison, Wither, Slowness, Weakness, Blindness, Darkness, Nausea, Mining Fatigue and Hunger.
  - A temporal shockwave where you left gives anything within 3 blocks **Slowness IV for 1s**.
- **Cooldown:** 20 seconds, after a rewind or when the anchor expires. Dying drops the anchor.

### Active Skill 2: Chrono Stasis
- **Trigger:** A critical (falling) hit.
- **Cooldown:** 10 seconds per target.
- **Mechanic:** Mobs are **frozen in time for 2 seconds**. Players get a heavy slow (**Slowness V for 1s**) instead.

### Downside: Time Debt
- Each rewind leaves you with **Weakness I for 3 seconds**.

---

## 5. Technical Implementation (Datapack)

- **Right-click:** the stiletto has a `consumable` component that never finishes, so a `using_item` advancement fires every tick it's held in use; only the first tick of a press counts (`chr_use`, `chr_held`).
- **Anchor:** a `kandy.chr_anchor` marker per player (`chr_id`), with a 120-tick window (`chr_anc`); health is stored in `chr_ahp`.
- **Paradox:** stacks in `chr_ps`, a 60-tick window in `chr_pt`; damage type `kandy:chronos_paradox` is in `#minecraft:bypasses_armor`.
- **Stasis:** `chr_st` (40 ticks) on the target and `chr_scd` (200-tick per-target cooldown).
- **Not implemented from the original idea:** frozen projectiles and buffered damage released when stasis ends.
