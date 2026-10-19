# Beastmaster's Whistle (Pet Charm)

> *"Two notes, and every animal that loves you comes running."*

**Status:** Implemented · **PvE-only:** buffs your tamed animals; in PvP your wolves are still just wolves (no bonus damage against players)

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:lead`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "BeastmastersWhistle", type: "talisman"}`
- **Display Gradient:** Forest Moss to Fur Brown (`#d8f3dc` → `#74c69d` → `#a47148` → `#583101`)
- **Lore Text:**
  ```json
  [
    {"text": "Your tamed wolves within 24 blocks: Resistance I, and +3 damage against mobs.", "color": "gray", "italic": false},
    {"text": "Pets out of combat regenerate quickly.", "color": "gray", "italic": false},
    {"text": "Sneak still for 1s: Recall every pet in this dimension to you (60s cooldown).", "color": "gold", "italic": false},
    {"text": "Bonded: when one of your pets dies, Weakness I for 30s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Pack Core** (shown as `minecraft:bone` via `item_model`; real item: an unused spawn egg template such as `minecraft:camel_spawn_egg`)
- **Unlock Trigger:** Taming any animal (`tame_animal`)
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:goat_horn`
  - **Sides (N, S, E, W):** 4× `minecraft:lead`
  - **Corners:** 4× `minecraft:cooked_beef`

### Step 2: Forging at the Smithing Table
- **Template:** `Pack Core`
- **Base Item:** `minecraft:lead`
- **Addition Catalyst:** `minecraft:name_tag`

---

## 3. Skills & Powers

### Passive: Pack Leader
- Your tamed **wolves** within **24 blocks** have **Resistance I**, and deal **+3 damage to mobs** (never to players).
- Your tamed wolves, cats and parrots regenerate **1 HP per second** after 5s without taking damage.

### Active: Recall
- **Trigger:** Sneak without moving for **1 second**.
- **Mechanic:** Every pet you own that's loaded in this dimension (sitting pets included) is teleported next to you, with a whistle sound.
- **Cooldown:** 60 seconds.

### Downside: Bonded
- When one of your pets dies, you get **Weakness I for 30s**.

---

## 4. Technical Implementation Notes (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.beastmasters_whistle`.
- **Ownership:** compare each pet's `Owner` UUID with the carrier's (the projectile-owner pattern), cached once per second.
- **Bonus damage:** advancements only fire for players, so check from the victim's side each tick: a non-player with `HurtTime:10s` whose `execute on attacker` is one of a carrier's tagged wolves takes +3 with a damage type in `#minecraft:bypasses_cooldown` (so it lands despite the hit's invulnerability frames).
- **Recall:** the Wayfarer's Compass stillness check; `tp` each owned pet to the player.
- **Bonded:** a dying owned pet (`Health` ≤ 0 or `DeathTime` > 0 on a tagged pet) triggers the effect on its owner.
- **As built:** pets are wolves, cats and parrots (`#kandy:beastmasters_whistle_pets`). Once a second each carrier's pets get `bst_own` (their owner's id), and wolves within 24 blocks are the pack. The pack's +3 is an `attack_damage` modifier, removed on any tick the wolf's target is a player, instead of a victim-side check. Healing sets `Health` directly. A recall that finds no pets costs no cooldown.
