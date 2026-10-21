# Chainwarden Arbalest

> *"Wound with chain pulled from a drowned prison hulk. What it hits, it keeps."*

**Status:** Implemented

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
    {"text": "A bolt that hits a creature Tethers it for 4s (10s cooldown).", "color": "gray", "italic": false},
    {"text": "Sneak while Tethered: Reel. Light targets fly to you; heavy ones pull you in.", "color": "gold", "italic": false},
    {"text": "Sneak within 3s of a bolt sticking in a block: Grapple to it (8s cooldown).", "color": "gold", "italic": false},
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
- With Multishot, the first bolt to hit a creature Tethers it; the others only Shackle.

---

## 4. Skills & Powers

### Passive: Shackle
- Every bolt from the Arbalest that hits a creature gives **Slowness I for 2s**.

### Active Skill 1: Tether & Reel
- **Tether:** a bolt that hits a creature (crossbows only fire fully charged) chains the nearest creature it hit to you for **4 seconds** (chain particles between you and it). **Cooldown: 10s**, starting when the Tether ends.
- **Reel (Sneak while a Tether is up):**
  - **Light targets** (most mobs) are yanked toward you over 0.5s, stopping at walls, and land in melee range with **Slowness II for 1s**.
  - **Heavy targets** (players, iron golems, ravagers, wardens, the Wither, the Ender Dragon, elder guardians, giants, sniffers, happy ghasts) don't move; **you** are pulled to them instead, with fall damage cancelled until you land.
- The Tether breaks if the target gets more than **24 blocks** away, dies, or changes dimension.

### Active Skill 2: Grapple
- **Trigger:** Sneak within **3 seconds** of one of your bolts sticking into a block.
- **Mechanic:** You zip along the chain to the bolt at 2 blocks a tick (up to 30 blocks), stopping before walls, and fall damage is cancelled until you land.
- **Cooldown:** 8 seconds, separate from Tether.

### Downside: Dead Weight
- **-15% movement speed** while a Tether is up.

---

## 5. Technical Implementation (Datapack)

- **Bolts:** each new arrow is checked once (`chainwarden/check_arrow`) for `weapon.components."minecraft:custom_data"{ability:"Chainwarden"}`; its shooter is found by comparing the arrow's `Owner` UUID (`execute on owner` doesn't resolve projectile owners in 26.3) and stored as their player id in `cw_by`. Player ids reuse Eclipse's `ecl_pid`, which every player gets.
- **Hits:** `advancement/hit/chainwarden.json` (projectile damage, Arbalest in either hand) → `chainwarden/hit`: Slowness I on every victim, then `chainwarden/tether` on the nearest if `cw_cd` and `cw_tt` are 0.
- **Tether:** the target gets the tag `kandy.cw_tethered` and the shooter's id in `cw_by`; the player gets `cw_tt` = 80 ticks and the `movement_speed` modifier `kandy:chainwarden_drag` (-15%). Chain particles are drawn each tick.
- **Reel:** a rising edge of Sneak sets `cw_reel` = 15 ticks. Light targets are stepped 3 × 0.6 blocks a tick toward you with passable checks; heavy ones (entity tag `kandy:heavy`) pull you instead, 4 × 0.5 blocks a tick. It ends within 2.5 blocks or when the reel runs out, with Slowness II for 1s on a light target.
- **Grapple:** with no Tether up, a rising edge of Sneak picks your nearest Arbalest bolt within 30 blocks that has been in a block for 60 ticks or less (`life`), then pulls you 2 blocks a tick for up to 15 ticks.
- **Cooldowns:** `cw_cd` (200 ticks, from when the Tether ends), `cw_gcd` (160 ticks).
- **Fall damage:** `fall_damage_multiplier` modifier `kandy:chainwarden_fall` (-100%) until you land.
