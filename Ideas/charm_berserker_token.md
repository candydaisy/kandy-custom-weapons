# Berserker Token (Combat Effect Preset Charm)

> *"Forged from netherite scrap and boiled ghast tears. In death's shadow, it floods your veins with uncontrollable battle adrenaline."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Combat Trigger (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:ghast_tear` (or `minecraft:netherite_scrap`)
- **Rarity:** `epic`
- **Custom Data:** `{charm: "Berserker", type: "talisman"}`
- **Display Gradient:** Crimson Red to Fiery Gold (`#e74c3c` → `#c0392b` → `#e67e22` → `#f39c12`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried in inventory: Triggers Battle Frenzy preset when HP drops ≤40%.", "color": "gray", "italic": false},
    {"text": "Frenzy Preset: Strength II, Speed II, Haste II, Resistance I for 12s.", "color": "gray", "italic": false},
    {"text": "Lifesteal: Melee hits during Frenzy heal 1.5 hearts.", "color": "gray", "italic": false},
    {"text": "Exhaustion: 45s cooldown after Frenzy expires.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Frenzy Core** (`minecraft:nether_star[custom_data={core:"frenzy"}]`)
- **Unlock Trigger:** Defeating a **Wither** or reaching **≤2 Hearts** in combat
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:wither_skeleton_skull`
  - **Sides (N, S, E, W):** 4× `minecraft:ghast_tear`
  - **Corners:** 4× `minecraft:redstone_block`

### Step 2: Forging at the Smithing Table
- **Template:** `Frenzy Core`
- **Base Item:** `minecraft:ghast_tear` (or `minecraft:netherite_scrap`)
- **Addition Catalyst:** `minecraft:enchanted_golden_apple`

---

## 3. Skills & Powers

### Passive: Battle Frenzy (Combat Preset)
- **Description:** When the carrier's health drops below **40% (4 hearts or 8 HP)**, the charm surges with primal fury.
- **Preset Effects Granted:**
  - **Strength II** (12 seconds) — +6 attack damage.
  - **Speed II** (12 seconds) — +40% sprint speed.
  - **Haste II** (12 seconds) — +40% attack recovery and swing speed.
  - **Resistance I** (12 seconds) — 20% incoming damage reduction.
  - **Night Vision** (12 seconds) — Flawless combat clarity.
- **Audio / Visuals:**
  - Heartbeat sound `entity.warden.heartbeat` accelerates.
  - Crimson aura particles (`angry_villager` and `dust{color:[255, 0, 50]}`) envelop the player.
  - Roaring sound effect `entity.ender_dragon.growl` pitched down.

### Passive: Vampiric Siphon (Lifesteal)
- **Description:** While in the active Frenzy state, melee violence replenishes the player's lifeforce.
- **Mechanic:**
  - Every melee strike against a hostile mob or player restores **3.0 HP (1.5 hearts)** and grants 2 hunger points.
  - Healing displays floating red heart particles (`heart`).

### Drawback / Cooldown: Battle Fatigue
- **Cooldown:** 45.0 seconds.
- **Mechanic:**
  - Once the 12 seconds of Frenzy end, the adrenaline crashes.
  - Applies **Slowness I** and **Weakness I** for 3.0 seconds ("Adrenaline Crash") before returning to normal state.
  - A subtle timer is shown on the actionbar during cooldown.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Tagging:**
  In `data/kandy/function/holders.mcfunction`:
  ```mcfunction
  tag @a remove kandy.charm.berserker
  execute as @a if items entity @s container.* *[custom_data~{charm:"Berserker"}] run tag @s add kandy.charm.berserker
  execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Berserker"}] run tag @s add kandy.charm.berserker
  ```
- **Health Check & Cooldown Timer:**
  - Scoreboard: `kandy.berserker_cd`
  - In tick loop:
  ```mcfunction
  # Decrement cooldown
  execute as @a[scores={kandy.berserker_cd=1..}] run scoreboard players remove @s kandy.berserker_cd 1

  # Trigger when low HP and ready
  execute as @a[tag=kandy.charm.berserker,scores={kandy.berserker_cd=0}] if entity @s[predicate=kandy:health_low] run function kandy:charms/berserker_trigger
  ```
- **Preset Trigger Function (`berserker_trigger.mcfunction`):**
  ```mcfunction
  scoreboard players set @s kandy.berserker_cd 900
  tag @s add kandy.frenzy_active
  effect give @s minecraft:strength 12 1 true
  effect give @s minecraft:speed 12 1 true
  effect give @s minecraft:haste 12 1 true
  effect give @s minecraft:resistance 12 0 true
  effect give @s minecraft:night_vision 12 0 true
  playsound entity.warden.roar player @a ~ ~ ~ 1.5 1.2
  ```
