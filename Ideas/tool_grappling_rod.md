# Acrobat's Grappling Hook

> *"Spun from reinforced spider silk and weighted with prismarine sinkers. Turns jagged cliffs and cavern ravines into your personal playground."*

---

## 1. Overview & Identity

- **Base Item:** `minecraft:fishing_rod`
- **Rarity:** `epic`
- **Category:** Traverse & Mobility Utility
- **Custom Data:** `{utility: "GrapplingHook", type: "tool"}`
- **Display Gradient:** Silk White to Skyward Azure (`#ffffff` → `#dff9fb` → `#00cec9` → `#0984e3`)
- **Lore Text:**
  ```json
  [
    {"text": "Hook onto blocks: Right-click again to reel yourself swiftly toward the anchor.", "color": "gray", "italic": false},
    {"text": "Reel Momentum: Jump at the end of the pull to launch into a high slingshot leap.", "color": "gray", "italic": false},
    {"text": "Hook Entities: Pulls items, mobs, and disarms hostile shields.", "color": "gray", "italic": false},
    {"text": "Fall Protection: Cancels fall damage upon hooking any surface.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Tether Core** (`minecraft:lead[custom_data={core:"tether"}]`)
- **Unlock Trigger:** Crafting a **Lead** or collecting **Cobweb**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:tripwire_hook`
  - **Sides (N, S, E, W):** 4× `minecraft:lead`
  - **Corners:** 4× `minecraft:cobweb`

### Step 2: Forging at the Smithing Table
- **Template:** **Tether Core**
- **Base Tool:** `minecraft:fishing_rod`
- **Addition Catalyst:** `minecraft:phantom_membrane` (or `minecraft:slime_block`)

---

## 3. Tool Attributes & Properties

- **Hook Range:** Extended cast velocity (+60% farther than standard fishing line).
- **Durability:** Unbreakable (`unbreakable={}`).
- **Cooldown:** No cooldown on successful anchor; 0.5s safety buffer between casts.

---

## 4. Skills & Powers

### Active Skill 1: Grapple & Pull (Zipline Propulsion)
- **Trigger:** Cast the hook into any solid block, then **Right-click** while the hook is planted.
- **Mechanic:**
  - The line tightens into a taut silk cable.
  - Pulls the player smoothly and rapidly toward the hooked block at high velocity.
  - While reeling, the player is immune to kinetic wall collision damage.
  - Instantly resets `FallDistance` to `0.0`, saving you from fatal cavern or ravine plunges.

### Active Skill 2: Slingshot Leap (Kinetic Boost)
- **Trigger:** Pressing **Jump (Space)** right as the grapple reel reaches the anchored surface.
- **Mechanic:**
  - Converts horizontal and vertical pull momentum into a colossal catapult leap.
  - Launches the player 10–15 blocks upward and forward over the ledge.
  - Seamlessly chains directly into Elytra flight glide!

### Utility 3: Entity Harpoon & Disarm
- **Trigger:** Hooking an enemy mob or player.
- **Mechanic:**
  - Reeling drags the target 8 blocks closer to the player.
  - If the target is an enemy holding a shield, the harpoon rips the shield down, applying a **5-second shield disable**.
  - Can hook distant dropped item stacks to retrieve them safely from across lava pits or deep chasms.

---

## 5. Technical Implementation Blueprint (Datapack)

- **Fishing Hook Detection:**
  In `holders.mcfunction` / tick loop:
  ```mcfunction
  # Check active bobber owned by player holding grappling hook
  execute as @e[type=fishing_bobber] if items entity @p weapon.mainhand *[custom_data~{utility:"GrapplingHook"}] run tag @s add kandy.grapple_hook
  ```
- **Reeling Vector Calculation (`grapple_pull.mcfunction`):**
  When bobber is lodged in ground/block:
  ```mcfunction
  # Direction vector from player to bobber
  execute as @p[tag=kandy.reeling] at @s facing entity @e[tag=kandy.grapple_hook,limit=1] run tp @s ^ ^0.2 ^0.8
  execute as @p[tag=kandy.reeling] run data modify entity @s FallDistance set value 0.0f
  particle sweep_attack ~ ~1 ~ 0.2 0.2 0.2 0 3
  playsound entity.fishing_bobber.retrieve player @s ~ ~ ~ 1.5 1.4
  ```
