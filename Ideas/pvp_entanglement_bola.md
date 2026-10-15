# Entanglement Bola (Rooting & Anti-Elytra Utility)

> *"Weighted heavy iron spheres bound by woven phantom sinew. Designed to snare sprinting skirmishers and violently ground soaring elytra fliers."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:lead` (or `minecraft:snowball`)
- **Rarity:** `epic`
- **Category:** Crowd Control & Anti-Mobility PvP Utility
- **Custom Data:** `{utility: "EntanglementBola", type: "pvp"}`
- **Display Gradient:** Iron Gray to Webbed Indigo (`#576574` → `#222f3e` → `#341f97` → `#54a0ff`)
- **Lore Text:**
  ```json
  [
    {"text": "Thrown: Snails the first target struck with Weighted Entanglement.", "color": "gray", "italic": false},
    {"text": "Ground Root: Immobility (cannot jump or sprint) for 2.5 seconds.", "color": "gray", "italic": false},
    {"text": "Anti-Elytra Grounder: Instantly disables Elytra flight, forcing landing.", "color": "gray", "italic": false},
    {"text": "Ender Pearl Lock: Puts enemy Ender Pearls on 3s cooldown.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Binding Core** (`minecraft:iron_bars[custom_data={core:"binding"}]`)
- **Unlock Trigger:** Killing a **Spider Jockey** or crafting an **Iron Chain**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:iron_bars`
  - **Sides (N, S, E, W):** 4× `minecraft:chain`
  - **Corners:** 4× `minecraft:iron_ingot`

### Step 2: Forging at the Smithing Table
- **Template:** **Binding Core**
- **Base Tool:** `minecraft:lead`
- **Addition Catalyst:** `minecraft:slime_ball`
- **Yield:** 3× Reusable Bolas

---

## 3. Skills & Powers

### Active: Weighted Snare (Direct Hit)
- **Trigger:** Right-click throw.
- **Cooldown:** 14.0 seconds.
- **Mechanic:**
  - Fires a spinning projectile with chains whirling (`crit` and chain rattle sound `entity.leash_knot.place`).
  - Upon direct contact with an enemy player or mob:
    - Wraps their legs in binding chains.
    - Applies **Rooted** for **2.5 seconds** (movement speed reduced to 0, jumping disabled).
    - Prevents drawing bows/crossbows for 1.0 second.

### Passive: Grounding Lash (Anti-Elytra & Anti-Mace)
- **Description:** Hard-counters players attempting aerial mace divebombs or escaping via Elytra / Fireworks.
- **Mechanic:**
  - Striking an airborne or gliding player immediately terminates their Elytra glide state and zeroes their vertical upward velocity.
  - The victim falls directly downward with safe descent (prevents fatal cheese kills, but grounds them into melee range).

### Passive: Pearl Lock (Tether Disruption)
- **Description:** Prevents immediate panic teleportation.
- **Mechanic:**
  - The struck target receives an item cooldown on all `minecraft:ender_pearl` in their inventory for **3.0 seconds**, ensuring they must duel rather than instant-teleport away.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Root Implementation:**
  - When target is hit by bola:
    - Apply `slowness 3 6 true` and attribute modifier `generic.movement_speed -100%`.
    - Apply `jump_boost 3 200 true` (level 200 cancels jump ability in Java Edition).
    - Sound: `block.chain.break` and `entity.iron_golem.repair`.
- **Ender Pearl Cooldown Command:**
  ```mcfunction
  item cooldown @s minecraft:ender_pearl 60
  ```
- **Elytra Grounding Logic:**
  ```mcfunction
  # Check if victim is gliding
  execute if entity @s[predicate=kandy:is_gliding] run function kandy:pvp/ground_player
  ```
  In `ground_player.mcfunction`:
  Removes glide tag, cancels upward motion: `data modify entity @s Motion[1] set value -0.8d`.
