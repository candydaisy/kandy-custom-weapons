# Rimeheart (Cold Immunity & Frost Path)

> *"A shard of the deep glacier's heart. Winter doesn't bite those who carry it."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:prismarine_crystals`
- **Rarity:** `rare`
- **Custom Data:** `{charm: "Rimeheart", type: "talisman"}`
- **Display Gradient:** Frost White to Glacier Blue (`#f8f9fa` → `#caf0f8` → `#90e0ef` → `#0077b6`)
- **Lore Text:**
  ```json
  [
    {"text": "Immune to freezing: powder snow and freezing can't hurt you.", "color": "gray", "italic": false},
    {"text": "Sneaking on water turns it to frosted ice beneath you.", "color": "gray", "italic": false},
    {"text": "Heat saps you: in the Nether, Slowness I.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Rime Core** (shown as `minecraft:blue_ice` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Getting **Blue Ice** or **Powder Snow**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:blue_ice`
  - **Sides (N, S, E, W):** 4× `minecraft:packed_ice`
  - **Corners:** 4× `minecraft:snowball`

### Step 2: Forging at the Smithing Table
- **Template:** `Rime Core`
- **Base Item:** `minecraft:prismarine_crystals`
- **Addition Catalyst:** `minecraft:powder_snow_bucket`

---

## 3. Skills & Powers

### Passive: Frostborn
- **Mechanic:** You take **no freeze damage**, from powder snow or from the Frostveil Scythe's chill.

### Passive: Frost Path
- **Trigger:** Sneaking while standing on still water.
- **Mechanic:** Still water in a **2-block radius** under you turns into **frosted ice**, which melts back on its own like Frost Walker.

### Downside
- **Heat-sick:** in the **Nether**, **Slowness I** while carried.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"Rimeheart"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD while recharging, like the other charms.
- **Frostborn:** players' freeze ticks can't be edited by command, so detect freeze damage with an `entity_hurt_player` advancement on `#minecraft:is_freezing` and heal it straight back (Instant Health for big hits, a short Regeneration for small ones). Walking on powder snow needs leather boots in vanilla and can't be granted by a datapack.
- **Frost Path:** `fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:frosted_ice replace minecraft:water[level=0]` while sneaking (vanilla frosted ice melts back by itself, so nothing is griefed).
