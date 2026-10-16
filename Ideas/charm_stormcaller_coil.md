# Stormcaller Coil (Static Charge & Storm Riding)

> *"Wound from copper that was struck nine times in one night. It hums before every storm."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Talisman (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:copper_ingot`
- **Rarity:** `epic`
- **Custom Data:** `{charm: "StormcallerCoil", type: "talisman"}`
- **Display Gradient:** Copper to Storm Blue (`#f4a261` → `#e76f51` → `#4cc9f0` → `#4361ee`)
- **Lore Text:**
  ```json
  [
    {"text": "Sprinting builds Static (0-100%). At 100%, your next charged hit discharges:", "color": "gray", "italic": false},
    {"text": "+4 armor-piercing lightning damage and Slowness II for 1s.", "color": "gray", "italic": false},
    {"text": "Rain and thunder grant Speed I.", "color": "gray", "italic": false},
    {"text": "In a thunderstorm, the sky sometimes answers: you get struck for 3.", "color": "red", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

Following the Kandy Custom Weapons two-step system:

### Step 1: Crafting the Core
- **Item Name:** **Storm Core** (shown as `minecraft:lightning_rod` via `item_model`; the real item is an unobtainable template, like the other cores)
- **Unlock Trigger:** Getting a **Lightning Rod** or being in a **thunderstorm**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:lightning_rod`
  - **Sides (N, S, E, W):** 4× `minecraft:copper_block`
  - **Corners:** 4× `minecraft:redstone`

### Step 2: Forging at the Smithing Table
- **Template:** `Storm Core`
- **Base Item:** `minecraft:copper_ingot`
- **Addition Catalyst:** `minecraft:glowstone_dust`

---

## 3. Skills & Powers

### Passive: Static Build-up
- **Mechanic:** Sprinting fills **Static** by 1% per 0.5 blocks sprinted (about 50 blocks for a full charge). Standing still drains 2% per second.
- At **100%**, your next **fully charged melee hit** with any weapon discharges: the target takes **+4 armor-piercing lightning damage** (`kandy:tempest_lightning`-style damage) and **Slowness II for 1s**. Static resets to 0.
- Shown on the boss bar HUD while carried.

### Passive: Storm Rider
- **Mechanic:** While it's raining or thundering where you stand (`can_see_sky` + weather), you have **Speed I**. Weather is global in a datapack, so this also passes in deserts and cold biomes while it rains elsewhere.

### Downside
- **Lightning Rod:** during a **thunderstorm** with open sky above you, every 30 seconds there's a **20% chance** a bolt finds you: **3 lightning damage**, visual bolt only (no fire, no mob conversion). Indoors or underground you're safe.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Detection:** `holders.mcfunction` tags carriers `kandy.charm.<key>` from `container.*` and `weapon.offhand` using `custom_data~{charm:"StormcallerCoil"}`.
- **Cooldowns:** shown on the per-skill boss bar HUD (`kandy:hud/b/...`) while recharging, like the other charms.
- **Static:** `minecraft.custom:minecraft.sprint_one_cm` stat (like Swiftwind), converted to a 0-100 score.
- **Discharge:** a `player_hurt_entity` advancement gated on `damage.dealt` ≥ 6 (charged hit) and Static 100; damage via the existing `kandy:tempest_lightning` type so it pierces armor.
- **Weather:** `execute if predicate` with `minecraft:weather_check {raining:true}` plus `minecraft:location {can_see_sky:true}`.
- **Downside roll:** `execute store result score #r ... run random value 1..5` every 600 ticks during `{thundering:true}`; on 1, particles + thunder sound + `damage @s 3 kandy:tempest_lightning`.
