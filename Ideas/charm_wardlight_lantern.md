# Wardlight Lantern (Monster Ward Charm)

> *"Its flame was lit from a church candle. Nothing that crawls out of the dark wants to be near it."*

**Status:** Proposed (not implemented) · **PvE-only:** affects hostile mobs only

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:soul_lantern`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "WardlightLantern", type: "talisman"}`
- **Display Gradient:** Soul Cyan to Candle Gold (`#e0fbfc` → `#80ffdb` → `#ffd166` → `#b08968`)
- **Lore Text:**
  ```json
  [
    {"text": "Hostile mobs can't spawn within 16 blocks of you.", "color": "gray", "italic": false},
    {"text": "Undead within 6 blocks burn in the light: 1 damage every 2s.", "color": "gray", "italic": false},
    {"text": "Its glare drowns your sight: Night Vision has no effect on you.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Ward Core** (shown as `minecraft:soul_lantern` via `item_model`; real item: an unused spawn egg template such as `minecraft:sniffer_spawn_egg`)
- **Unlock Trigger:** Killing a **Zombie Villager**, or curing one
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:soul_lantern`
  - **Sides (N, S, E, W):** 4× `minecraft:candle`
  - **Corners:** 4× `minecraft:gold_ingot`

### Step 2: Forging at the Smithing Table
- **Template:** `Ward Core`
- **Base Item:** `minecraft:soul_lantern`
- **Addition Catalyst:** `minecraft:golden_apple`

---

## 3. Skills & Powers

### Passive: Hallowed Ground
- **Natural spawns** of hostile mobs within **16 blocks** are removed the tick they appear (no drops, no XP). Spawners, raids, trial chambers and summoned mobs are unaffected, so mob farms built on spawners still work.

### Passive: Searing Light
- **Undead** mobs within **6 blocks** take **1 damage every 2 seconds** and get Glowing while in range.

### Downside: Glare
- While carried, **Night Vision** is cleared from you. It conflicts with the Deepdelver Lamp, the Moonlit Pendant and Night Vision potions, so you have to choose which to carry.

---

## 4. Technical Implementation Notes (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.wardlight_lantern`.
- **Spawn suppression:** each tick, hostile mobs (`#kandy:hostile`) within 16 blocks of a carrier that don't have the `kandy.seen` tag yet are checked once, then tagged. A datapack can't read how a mob spawned, so the check excludes mobs with `PersistenceRequired:1b` (named or summoned with it), raid mobs (raid data on the entity), and mobs within 5 blocks of a `spawner` or `trial_spawner` block. The rest are removed with `tp ~ -1000 ~` then `kill`, so nothing drops. The spawner check is the expensive part; test it on a busy server.
- **Searing Light:** every 40 ticks, `damage @e[type=#minecraft:undead,distance=..6] 1 minecraft:magic`.
- **Glare:** `effect clear @s minecraft:night_vision` each tick for carriers.
