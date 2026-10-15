# Decay Dart (Anti-Healing & Shield Piercing Utility)

> *"Forged with necro-venom from ancient fossilized thorns. Cuts clean through raised shields and inflicts necrotic fever that stops flesh from mending."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:spectral_arrow` (or `minecraft:arrow`)
- **Rarity:** `epic`
- **Category:** Combat Debuff & Anti-Heal PvP Utility
- **Custom Data:** `{utility: "DecayDart", type: "pvp"}`
- **Display Gradient:** Putrid Green to Necrotic Black (`#27ae60` → `#16a085` → `#2c3e50` → `#111111`)
- **Lore Text:**
  ```json
  [
    {"text": "Fired from bow/crossbow or thrown: Pierces clean through raised shields.", "color": "gray", "italic": false},
    {"text": "Necrosis (Anti-Heal): Completely prevents all HP regeneration for 6 seconds.", "color": "gray", "italic": false},
    {"text": "Nullifies Golden Apple, Potion, and Saturation natural healing.", "color": "gray", "italic": false},
    {"text": "Totem Diminisher: If target pops a Totem during Necrosis, bonus HP is reduced by 50%.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Necro Core** (`minecraft:fermented_spider_eye[custom_data={core:"necro"}]`)
- **Unlock Trigger:** Brewing a **Potion of Harming** or collecting a **Poisonous Potato**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:fermented_spider_eye`
  - **Sides (N, S, E, W):** 4× `minecraft:poisonous_potato`
  - **Corners:** 4× `minecraft:nether_wart`

### Step 2: Forging at the Smithing Table
- **Template:** **Necro Core**
- **Base Tool:** `minecraft:spectral_arrow`
- **Addition Catalyst:** `minecraft:spider_eye`
- **Yield:** 8× Decay Darts

---

## 3. Skills & Powers

### Passive 1: Shield Phasing (Unblockable Strike)
- **Description:** Designed specifically to punish players hiding behind raised shields.
- **Mechanic:**
  - When fired from a Bow or Crossbow, the dart phases directly through shield collision boxes.
  - Deals **5 piercing damage** directly to the player behind the shield without bouncing or deflecting.
  - Disables the target's shield for **3.0 seconds**.

### Passive 2: Necrosis (Anti-Healing Affliction)
- **Description:** Shuts down the opponent's sustained recovery.
- **Duration:** 6.0 seconds.
- **Mechanic:**
  - Shuts down **all forms of health gain**:
    - **Instant Health potions** deal 0 healing.
    - **Regeneration effect** tick healing is completely nullified.
    - **Saturation natural healing** from food is paused.
    - **Golden Apple absorption** hearts are halved.
  - Struck target emits sickly putrid skull particles (`witch`, `dust{color:[50, 150, 50]}`).

### Passive 3: Totem Diminisher (Execution Advantage)
- **Description:** Prevents free second chances.
- **Mechanic:**
  - If a player pops a **Totem of Undying** while afflicted with Necrosis:
    - The Totem still prevents fatal death, but grants only **Absorption I** (instead of Absorption II) and 0 Regeneration.
    - Ensures the executing attacker can easily finish the duel.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Projectile Tagging:**
  - Tag arrow when shot: `tag @e[type=spectral_arrow,tag=!kandy.processed] add kandy.decay_dart`.
- **Shield Bypass & Hit Advancement:**
  - Detect hit on blocking player via `player_hurt_entity` advancement with `damage_bypasses_shield: true`.
- **Anti-Heal Tick Loop (`anti_heal_tick.mcfunction`):**
  For players with `tag=kandy.necrosis`:
  ```mcfunction
  # Continuously clear positive regeneration
  effect clear @s minecraft:regeneration
  
  # Freeze health recovery by clamping damage or tracking health diff
  execute as @a[tag=kandy.necrosis] run function kandy:pvp/suppress_heal
  
  # Particle indicator
  particle entity_effect{color:[0.2, 0.8, 0.2]} ~ ~1 ~ 0.3 0.5 0.3 0.1 2
  ```
- **Countdown Timer:**
  Decrements `kandy.necrosis_timer` by 1 per tick; removes tag after 120 ticks (6 seconds).
