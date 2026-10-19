# Angler's Lure (Fishing Charm)

> *"A hand-tied fly that's caught more fish than its maker ever did."*

**Status:** Implemented · **PvE-only:** does nothing in combat

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:lily_pad`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "AnglersLure", type: "talisman"}`
- **Display Gradient:** Pond Green to River Blue (`#c7f9cc` → `#57cc99` → `#38a3a5` → `#22577a`)
- **Lore Text:**
  ```json
  [
    {"text": "Holding a fishing rod: Luck II (better treasure rolls).", "color": "gray", "italic": false},
    {"text": "Each catch has a 20% chance to bring up a second catch.", "color": "gray", "italic": false},
    {"text": "Reeling in restores 1 hunger point.", "color": "gray", "italic": false},
    {"text": "Patience has a price: Slowness I while holding a fishing rod.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Tackle Core** (shown as `minecraft:fishing_rod` via `item_model`; real item: an unused spawn egg template such as `minecraft:cow_spawn_egg`)
- **Unlock Trigger:** Catching any fish (`fishing_rod_hooked`)
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:fishing_rod`
  - **Sides (N, S, E, W):** 4× `minecraft:string`
  - **Corners:** 4× `minecraft:lily_pad`

### Step 2: Forging at the Smithing Table
- **Template:** `Tackle Core`
- **Base Item:** `minecraft:lily_pad`
- **Addition Catalyst:** `minecraft:tropical_fish`

---

## 3. Skills & Powers

### Passive: Lucky Waters
- While you **hold a fishing rod**, you have **Luck II**, which improves fishing treasure rolls the same way Luck of the Sea does. It stacks with the enchantment.

### Passive: Double Catch
- Every successful catch has a **20% chance** to drop a **second roll** of the fishing loot table at your feet.

### Passive: Shore Lunch
- Each catch restores **1 hunger point**.

### Downside: Patience
- **Slowness I** while holding a fishing rod.

---

## 4. Technical Implementation Notes (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.anglers_lure` from `container.*` and `weapon.offhand`.
- **Catch:** a `fishing_rod_hooked` advancement (item caught, not an entity hooked).
- **Second roll:** `loot spawn ~ ~ ~ fish minecraft:gameplay/fishing ~ ~ ~ mainhand` after a `random value 1..5` roll, so the rod's own Luck of the Sea and the Luck effect apply.
- **Hunger:** `effect give @s minecraft:saturation 1 0 true` (one tick of Saturation I ≈ +1 food).
- **As built:** Luck II and Slowness I are attribute modifiers (`kandy:angler_luck` +2 luck, `kandy:angler_patience` -15% speed) added while a rod is in either hand, so they end the moment you put the rod away. The second catch rolls `gameplay/fishing` at your feet with the rod's hand as the tool; treasure needs the bobber in open water, so the bonus roll only gives fish and junk.
