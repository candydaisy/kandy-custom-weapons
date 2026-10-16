# Berserker Token (Last-stand Frenzy Charm)

> *"Forged from netherite scrap and boiled ghast tears. In death's shadow, it floods your veins with uncontrollable battle adrenaline."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Combat Trigger (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:ghast_tear`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "Berserker", type: "talisman"}`
- **Display Gradient:** Crimson Red to Fiery Gold (`#e74c3c` → `#c0392b` → `#e67e22` → `#f39c12`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried: at 4 hearts or less, enter Battle Frenzy for 8s.", "color": "gray", "italic": false},
    {"text": "Frenzy: Strength I, Speed I, Night Vision. Charged hits heal 2 hearts (3s cooldown).", "color": "gray", "italic": false},
    {"text": "Then an Adrenaline Crash: Slowness and Weakness for 3s. Recharges in 60s.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Frenzy Core** (shown as `minecraft:nether_star` via `item_model`; the real item is an unobtainable `minecraft:test_instance_block` template)
- **Unlock Trigger:** Killing a **Wither**, or dropping to **2 hearts** for the first time
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:wither_skeleton_skull`
  - **Sides (N, S, E, W):** 4× `minecraft:ghast_tear`
  - **Corners:** 4× `minecraft:redstone_block`

### Step 2: Forging at the Smithing Table
- **Template:** `Frenzy Core`
- **Base Item:** `minecraft:ghast_tear`
- **Addition Catalyst:** `minecraft:enchanted_golden_apple`

---

## 3. Skills & Powers

### Passive: Battle Frenzy
- **Trigger:** Your health drops to **8 HP (4 hearts) or less** while the charm is carried and recharged.
- **Effects for 8 seconds:** **Strength I**, **Speed I**, **Night Vision**.
- A heartbeat plays once a second while it lasts, and the Frenzy shows on the boss bar.

### Passive: Vampiric Siphon (Lifesteal)
- During Frenzy, a fully charged, unblocked melee hit heals **2 hearts** (Instant Health I), at most once every **3 seconds**.

### Drawback: Adrenaline Crash
- When the Frenzy runs out: **Slowness I** and **Weakness I** for **3 seconds**. Dying ends the Frenzy without the crash.
- **Cooldown:** 60 seconds from when the Frenzy starts.

---

## 4. Technical Implementation (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.berserker` from `container.*` and `weapon.offhand`.
- **Health:** `bers_hp` (health criterion); the first time anyone reaches 4 HP or less, `recipe give` unlocks the Frenzy Core.
- **Scoreboards:** `bers_fr` (160-tick Frenzy), `bers_cd` (1200-tick cooldown), `bers_ls` (60-tick lifesteal cooldown), `bers_death`.
- **Lifesteal:** a charged-hit advancement reward, healing only during Frenzy.
