# Molten Core (Fire Immunity & Nether Survival Charm)

> *"A pulsating seed of living magma. It consumes external flames, converting deadly heat into surging stamina."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:magma_cream`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "MoltenCore", type: "talisman"}`
- **Display Gradient:** Solar Flame Yellow to Magma Red (`#ffe259` → `#ffa751` → `#ff416c` → `#8a0000`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried: Fire Resistance. In lava: Speed II and slow Regeneration.", "color": "gray", "italic": false},
    {"text": "Melee attackers burn for 2 damage and catch fire (1s cooldown).", "color": "gray", "italic": false},
    {"text": "Cinder Ward: fireballs nearby fizzle out, flaming arrows are snuffed.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Ignis Core** (shown as `minecraft:blaze_powder` via `item_model`; the real item is a `minecraft:spawner` template, which can be placed in survival but never drops a usable template)
- **Unlock Trigger:** Entering the **Nether** or getting a **Blaze Rod**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:blaze_rod`
  - **Sides (N, S, E, W):** 4× `minecraft:magma_block`
  - **Corners:** 4× `minecraft:nether_brick`

### Step 2: Forging at the Smithing Table
- **Template:** `Ignis Core`
- **Base Item:** `minecraft:magma_cream`
- **Addition Catalyst:** `minecraft:lava_bucket`

---

## 3. Skills & Powers

### Passive: Thermal Immunity
- **Fire Resistance** while carried, which covers fire, magma blocks and lava.

### Passive: Thermal Surge
- **In lava:** **Speed II** and a slow **Regeneration I** (only reapplied once it runs out, since refreshing it every tick would stop it from ever healing).

### Passive: Molten Retaliation
- **Trigger:** A creature hits you in melee.
- **Mechanic:** The attacker takes **2 fire damage** and catches fire for 4s. Players can't be set on fire by commands, so they only take the damage.
- **Cooldown:** 1 second. Another carrier's retaliation doesn't bounce back.

### Passive: Cinder Ward
- Fireballs within **3 blocks** fizzle out, and flaming arrows are extinguished (not deleted). Your own flaming arrows are left alone.

---

## 4. Technical Implementation (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.molten_core` from `container.*` and `weapon.offhand`.
- **Retaliation:** an `entity_hurt_player` advancement for melee hits → `molten_core/retaliate` on the attacker (`execute on attacker`); damage type `kandy:molten_core_burn` (in `#minecraft:is_fire`); cooldown `molt_cd` (20 ticks).
- **Regeneration check:** predicate `kandy:molten_core_has_regen`.
