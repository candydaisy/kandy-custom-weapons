# Oathbound Warhorn

> *"Carved from the horn of a ram that led a hundred charges. Everyone who hears it remembers why they came."*

**Status:** Implemented

---

## 1. Overview & Identity

- **Base Item:** `minecraft:goat_horn` (works in either hand, so it pairs with any weapon)
- **Rarity:** `epic`
- **Role:** **Support / Buffer**
- **Theme:** War Cries, Rallying, Banners, Group Fights
- **Custom Data:** `{ability: "Warhorn"}`
- **Display Gradient:** Bone Ivory to Battle Crimson (`#f8f1e5` → `#e9c46a` → `#e76f51` → `#9b2226`)
- **Lore Text:**
  ```json
  [
    {"text": "Blow: War Cry. You and your team within 16 blocks get Strength III and Speed III for 10s.", "color": "gray", "italic": false},
    {"text": "Sneak + blow: Rally. You and your team are cleansed and get Resistance III for 10s.", "color": "gold", "italic": false},
    {"text": "90s cooldown, shared by both calls. Works from either hand.", "color": "gray", "italic": false},
    {"text": "Team: /trigger kandy_team set <number>. Only your team is helped.", "color": "dark_aqua", "italic": false},
    {"text": "The horn carries: monsters within 24 blocks speed up and you glow for 8s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Oath Core** (shown as `minecraft:white_banner` via `item_model`; real item: an unused spawn egg template such as `minecraft:goat_spawn_egg`)
- **Unlock Trigger:** Getting a **Goat Horn**, or winning a **Raid** (Hero of the Village)
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:bell`
  - **Sides (N, S, E, W):** 4× `minecraft:white_banner`
  - **Corners:** 4× `minecraft:gold_ingot`

### Step 2: Forging at the Smithing Table
- **Template:** `Oath Core`
- **Base Item:** `minecraft:goat_horn`
- **Addition Catalyst:** `minecraft:totem_of_undying`

---

## 3. Stat Profile

- No attack stats; it's a support tool you carry next to your weapon.
- A `use_cooldown` component gives it a **90s** cooldown overlay in the hotbar.

---

## 4. Skills & Powers

**Allies:** your teammates in range. Players join a team with `/trigger kandy_team set <number>` (same number, same team) and leave with `set -1`; with no team, the horn only affects you.

### Active Skill 1: War Cry
- **Trigger:** Blow the horn (right-click).
- **Mechanic:** You and teammates within **16 blocks** get **Strength III** and **Speed III** for **10 seconds**. 

### Active Skill 2: Rally
- **Trigger:** Blow the horn while **sneaking**.
- **Mechanic:** You and teammates within **16 blocks** are cleansed of **Slowness, Weakness, Poison, Mining Fatigue and Darkness**, and get **Resistance III for 10 seconds**. Hostile mobs within 6 blocks of you are knocked back a few blocks. The pack's own weapon drawbacks (Blood Pact, World Breaker, Overheat) are left alone, like the Alchemist Catalyst does.

### Downside: The Horn Carries
- After either call, hostile mobs within **24 blocks** get **Speed I for 8s**, and **you glow for 8s**.

---

## 5. Technical Implementation (Datapack)

- **Use detection:** the `minecraft.used:minecraft.goat_horn` statistic (`wh_used`); `warhorn/blow` only answers if a Warhorn is in either hand (`kandy.hold.warhorn`).
- **Cooldown:** `wh_cd` = 1800 ticks is the real gate. The item also carries `use_cooldown={seconds:90,cooldown_group:"kandy:warhorn"}` for the hotbar overlay, though the horn's own shorter cooldown may show instead.
- **Sound:** `instrument="minecraft:call_goat_horn"`.
- **Rally cleanse:** leaves Blood Pact, World Breaker and Pyroclast Overheat drawbacks alone, like the Alchemist Catalyst.
- **Monsters:** the entity tag `kandy:monsters`.
- **Teams:** `team/tag_allies` tags players with the same `kt_id` (set by the `kandy_team` trigger).
