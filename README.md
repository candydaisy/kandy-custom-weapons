# kandy-custom-weapons

A custom weapons data pack for Minecraft Java Edition 26.1 – 26.3 (data pack format 101 – 121).

## Installing

Drop the pack folder (or zip) into your world's `datapacks` folder and run `/reload`.

## Crafting

Each weapon is made in two steps:

1. **Craft a Core** at a crafting table. The recipe shows up in your recipe book once you pick up its key material.
2. **Forge it** at a smithing table: put the Core in the template slot, the plain weapon in the base slot, and the extra item in the addition slot.

The weapon keeps its enchantments, but forged weapons can't be used in an anvil, so **enchant first, then forge**.

| Core | Recipe (crafting table) | Unlocks when you get | Forge with (smithing table) |
| --- | --- | --- | --- |
| **Swiftwind Core** | Diamond Block center, 4 Breeze Rods on the sides, 4 Feathers in the corners | Breeze Rod | Diamond Sword + Phantom Membrane |
| **Soul Core** | Sculk Catalyst center, 4 Ghast Tears on the sides, 4 Echo Shards in the corners | Echo Shard | Golden Sword + Block of Gold |
| **Blood Core** | Wither Skeleton Skull center, 4 Redstone Blocks on the sides, 4 Nether Wart in the corners | Wither Skeleton Skull | Netherite Sword + Golden Apple |
| **Gravity Core** | Nether Star center, 4 Crying Obsidian on the sides, 4 Obsidian in the corners | Nether Star | Mace + Anvil |
| **Pyroclast Core** | Respawn Anchor center, 4 Magma Cream on the sides, 4 Blaze Rods in the corners | Lava Bucket in the Nether, or killing a Magma Cube | Netherite Axe + Fire Charge |
| **Tempest Core** | Heart of the Sea center, 4 Lightning Rods on the sides, 4 Copper Blocks in the corners | Lightning Rod or Heart of the Sea | Trident + Nautilus Shell |
| **Glacial Core** | Blue Ice center, 4 Packed Ice on the sides, 4 Snow Blocks in the corners | Blue Ice | Diamond Hoe + Powder Snow Bucket |
| **Eclipse Core** | Ender Eye center, 4 Crying Obsidian on the sides, 4 Ender Pearls in the corners | Ender Eye or Dragon's Breath | Bow + Dragon's Breath |
| **Chronos Core** | Recovery Compass center, 4 Clocks on the sides, 4 Amethyst Shards in the corners | Clock or Suspicious Sand | Golden Sword + Echo Shard |
| **Abyssal Core** | Sponge center, 4 Dark Prismarine on the sides, 4 Prismarine Crystals in the corners | Killing an Elder Guardian or getting Dark Prismarine | Shield + Heart of the Sea |

Operators can also skip crafting: `/function kandy:menu` opens a clickable chat menu that hands out every weapon, charm, utility and core, or use `/function kandy:<weapon>/give` and `/function kandy:<weapon>/give_core` directly.

Weapon abilities only trigger on fully charged hits that aren't blocked by a shield, so spam-clicking won't apply them.

## Weapons

