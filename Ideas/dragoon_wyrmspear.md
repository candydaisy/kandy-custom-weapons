# Dragoon's Wyrmspear

> *"Tipped with a scale the dragon left behind. It wants to be thrown at the sky and brought back down."*

**Status:** Proposed (not implemented)

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
    {"text": "Sneak + Jump: Dragoon Leap. Attack while falling to Dive (12s cooldown).", "color": "gold", "italic": false},
    {"text": "A Dive leaves you rooted: Slowness III for 1.5s.", "color": "red", "italic": false}
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

- **Attack Damage:** vanilla netherite spear **+1**
- **Attack Speed / Reach:** vanilla netherite spear (spears already out-reach swords)
- **Durability:** Unbreakable (`unbreakable={}`)
- Keeps spear enchantments, including Sharpness and **Lunge**.

---

## 4. Skills & Powers

### Passive: Puncture
- Fully charged **jabs** on the same target within **2 seconds** of each other stack **Puncture** (max 3). Each stack adds **+1 damage** to your next jabs on that target. The stacks fall off 2s after your last jab.

### Passive: Skewer
- A spear **charge hit** (the held-attack that deals `minecraft:spear` damage) gives the target **-15% armor** and **Slowness II for 3 seconds**.

### Active Skill: Dragoon Leap & Dive
- **Leap (Sneak + Jump):** launches you about **6 blocks** straight up, with fall damage cancelled until you land.
- **Dive (attack while falling after a Leap, within 3s):** you plunge straight down; landing deals **6 damage** to everything within **3 blocks** and knocks them away. Hitting a creature mid-dive also counts as a charged jab.
- **Cooldown:** 12 seconds, starting when you land.

### Downside: Overextended
- Landing a Dive roots you with **Slowness III for 1.5s**.
- If you Leap and don't Dive, the cooldown still runs.

---

## 5. Technical Implementation Notes (Datapack)

- **Jab vs charge:** a `player_hurt_entity` advancement filtered on damage type `minecraft:spear` catches charge hits; a second one excluding it catches charged jabs. Check in game which damage type a jab uses before relying on this.
- **Leap:** Sneak + Jump input (Abyssal Bulwark's Tidal Surge pattern), then Levitation for a few ticks or `tp` steps up while there's head room.
- **Dive:** while airborne after a Leap, an attack (or the jab advancement) starts a fast downward `tp` step loop until the ground; the landing runs the area damage (a custom damage type in `#minecraft:bypasses_cooldown`).
- **Armor shred:** an `armor` modifier `kandy:skewer` (-15%) with a 60-tick timer, like Pyroclast's Melt Armor.
- **Scoreboards:** Puncture stacks and a 40-tick window per target; Leap/Dive state and a 240-tick cooldown per player.
