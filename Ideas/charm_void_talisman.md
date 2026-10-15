# Void Talisman (Void Fall Rescue & Shadow Charm)

> *"Resonating with the dark frequencies of the End. The abyss recognizes you as its own and refuses to swallow you."*

---

## 1. Overview & Identity

- **Item Type:** Passive Charm / Emergency Lifesaver (Carried in Inventory or Offhand)
- **Base Item:** `minecraft:echo_shard` (or `minecraft:ender_pearl`)
- **Rarity:** `epic`
- **Custom Data:** `{charm: "VoidTalisman", type: "talisman"}`
- **Display Gradient:** Deep Void Purple to Sculk Cyan (`#0a001a` → `#2d004d` → `#005b60` → `#00b894`)
- **Lore Text:**
  ```json
  [
    {"text": "Carried in inventory: Falling into the Void instantly teleports you to safety.", "color": "gray", "italic": false},
    {"text": "End Ward: Endermen become docile and will never aggro on direct gaze.", "color": "gray", "italic": false},
    {"text": "Shadow Cloak: Crouching in low light (< light level 6) makes you Invisible.", "color": "gray", "italic": false},
    {"text": "Void Rescue Cooldown: 60 seconds.", "color": "gray", "italic": false}
  ]
  ```

---

## 2. Crafting & Forging

### Step 1: Crafting the Core
- **Item Name:** **Abyssal Echo Core** (`minecraft:sculk_catalyst[custom_data={core:"abyssal_echo"}]`)
- **Unlock Trigger:** Visiting **The End** or looting an **Ancient City**
- **3x3 Crafting Table Grid:**
  - **Center:** `minecraft:sculk_catalyst`
  - **Sides (N, S, E, W):** 4× `minecraft:echo_shard`
  - **Corners:** 4× `minecraft:crying_obsidian`

### Step 2: Forging at the Smithing Table
- **Template:** `Abyssal Echo Core`
- **Base Item:** `minecraft:echo_shard`
- **Addition Catalyst:** `minecraft:chorus_fruit` (or `minecraft:shulker_shell`)

---

## 3. Skills & Powers

### Passive: Void Rescue (Chasm Lifesaver)
- **Description:** Protects the player from dying in the void (The End or bottom of the Overworld).
- **Cooldown:** 60.0 seconds.
- **Mechanic:**
  - If the carrier falls below **Y = -40 in The End** or **Y = -60 in the Overworld**, the talisman activates instantly.
  - Suspends all downward velocity and plays `entity.warden.sonic_charge`.
  - Teleports the player to the nearest solid ground block directly above or at the island surface (up to Y = 70).
  - Grants **Slow Falling** (5 seconds) and **Regeneration II** (6 seconds) to guarantee safe footing.
  - Spawns a helix of `reverse_portal` and `sculk_soul` particles.

### Passive: Gaze of the End (Enderman Pacification)
- **Description:** Endermen sense the void frequency within the talisman.
- **Mechanic:**
  - Staring directly at Endermen will never cause them to aggro or teleport attack.
  - You can walk safely among Endermen in the End dimension without wearing a carved pumpkin.

### Passive: Shadow Cloak (Stealth Mode)
- **Description:** Blends the carrier into darkness.
- **Mechanic:**
  - Crouching (Sneaking) in dark areas with a block light level of **5 or lower** grants **Invisibility** and dampens player footstep sounds.
  - Standing up, sprinting, or attacking instantly breaks the cloak.

---

## 4. Technical Implementation Blueprint (Datapack)

- **Inventory Tagging:**
  In `data/kandy/function/holders.mcfunction`:
  ```mcfunction
  tag @a remove kandy.charm.void_talisman
  execute as @a if items entity @s container.* *[custom_data~{charm:"VoidTalisman"}] run tag @s add kandy.charm.void_talisman
  execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"VoidTalisman"}] run tag @s add kandy.charm.void_talisman
  ```
- **Void Detection Logic (`void_talisman_tick.mcfunction`):**
  ```mcfunction
  # Check End dimension void threshold
  execute as @a[tag=kandy.charm.void_talisman,scores={kandy.void_cd=0}] in minecraft:the_end if entity @s[y=-40,distance=..20] run function kandy:charms/void_rescue

  # Check Overworld void threshold
  execute as @a[tag=kandy.charm.void_talisman,scores={kandy.void_cd=0}] in minecraft:overworld if entity @s[y=-60,distance=..20] run function kandy:charms/void_rescue
  ```
- **Rescue Function (`void_rescue.mcfunction`):**
  ```mcfunction
  scoreboard players set @s kandy.void_cd 1200
  # Search solid block upward using spreadplayers or raycast
  execute at @s run spreadplayers ~ ~ 0 10 false @s
  effect give @s minecraft:slow_falling 5 0 true
  effect give @s minecraft:regeneration 6 1 true
  playsound entity.enderman.teleport player @s ~ ~ ~ 2 1
  particle portal ~ ~1 ~ 1 1 1 0.1 50
  ```
