# Prism Mirror (Projectile Reflection)

> *"A sliver of perfectly flat quartz. Arrows meet their own reflection and remember who sent them."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:quartz`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "PrismMirror", type: "talisman"}`
- **Display Gradient:** Quartz White to Prism Cyan (`#ffffff` → `#e0fbfc` → `#98c1d9` → `#3d5a80`)
- **Lore Text:**
  ```json
  [
    {"text": "Projectiles that hit you reflect 30% of their damage back at the shooter.", "color": "gray", "italic": false},
    {"text": "Every 15s, the next projectile hit on you is negated.", "color": "gray", "italic": false},
    {"text": "Brittle: melee hits against you deal +1 damage.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Prism Core** (shown as `minecraft:glass` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Getting **Nether Quartz**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:glass`
  - **Sides (N, S, E, W):** 4× `minecraft:quartz_block`
  - **Corners:** 4× `minecraft:amethyst_shard`

### Step 2: Forging at the Smithing Table
- **Template:** `Prism Core`
- **Base Item:** `minecraft:quartz`
- **Addition Catalyst:** `minecraft:glass_pane`

---

## 3. Skills & Powers

### Passive: Reflection
- **Trigger:** Being hit by a projectile (arrow, trident, fireball...).
- **Mechanic:** The shooter takes **30% of the damage you took** as magic damage, credited to you. Works on mobs (skeletons) and players, but never reflects your own projectiles.

### Passive: Glancing Facet
- **Mechanic:** Every **15 seconds** the charm is primed; the next projectile that hits you is **healed straight back** (Instant Health I/II/III for 4/8/16 HP, matched to the damage taken) with a glassy chime. Shown on the boss bar while recharging.

### Downside
- **Brittle:** melee hits against you deal **+1 extra damage**.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"PrismMirror"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Detection:** `entity_hurt_player` with `damage.type` tag `#minecraft:is_projectile`, reading `damage.taken`; the shooter via `execute on attacker` (that worked for the Bulwark's parry; `on owner` does not work for projectiles).
- **Reflect amount:** the advancement can't pass the number, so each carrier's health (in tenths) is remembered at the start of the tick and the hit is measured from it.
- **Downside:** `entity_hurt_player` with `is_projectile:false` and a direct entity → `damage @s 1 kandy:prism_mirror_brittle`.
