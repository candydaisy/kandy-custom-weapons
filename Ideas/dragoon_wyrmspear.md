# Dragoon's Wyrmspear

> *"Tipped with a scale the dragon left behind. It wants to be thrown at the sky and brought back down."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:netherite_spear` (vanilla spears are in 26.3: quick jabs plus a held charge attack)
- **Rarity:** `epic`
- **Theme:** Dragoons, Leaps, Dives, Piercing Reach
- **Custom Data:** `{ability: "Dragoon"}`
- **Display Gradient:** Dragon Violet to Ender Teal (`#e0aaff` → `#9d4edd` → `#3c096c` → `#0b525b`)
- **Lore Text:**
  ```json
  [
    {"text": "Jabs on the same target stack Puncture: +1 damage per stack (max 3).", "color": "gray", "italic": false},
    {"text": "Charge hits Skewer: -15% armor and Slowness II for 3s.", "color": "gray", "italic": false},
    {"text": "Sneak + Jump: Dragoon Leap. Hold or press Sneak at the top to Dive (12s cooldown).", "color": "gold", "italic": false},
    {"text": "A Dive leaves you rooted: Slowness III for 2s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Wyrm Core** (shown as `minecraft:dragon_head` via `item_model`; real item: an unused spawn egg template such as `minecraft:strider_spawn_egg`)
- **Unlock Trigger:** Getting a **Spear** of any kind, or entering **the End**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:dragon_breath`
  - **Sides (N, S, E, W):** 4× `minecraft:phantom_membrane`
  - **Corners:** 4× `minecraft:end_rod`

### Step 2: Forging at the Smithing Table
- **Template:** `Wyrm Core`
- **Base Weapon:** `minecraft:netherite_spear`
- **Addition Catalyst:** `minecraft:shulker_shell`

---

## 3. Weapon Attributes & Stat Profile

- **Attack Damage:** 6 (vanilla netherite spear 5, +1)
- **Attack Speed:** 0.87, same as the vanilla netherite spear (spears only attack at full charge)
- **Reach:** vanilla spear reach
- **Durability:** Unbreakable (`unbreakable={}`)
- Keeps spear enchantments, including Sharpness and **Lunge**.

---

## 4. Skills & Powers

### Passive: Puncture
- **Jabs** (spears can only attack at full charge) on the same target within **2 seconds** of each other stack **Puncture** (max 3). Each stack adds **+1 damage** to your next jabs on that target. The stacks fall off 2s after your last jab.

### Passive: Skewer
- A spear **charge hit** (a hit landed while you're holding the right-click charge) gives the target **-15% armor** and **Slowness II for 3 seconds**.

### Active Skill: Dragoon Leap & Dive
- **Leap (Sneak + Jump):** launches you about **5 blocks** straight up, with fall damage cancelled until you land.
- **Dive (Sneak held once you stop rising, within 3.5s of the Leap):** keep holding Sneak to dive at the top, or press it again later; you plunge up to 3 blocks a tick; landing deals **6 damage** to everything within **3 blocks** and shoves mobs away.
- **Cooldown:** 12 seconds, starting when you land.

### Downside: Overextended
- Landing a Dive roots you with **Slowness III for 2s**.
- If you Leap and don't Dive, the cooldown still runs.

---

## 5. Technical Implementation (Datapack)

- **Jab vs charge:** every spear attack uses the `minecraft:spear` damage type, so it can't tell them apart. Instead `advancement/dragoon/using.json` (`using_item`) sets `dg_use` while the charge is held, and `dragoon/hit` Skewers when it's set and Punctures otherwise.
- **Puncture:** per target `dg_ps` (stacks), `dg_pt` (40-tick window) and `dg_by` (attacker id from `ecl_pid`); the bonus is dealt on the same tick with `kandy:dragoon_pierce`, which is in `#minecraft:bypasses_cooldown`.
- **Skewer:** `armor` modifier `kandy:skewer` (-15%) for 60 ticks (`dg_sk`).
- **Leap:** the rising edge of Jump while sneaking gives (there's no on-ground check, since the server often sees the jump after you've left the ground) Levitation X for 10 ticks; `dg_st` (70 ticks) is the Dive window.
- **Dive:** Sneak held in the air after the 10 Levitation ticks sets `dg_dive`; `dragoon/dive_step` moves you down 1 block at a time (3 a tick) until the block below isn't passable, then `dragoon/land` runs.
- **Cooldown:** `dg_cd` = 240 ticks from landing.
- **Fall damage:** `fall_damage_multiplier` modifier `kandy:dragoon_fall` until you land.
