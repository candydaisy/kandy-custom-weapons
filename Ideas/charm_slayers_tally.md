# Slayer's Tally (Monster Hunter Charm)

> *"Every notch is a kind of monster that learned to fear you. The tally doesn't forgive forgetting."*

**Status:** Implemented · **PvE-only:** bonus damage against mobs only

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:paper`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "SlayersTally", type: "talisman"}`
- **Display Gradient:** Parchment to Dried Blood (`#f5ebe0` → `#d5bdaf` → `#a4161a` → `#660708`)
- **Lore Text:**
  ```json
  [
    {"text": "Each kill of a hostile mob notches its kind: +2% damage against that kind.", "color": "gray", "italic": false},
    {"text": "Up to +30% per kind (15 kills). Never applies to players.", "color": "gray", "italic": false},
    {"text": "Dying wipes the tally clean.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Tally Core** (shown as `minecraft:writable_book` via `item_model`; real item: an unused spawn egg template such as `minecraft:armadillo_spawn_egg`)
- **Unlock Trigger:** Getting the **Monster Hunter** advancement (kill any hostile mob)
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:writable_book`
  - **Sides (N, S, E, W):** 4× `minecraft:bone`
  - **Corners:** 4× `minecraft:iron_ingot`

### Step 2: Forging at the Smithing Table
- **Template:** `Tally Core`
- **Base Item:** `minecraft:paper`
- **Addition Catalyst:** `minecraft:ink_sac`

---

## 3. Skills & Powers

### Passive: Notches
- Killing a hostile mob adds a notch for its kind: zombie family, skeleton family, spider family, creeper, enderman, blaze, piglin family, illager family, slime/magma cube, and "other hostile".
- Each notch gives **+2% melee and projectile damage against that kind**, up to **+30%** (15 notches).
- The current kind's tally shows on the boss bar while you fight it.

### Downside: Clean Slate
- **Dying resets every tally to 0.**

---

## 4. Technical Implementation Notes (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.slayers_tally`.
- **Kills:** one `player_killed_entity` advancement per kind (entity type tags `kandy:tally_<kind>`), each adding to a `tally_<kind>` score.
- **Bonus damage:** a `player_hurt_entity` advancement per kind runs extra damage on the same tick with a custom type in `#minecraft:bypasses_cooldown` (Predator's Fang's pattern): `damage dealt × notches × 2%`, read from the advancement tier (e.g. dealt 1-4, 5-8, 9+) since the exact number isn't passed. Guard against our own bonus damage counting as a hit.
- **Reset:** a `deathCount` score clears the tallies.
- **As built:** one `player_killed_entity` and one `player_hurt_entity` advancement. The hit advancement has four criteria by damage band (under 4, 4-8, 8-12, 12+, counted as 2.5 / 6 / 10 / 14), and the reward checks which one fired. Hits from the pack's own bonus damage (anything in `#minecraft:bypasses_cooldown`) don't count. Kinds: zombies (`#minecraft:zombies`), skeletons (`#minecraft:skeletons`), spiders, creepers, endermen, blazes, piglins (with hoglins), illagers (all raiders and vexes), slimes and magma cubes, then any other `#kandy:monsters`. Victims are found within 12 blocks, so very long bow shots don't get the bonus.