| Weapon | Command | Ability |
| --- | --- | --- |
| **Swiftwind** (diamond sword) | `kandy:swiftwind/give` | Sprinting builds Momentum (0–1000). 250+: Speed while carried. 500+: +1 reach while held. 750+: +0.3 attack speed while held. Momentum slowly drains when you stop. |
| **Dagger of Lingering Souls** (golden sword) | `kandy:lingering_soul/give` | Every charged hit leaves an echo on the target that deals 3 armor-piercing damage a second later. Echoes stack up to 3. |
| **Blood Pact Blade** (netherite sword) | `kandy:bloodpact/give` | 10 attack damage (+2 over netherite). Every charged hit costs you 2 HP; brief Absorption comes back only after the last dose wears off. Carrying it at low health brings Slowness (≤5 hearts), Weakness (≤4) and Darkness (≤3). At 2 hearts or less it bleeds you 1 HP per second while held. |
| **World Breaker** (mace) | `kandy:worldbreaker/give` | Charged hits drag enemies toward you for 3 seconds. Sneak while holding it to pull nearby entities in (you're slowed). Sneak-attack while airborne to slam the target down. |
| **Pyroclast Cleaver** (netherite axe) | `kandy:pyroclast/give` | 10 attack damage, 0.9 attack speed, disables shields for 6s, Fire Resistance while held. Charged hits build Heat (+10% per hit, cools 5%/s) and deal +1 fire damage (+2 at 50%+ Heat). At 100% Heat: 6s of Overdrive — Speed, +3 fire damage, swings cleave everything in front, and every hit erupts for 4 damage around the target and sets the floor alight. Sneak + jump-attack: Magma Fissure (10s cooldown) tears 10 blocks of ground ahead, dealing 8 damage, launching and melting armor (-20% for 5s); spends 50% Heat for double damage. |
| **Tempest Pike** (trident) | `kandy:tempest/give` | 9 attack damage, 1.2 attack speed, +0.5 reach. Charged and thrown hits arc lightning to the 2 nearest creatures within 6 blocks (3 damage + Slowness II for 2s). Jump again midair: Gale Surge, a 6-block dash that hits what you pass for 3 and cancels fall damage (4s cooldown). Sneak + charged melee hit: Skyward Wrath strikes the nearest other creature within 12 blocks of the one you hit (or that one, if nobody else is near) for 8 damage within 3 blocks and launches targets (10s cooldown). |
| **Frostveil Scythe** (diamond hoe) | `kandy:frostveil/give` | 8 attack damage, 1.0 attack speed, +0.5 reach. Charged hits stack Hypothermia (-10% speed per stack, clears after 6s). At 5 stacks the target is Frozen Solid for 1.5s (then 5s immune). Hitting a frozen target Shatters it for 6 armor-ignoring damage plus 3 to others within 4 blocks. Sneak-attack: Frost Nova, 4 damage + 2 stacks within 5 blocks and briefly freezes still water (8s cooldown). |
| **Eclipse Longbow** (bow) | `kandy:eclipse/give` | Arrows pierce up to 3 targets and deal 15% more; full-draw hits give Glowing 3s + Darkness 1s. A full-draw shot off cooldown becomes a Singularity Arrow: a 2.5s vortex that pulls within 5 blocks (players weakly), ticks 1 damage every 0.5s, then implodes for 6 (12s cooldown). Start sneaking while your arrow flies to Shadow Warp to it, only onto a safe spot (10s cooldown). |
| **Chronos Stiletto** (golden sword) | `kandy:chronos/give` | 6 attack damage, 1.8 attack speed, +5% speed while held. Charged hits stack a Paradox (max 3) that strikes for 1.5 per stack 3s later, ignoring armor. Right-click: 6s Temporal Anchor; sneak + right-click to rewind there, recover some health and cleanse debuffs (20s cooldown). Critical hits freeze mobs in time for 2s, or heavily slow players for 1s (10s per target). |
| **Abyssal Bulwark** (shield) | `kandy:abyssal/give` | Works in either hand: +0.25 knockback resistance, +2 armor toughness, axes disable it for half as long. Blocking stores Abyssal Pressure (max 5, fades after 10s) and gives Resistance I (II at 4+). Tap Sneak just before a blocked melee hit to Parry: the attacker gets Slowness IV + Weakness II for 2s, +3 Pressure (4s cooldown). Sneak + Jump: Tidal Surge cone up to 7 blocks, 4/7/10 damage by charges (8s cooldown). |

## Charms

Charms work from anywhere in your inventory (offhand included). They're crafted the same two-step way: Core at a crafting table, then Core + base item + extra item at a smithing table. Get them from `/function kandy:menu` or `/function kandy:<charm>/give`.

| Charm | Core recipe (center / sides / corners) | Unlocks when you | Forge with | Ability |
| --- | --- | --- | --- | --- |
| **Zephyr Charm** | Breeze Rod / Phantom Membranes / Feathers | Get a Phantom Membrane or Breeze Rod | Feather + Wind Charge | No fall damage. Sneak while falling to glide. Landing from 12+ blocks bursts for 4 damage and knockback (3s cooldown). |
| **Berserker Token** | Wither Skeleton Skull / Ghast Tears / Redstone Blocks | Kill a Wither or drop to 2 hearts | Ghast Tear + Enchanted Golden Apple | At 4 hearts or less: 8s Battle Frenzy (Strength I, Speed I); charged hits heal 2 hearts (3s cooldown). Then a 3s Slowness/Weakness crash. Recharges in 60s. |
| **Abyssal Pearl** | Conduit / Nautilus Shells / Sea Lanterns | Loot shipwreck treasure or get prismarine shards/crystals | Heart of the Sea + Bucket of Pufferfish | In water: Water Breathing, Dolphin's Grace, Night Vision while submerged, land-speed mining. Double-tap Jump in water for an 8-block dash (5s cooldown). |
| **Molten Core** | Blaze Rod / Magma Blocks / Nether Bricks | Enter the Nether or get a Blaze Rod | Magma Cream + Lava Bucket | Fire Resistance. In lava: Speed II and slow Regeneration. Melee attackers take 2 fire damage and catch fire (1s cooldown). Nearby fireballs fizzle; flaming arrows are snuffed. |
| **Void Talisman** | Sculk Catalyst / Echo Shards / Crying Obsidian | Enter the End or loot an Ancient City chest | Echo Shard + Chorus Fruit | Falling into the void returns you to safe ground (120s cooldown). Sneak in low light for 2s to turn Invisible; attacking or getting hurt breaks it. |
| **Alchemist Catalyst** | Brewing Stand / Golden Carrots / Amethyst Clusters | Brew a potion or get an Amethyst Cluster | Amethyst Shard + Honey Bottle | Cleanses Poison, Wither, Slowness, Weakness, Mining Fatigue, Darkness and Blindness into brief buffs (15s cooldown); leaves Blood Pact / World Breaker drawbacks alone. Beneficial potions (drunk, splash or lingering) last 50% longer (max 8 min). Carrying 3+ brewed potions: +1 max heart. |

Charms are still their base item underneath, so don't put one in a crafting grid or brewing stand: it would be used up like a normal feather, ghast tear, etc.

## PvP Utilities

> **Untested:** the PvP utilities haven't been tested in game yet. Expect bugs; please report anything that doesn't work.

Consumables and gadgets for fights. Crafted the same two-step way (Core at a crafting table, then Core + base item + extra item at a smithing table); most forges make several. Get them from `/function kandy:menu` or `/function kandy:<utility>/give`. There's no team system, so "enemies" means everyone except the user.

| Utility | Core recipe (center / sides / corners) | Unlocks when you | Forge with (makes) | What it does |
| --- | --- | --- | --- | --- |
| **Shadow Smoke Grenade** (snowball) | Wither Rose / Gunpowder / Ink Sacs | Get a Wither Rose or brew a potion | Snowball + Fermented Spider Eye (4) | Throw it: a 3-block smoke cloud for 5s that blinds other players inside. Enemy Ender Pearls flying through it are destroyed. Standing in your own smoke clears Glowing. 12s cooldown. |
| **Entanglement Bola** (thrown) | Iron Bars / Iron Chains / Iron Ingots | Get an Iron Chain or kill a spider jockey | Lead + Slime Ball (3) | Throw it: the first creature hit is snared for 1.5s (-85% speed, no jumping), then immune for 4s. Elytra fliers are grounded safely, and the target's Ender Pearls fizzle (refunded) for 3s. 14s cooldown. |
| **Barbed Caltrops** (iron nugget) | Pointed Dripstone / Iron Bars / Flint | Get Pointed Dripstone or an Iron Nugget | Iron Nugget + Leather (4) | Right-click: a 5x5 spike field where you look for 12s (max 2 per player, 10s cooldown). Others stepping in take 2 armor-piercing damage and are crippled (-35% speed, 4s); sprinting while crippled bleeds 1 HP/s. |
| **Bloodhound's Whistle** (goat horn) | Sculk Sensor / Copper Ingots / Amethyst Shards | Get a Sculk Sensor or a Bell | Goat Horn + Echo Shard | Sound it: players within 20 blocks lose Invisibility (including the Void Talisman cloak) and Glow for 5s. A scent trail only you can see points to the weakest of them for 4s, and you get Speed II for 4s. 30s cooldown. |
| **Decay Dart** (spectral arrow) | Fermented Spider Eye / Poisonous Potatoes / Nether Wart | Get a Poisonous Potato or brew a potion | Spectral Arrow + Spider Eye (4) | Bow/crossbow ammo. A dart blocked by a shield still pierces for 3 true damage. Hits inflict 4s of Necrosis: any health the target regains is taken back. A totem popped under Necrosis gives only Absorption I and Regeneration I. |
| **Repulsor Mine** (wind charge) | Crying Obsidian / Breeze Rods / Iron Blocks | Kill a Breeze or get Crying Obsidian | Wind Charge + Slime Ball (2) | Right-click the ground to place (max 2, 15s cooldown, lasts 2 min); arms after 1s. Another player within 3 blocks sets it off: 5 damage and a wind burst; player-placed End Crystals within 6 are removed without exploding, and projectiles are reflected for 2.5s. Sneak on your own mine for 1s to pick it up. |

## Uninstalling

Run `/function kandy:uninstall`, then `/datapack disable` the pack.
