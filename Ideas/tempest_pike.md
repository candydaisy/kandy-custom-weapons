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
    {"text": "Charged and thrown hits arc lightning to 2 nearby enemies.", "color": "gray", "italic": false},
    {"text": "Jump again midair: Gale Surge dashes where you look (4s).", "color": "gray", "italic": false},
    {"text": "Sneak + Attack or a thrown hit: Skyward Wrath strikes the nearest other foe (10s).", "color": "aqua", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Tempest Core** (shown as `minecraft:heart_of_the_sea` via `item_model`; the real item is an unobtainable `minecraft:frogspawn` template)
- **Unlock Trigger:** Getting a **Lightning Rod** or a **Heart of the Sea**
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

- **Attack Damage:** 9
- **Attack Speed:** 1.2
- **Reach Bonus:** +0.5 entity reach
- **Durability:** Unbreakable (`unbreakable={}`)
- **Enchanting:** keeps trident enchantments (Impaling, Loyalty, Riptide...); tridents can't take Sharpness.

---

## 4. Skills & Powers

### Passive: Static Conduction (Chain Lightning)
- **Trigger:** A fully charged, unblocked melee hit, or a thrown Tempest Pike hitting something.
- **Mechanic:**
  - A bolt arcs from each victim to the **2 nearest other creatures within 6 blocks**.
  - Each chained creature takes **3 armor-piercing lightning damage** (credited to you) and **Slowness II for 2s**.
  - `electric_spark` arcs are drawn between targets, with `entity.lightning_bolt.impact` (pitch 1.8).

### Active Skill 1: Gale Surge (Aerial Dash)
- **Trigger:** A fresh press of **Jump** after at least 4 ticks (0.2s) in the air. Not while sneaking, gliding, swimming or riding.
- **Cooldown:** 4 seconds.
- **Mechanic:**
  - Dashes up to **6 blocks** where you look, stopping at walls and lava.
  - Everything you pass through takes **3 damage** and knockback.
  - Cancels fall damage until you land.

### Active Skill 2: Skyward Wrath (Thunderbolt Strike)
- **Trigger:** A fully charged melee hit **while sneaking**, or a **thrown** Tempest Pike hitting something (any throw counts while it's ready; a sneak-throw can't be detected reliably).
- **Cooldown:** 10 seconds.
- **Mechanic:**
  - The bolt targets the **nearest other creature within 12 blocks** of the one you hit (or the one you hit, if nobody else is near).
  - A shrinking ring of sparks marks the spot, and **0.75s later** the bolt lands.
  - Everything within **3 blocks** takes **8 armor-piercing lightning damage** and is launched (players get a brief Levitation).
  - The bolt is particles and thunder only, so it never starts fires or converts mobs.

---

## 5. Technical Implementation (Datapack)

- **Melee hits:** `advancement/hit/tempest.json` (`player_hurt_entity`, not a projectile, `damage.dealt` ≥ 7.6, unblocked) → `tempest/hit`.
- **Thrown hits:** tridents carrying the pike are tagged `kandy.tem_proj` on their first tick (`tempest/tag_proj`); `advancement/tempest/throw_hit.json` matches the tagged trident as `direct_entity` → `tempest/throw_hit`, which finds your trident by comparing its `Owner` UUID (`execute on owner` doesn't resolve projectile owners in 26.3), calls Skyward Wrath from the trident's position if `tem_scd` is 0, then chains.
- **Self-hit guard:** the pack's own lightning damage counts as a hit, so `kandy.tem_busy` ignores hits while one is being resolved.
- **Lightning damage:** custom damage type `kandy:tempest_lightning` (in `#minecraft:bypasses_armor` and `#minecraft:is_lightning`).
- **Skyward Wrath strike:** a `kandy.tem_strike` marker with a 15-tick timer (`tem_t`) runs `tempest/strike_tick`.
- **Scoreboards:** `tem_dcd` (Gale Surge cooldown), `tem_scd` (Skyward Wrath cooldown), `tem_air`/`tem_jump`/`tem_prev` (jump detection), `tem_fall` (fall-damage grace).
- **Fall damage:** `fall_damage_multiplier` modifier `kandy:tempest_surge` (-100%) until you land.
