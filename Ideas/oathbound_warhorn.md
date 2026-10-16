# Oathbound Warhorn

> *"Carved from the horn of a ram that led a hundred charges. Everyone who hears it remembers why they came."*

**Status:** Proposed (not implemented)

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
    {"text": "Blow: War Cry. Allies within 16 blocks get Strength I and Speed I for 8s.", "color": "gray", "italic": false},
    {"text": "Sneak + blow: Rally. Allies are cleansed and get Resistance I for 6s.", "color": "gold", "italic": false},
    {"text": "45s cooldown, shared by both calls.", "color": "gray", "italic": false},
    {"text": "The horn carries: monsters within 24 blocks get Speed I and you glow for 8s.", "color": "red", "italic": false}
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
- A `use_cooldown` component gives it a visible **45s** cooldown overlay in the hotbar.

---

## 4. Skills & Powers

**Allies:** other players on your scoreboard team, plus your tamed wolves and the iron golems you built. If you're not on a team, every other player counts (put allies on a team for PvP).

### Active Skill 1: War Cry
- **Trigger:** Blow the horn (right-click).
- **Mechanic:** Allies within **16 blocks** get **Strength I** and **Speed I** for **8 seconds**. You get them too, but only for **4 seconds**, so the horn is strongest for a group.

### Active Skill 2: Rally
- **Trigger:** Blow the horn while **sneaking**.
- **Mechanic:** Allies within **16 blocks** (you included) are cleansed of **Slowness, Weakness, Poison, Mining Fatigue and Darkness**, and get **Resistance I for 6 seconds**. Hostile mobs within 6 blocks of you are knocked back a few blocks. The pack's own weapon drawbacks (Blood Pact, World Breaker, Overheat) are left alone, like the Alchemist Catalyst does.

### Downside: The Horn Carries
- After either call, hostile mobs within **24 blocks** get **Speed I for 8s**, and **you glow for 8s**.

---

## 5. Technical Implementation Notes (Datapack)

- **Use detection:** the `minecraft.used:minecraft.goat_horn` statistic, checked against the held horn's custom data in either hand.
- **Cooldown:** `use_cooldown={seconds:45,cooldown_group:"kandy:warhorn"}`, so the game itself blocks spamming and draws the overlay; a matching score drives the boss bar.
- **Sound:** a custom `instrument` (or `minecraft:call_goat_horn`) so it sounds different from a plain horn.
- **Allies:** the same team macro as the Lifebloom Staff; pets via an `Owner` UUID compare, golems via `PlayerCreated:1b`.
