# Plunderer's Coin (Mob Loot Charm)

> *"Stamped with no king's face. It only ever pays the one who takes."*

**Status:** Implemented · **PvE-only:** works on mob kills, never on players

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:gold_nugget`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "PlunderersCoin", type: "talisman"}`
- **Display Gradient:** Bright Gold to Tarnished Bronze (`#fff1a8` → `#ffd166` → `#c9a227` → `#7f5539`)
- **Lore Text:**
  ```json
  [
    {"text": "Mobs you kill have a 25% chance to drop their loot twice.", "color": "gray", "italic": false},
    {"text": "Mobs you kill drop 50% more experience.", "color": "gray", "italic": false},
    {"text": "Greed is hungry: every mob kill costs 1 hunger point.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Coin Core** (shown as `minecraft:raw_gold` via `item_model`; real item: an unused spawn egg template such as `minecraft:fox_spawn_egg`)
- **Unlock Trigger:** Looting any **Buried Treasure** or **Bastion** chest
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:gold_block`
  - **Sides (N, S, E, W):** 4× `minecraft:emerald`
  - **Corners:** 4× `minecraft:gold_nugget`

### Step 2: Forging at the Smithing Table
- **Template:** `Coin Core`
- **Base Item:** `minecraft:gold_nugget`
- **Addition Catalyst:** `minecraft:rabbit_foot`

---

## 3. Skills & Powers

### Passive: Double Plunder
- When you kill a **mob** (never a player), there's a **25% chance** its loot table drops a second time. Your weapon's Looting applies to both rolls.
- Bosses (Ender Dragon, Wither, Elder Guardian, Warden) are excluded so their unique drops stay unique.

### Passive: Spoils
- Mobs you kill drop **+50% experience**.

### Downside: Greed
- Each mob kill costs **1 hunger point**.

---

## 4. Technical Implementation Notes (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.plunderers_coin`.
- **Kills:** a `player_killed_entity` advancement with `type` not `minecraft:player` and not in a `kandy:bosses` tag.
- **Second roll:** `loot spawn ~ ~ ~ kill @s` run as the dying mob in the reward (it still exists on its death tick). Check this in game, since some mob loot depends on how it died.
- **Experience:** summon an `experience_orb` worth half the mob's base XP (a small per-type lookup), since the actual dropped amount can't be read.
- **As built:** kills are found with `util/tag_kills` (creatures at 0 health on their death tick whose attacker is you). The second roll runs `loot spawn ~ ~ ~ kill` as you, so Looting counts. Spoils are an orb worth 10 (Ravager, Piglin Brute), 5 (Blaze, Guardian, Evoker, Breeze), 3 (other monsters) or 1 (animals); villagers and golems give none. Greed is 4 exhaustion per kill through a 1s Hunger effect, which takes saturation first, like normal hunger.
