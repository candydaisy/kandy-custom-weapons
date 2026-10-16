# Merchant's Sigil (Trade & Fortune)

> *"Pressed with the seal of a guild no one remembers. Villagers still bow to it. Illagers still hunt it."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:emerald`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "MerchantSigil", type: "talisman"}`
- **Display Gradient:** Mint Green to Guild Gold (`#b8f2c4` → `#2ecc71` → `#d4ac0d` → `#9a7d0a`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried: Hero of the Village I (better trades) and Luck I.", "color": "gray", "italic": false},
    {"text": "Villagers you trade with throw in a little extra XP.", "color": "gray", "italic": false},
    {"text": "Illagers can smell the coin: they move faster near you.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Guild Core** (shown as `minecraft:emerald_block` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Trading with a villager (`minecraft:villager_trade`)
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:emerald_block`
  - **Sides (N, S, E, W):** 4× `minecraft:gold_ingot`
  - **Corners:** 4× `minecraft:book`

### Step 2: Forging at the Smithing Table
- **Template:** `Guild Core`
- **Base Item:** `minecraft:emerald`
- **Addition Catalyst:** `minecraft:bell`

---

## 3. Skills & Powers

### Passive: Guild Favor
- **Mechanic:** While carried, you have **Hero of the Village I** (vanilla trade discounts) and **Luck I** (better loot-table rolls such as fishing).
- Refreshed every few seconds with hidden particles, so it never conflicts with a real raid reward (a stronger level from a raid is kept).

### Passive: Haggler's Bonus
- **Trigger:** Completing a villager trade (`minecraft:villager_trade` advancement).
- **Mechanic:** Drops **3 extra XP** at the villager. Limited to once every 5 seconds so mass-trading isn't an XP farm.

### Downside
- **Marked Purse:** illagers (`#minecraft:illager` and raid members) within **16 blocks** of you get **Speed I**, refreshed while you're nearby. Raids and woodland mansions get noticeably harder while you carry it.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"MerchantSigil"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD (`kandy:hud/b/...`) while recharging, like the other charms.
- **Effects:** `effect give @a[tag=kandy.charm.merchant] minecraft:hero_of_the_village 6 0 true` only when the player doesn't already have a higher level (`minecraft:effects` predicate).
- **Haggle:** `villager_trade` advancement reward → `experience add @s 3 points`, gated by a 100-tick cooldown score.
- **Downside:** `execute at @a[tag=kandy.charm.merchant] run effect give @e[type=#minecraft:illager,distance=..16] minecraft:speed 2 0 true` (also pillagers/ravagers via a `kandy:raiders` entity tag).
