# Reaper's Knuckle (Soul Harvest)

> *"A finger bone that keeps count. Every life you take, it gives a little back."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:bone`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "ReapersKnuckle", type: "talisman"}`
- **Display Gradient:** Bone White to Grave Violet (`#f1f1f1` → `#b8b8d1` → `#6c5b7b` → `#355c7d`)
- **Lore Text:**
  ```json
  [
    {"text": "Each kill grants 1 heart of Absorption (stacks to 4 hearts, lasts 30s).", "color": "gray", "italic": false},
    {"text": "Killing a player grants all 4 at once.", "color": "gray", "italic": false},
    {"text": "Death clings to you: Undead deal +1 damage to you.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Grave Core** (shown as `minecraft:skeleton_skull` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Killing a **Skeleton** or **Zombie**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:skeleton_skull`
  - **Sides (N, S, E, W):** 4× `minecraft:bone_block`
  - **Corners:** 4× `minecraft:soul_sand`

### Step 2: Forging at the Smithing Table
- **Template:** `Grave Core`
- **Base Item:** `minecraft:bone`
- **Addition Catalyst:** `minecraft:echo_shard`

---

## 3. Skills & Powers

### Passive: Soul Harvest
- **Trigger:** Killing any living creature (`player_killed_entity`).
- **Mechanic:** Adds **1 heart (2 HP) of Absorption**, stacking up to **4 hearts**, refreshed to 30s on each kill. A player kill grants the full 4 hearts. Soul particles drift from the victim to you.

### Downside
- **Grave Chill:** whenever an undead mob (`#minecraft:undead`) hits you, you take **+1 extra damage**.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"ReapersKnuckle"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Stacks:** an `absorption` amount can't be set directly; track stacks in a score and give `minecraft:absorption 30 <stacks-1>` (Absorption I = 2 hearts, so use a `max_absorption`/`absorption` attribute approach or Absorption levels mapped to stacks).
- **Downside:** `entity_hurt_player` advancement with `source_entity` in `#minecraft:undead` → `damage @s 1 minecraft:generic`.
