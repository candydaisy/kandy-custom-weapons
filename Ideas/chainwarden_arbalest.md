# Chainwarden Arbalest

> *"Wound with chain pulled from a drowned prison hulk. What it hits, it keeps."*

**Status:** Proposed (not implemented)

---

## 1. Overview & Identity

- **Base Item:** `minecraft:crossbow`
- **Rarity:** `epic`
- **Theme:** Hunting, Chains, Harpoons, Grappling, Battlefield Control
- **Custom Data:** `{ability: "Chainwarden"}`
- **Display Gradient:** Rust Iron to Deep Sea Steel (`#b5651d` → `#8d6e63` → `#5c7a89` → `#2f4858`)
- **Lore Text:**
  ```json
  [
    {"text": "Bolts Shackle what they hit: Slowness I for 2s.", "color": "gray", "italic": false},
    {"text": "A charged bolt that hits a creature Tethers it for 4s (10s cooldown).", "color": "gray", "italic": false},
    {"text": "Sneak while Tethered: Reel. Light targets fly to you; heavy ones pull you in.", "color": "gold", "italic": false},
    {"text": "Sneak within 3s of a bolt hitting a block: Grapple to it (8s cooldown).", "color": "gold", "italic": false},
    {"text": "Holding the chain weighs you down: -15% speed while a Tether is up.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Chain Core** (shown as `minecraft:chain` via `item_model`; real item: an unused spawn egg template such as `minecraft:turtle_spawn_egg`)
- **Unlock Trigger:** Killing a **Pillager** or getting a **Lodestone**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:lodestone`
  - **Sides (N, S, E, W):** 4× `minecraft:chain`
  - **Corners:** 4× `minecraft:tripwire_hook`

### Step 2: Forging at the Smithing Table
- **Template:** `Chain Core`
- **Base Weapon:** `minecraft:crossbow`
- **Addition Catalyst:** `minecraft:lead`

---

## 3. Weapon Attributes & Stat Profile

- **Bolt damage:** vanilla crossbow arrows (keeps Piercing, Multishot and Quick Charge)
- **Durability:** Unbreakable (`unbreakable={}`)
- Multishot fires three bolts, but only the **center** bolt can Tether, so Multishot is a spread choice, not a triple Tether.

---

## 4. Skills & Powers

### Passive: Shackle
- Every bolt from the Arbalest that hits a creature gives **Slowness I for 2s**.

### Active Skill 1: Tether & Reel
- **Tether:** a bolt fired from a fully charged crossbow that hits a creature chains it to you for **4 seconds** (chain particles between you and it). **Cooldown: 10s**, starting when the Tether ends.
- **Reel (Sneak while a Tether is up):**
  - **Light targets** (most mobs) are yanked toward you over 0.5s, stopping at walls, and land in melee range with **Slowness II for 1s**.
  - **Heavy targets** (players, iron golems, ravagers, wardens, bosses, anything with `knockback_resistance` ≥ 0.5) don't move; **you** are pulled to them instead, with fall damage cancelled until you land.
- The Tether breaks if the target gets more than **24 blocks** away or out of line of sight for 1s.

### Active Skill 2: Grapple
- **Trigger:** Sneak within **3 seconds** of one of your bolts sticking into a block.
- **Mechanic:** You're pulled along the chain to the bolt (up to 30 blocks), stopping before walls, and fall damage is cancelled until you land.
- **Cooldown:** 8 seconds, separate from Tether.

### Downside: Dead Weight
- **-15% movement speed** while a Tether is up.

---

## 5. Technical Implementation Notes (Datapack)

- **Bolt pickup:** new arrows are checked once for `weapon.components."minecraft:custom_data"{ability:"Chainwarden"}` (Eclipse's pattern); the center bolt of a Multishot is the one whose motion matches your view most closely.
- **Ownership:** compare the arrow's `Owner` UUID (`execute on owner` doesn't resolve projectile owners in 26.3).
- **Tether:** a `player_hurt_entity` advancement on projectile damage tags the victim; a per-player id score links the target, and particles are drawn along the chain each tick.
- **Reel:** step the target (or the player) 0.5 blocks per tick with `tp ^ ^ ^0.5` and passable checks, like World Breaker's pull and Tempest's Gale Surge. Player motion can't be set, so players are always moved with `tp`.
- **Grapple:** a landed bolt (`inGround:1b`) of yours inside a 3s window becomes the target; sneak is read on the rising edge, like Eclipse's Shadow Warp.
- **Heavy check:** an entity type tag `kandy:heavy` plus a `knockback_resistance` attribute read.
