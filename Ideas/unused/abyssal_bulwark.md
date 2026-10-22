# Abyssal Bulwark

> *"Forged from deep oceanic trenches and elder guardian carapace. Those who strike this shield find the entire weight of the sea crashing back upon them."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:shield`
- **Rarity:** `epic`
- **Theme:** Ocean Depths, Pressure, Parry, Guard Counter, Tidal Shockwave
- **Custom Data:** `{ability: "Abyssal"}`
- **Display Gradient:** Deep Sea Cyan to Abyssal Navy (`#00f2fe` → `#4facfe` → `#0052d4` → `#1b3a8a`)
- **Lore Text:**
  ```json
  [
    {"text": "Blocking stores Abyssal Pressure (max 5) and brief Resistance.", "color": "gray", "italic": false},
    {"text": "Parry: tap Sneak just before a blocked melee hit to stagger the attacker.", "color": "gray", "italic": false},
    {"text": "Sneak + Jump: Tidal Surge spends all Pressure in a crushing wave.", "color": "aqua", "italic": false},
    {"text": "Heavy: -10% speed while held. Tidal Surge's recoil slows you.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Abyssal Core** (shown as `minecraft:prismarine_shard` via `item_model`; the real item is an unobtainable `minecraft:farmland` template)
- **Unlock Trigger:** Killing an **Elder Guardian** or getting **Dark Prismarine**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:sponge`
  - **Sides (N, S, E, W):** 4× `minecraft:dark_prismarine`
  - **Corners:** 4× `minecraft:prismarine_crystals`

### Step 2: Forging at the Smithing Table
- **Template:** `Abyssal Core`
- **Base Weapon:** `minecraft:shield`
- **Addition Catalyst:** `minecraft:heart_of_the_sea`

---

## 3. Weapon Attributes & Stat Profile

Works in **either hand**, so it pairs with any weapon:
- **Knockback Resistance:** +0.25
- **Armor Toughness:** +2
- **Movement Speed:** -10% (Heavy)
- **Axe disable:** axes disable it for half as long as a normal shield
- **Durability:** Unbreakable (`unbreakable={}`)

---

## 4. Skills & Powers

### Passive: Abyssal Pressure
- Every blocked hit stores **+1 Pressure** (max 5). Pressure fades **10 seconds** after your last block.
- Blocking gives **Resistance I for 3s**, or **Resistance II** at 4+ Pressure.
- Pressure is shown on the boss bar HUD.

### Active Skill 1: Parry
- **Trigger:** Tap **Sneak** just before a blocked melee hit lands. The tap opens a **0.8s** window; a tap that doesn't parry locks new windows for 1s, so spamming doesn't work.
- **Cooldown:** 4 seconds.
- **Mechanic:** The attacker is staggered with **Slowness IV + Weakness II for 2s**, and you gain **+3 Pressure** in total.
- A datapack can't detect raising a shield, so this replaces the original "raise within 0.35s" timing. It staggers rather than fully stunning, and doesn't re-enable a disabled shield.

### Active Skill 2: Tidal Surge (Guard Counter)
- **Trigger:** Press **Jump while sneaking** with at least 1 Pressure.
- **Cooldown:** 8 seconds.
- **Mechanic:**
  - Spends all Pressure in a **~90° wave reaching 7 blocks** ahead.
  - Damage by Pressure: **1–2: 4**, **3–4: 7**, **5: 10**.
  - Everything hit gets **Slowness II and Mining Fatigue II for 4s**. Mobs are shoved along the wave; players get the damage knockback and a brief Levitation.

### Downside: Heavy
- **-10% movement speed** while held in either hand.
- Tidal Surge's recoil gives you **Slowness II for 2s**.

---

## 5. Technical Implementation (Datapack)

- **Blocks:** an `entity_hurt_player` advancement on blocked damage stores Pressure (`bulw_chg`, fade timer `bulw_decay` = 200 ticks).
- **Parry:** a rising edge of Sneak sets `bulw_brace` (16 ticks); a whiffed window sets `bulw_lock` (20 ticks). A blocked melee hit inside the window runs `abyssal/parry` on the attacker (found with `execute on attacker`).
- **Tidal Surge:** Sneak + Jump input (`bulw_snk`, `bulw_jmp`) with Pressure ≥ 1; `bulw_scd` = 160 ticks; damage type `kandy:abyssal_surge`.
- **Cooldowns:** `bulw_pcd` (80-tick Parry), `bulw_scd` (Tidal Surge).
- **Axe disable:** the `blocks_attacks` component sets `disable_cooldown_scale:0.5f`.
- **Attributes:** separate mainhand and offhand modifiers (`kandy:bulwark_*_main` / `_off`) so it works in either hand.
