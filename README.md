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
| **Chain Core** | Lodestone center, 4 Iron Chains on the sides, 4 Tripwire Hooks in the corners | Killing a Pillager or getting a Lodestone | Crossbow + Lead |
| **Falcon Core** | Spyglass center, 4 Arrows on the sides, 4 Feathers in the corners | Killing a Phantom or getting a Spyglass | Bow + Phantom Membrane |
| **Bloom Core** | Golden Apple center, 4 Glistering Melon Slices on the sides, 4 Flowering Azaleas in the corners | Brewing any potion or getting a Golden Apple | Golden Hoe + Honeycomb |
| **Oath Core** | Bell center, 4 White Banners on the sides, 4 Gold Ingots in the corners | Getting a Goat Horn or winning a Raid | Goat Horn + Totem of Undying |
| **Wyrm Core** | Dragon's Breath center, 4 Phantom Membranes on the sides, 4 End Rods in the corners | Getting any Spear or entering the End | Netherite Spear + Shulker Shell |

Operators can also skip crafting: `/function kandy:menu` opens a clickable chat menu that hands out every weapon, charm and core, or use `/function kandy:<weapon>/give` and `/function kandy:<weapon>/give_core` directly. `/function kandy:give_all` gives every weapon and charm at once (36 items), and `/function kandy:give_all_cores` gives every core.

Weapon abilities only trigger on fully charged hits that aren't blocked by a shield, so spam-clicking won't apply them.

## Weapons

Each skill has its own boss bar at the top of your screen (only you see them). Holding a weapon shows all of its bars; a weapon that's only carried shows bars just for skills that are recharging, and each disappears when the skill is ready. The Abyssal Bulwark counts as held in either hand. Charms show a bar only while one of their abilities is recharging (and the Berserker's Frenzy while it lasts).

| Weapon | Command | Ability |
| --- | --- | --- |
| **Swiftwind** (diamond sword) | `kandy:swiftwind/give` | 9 attack damage and +1 reach. Sprinting builds Momentum (0–1000). 250+: Speed while carried. 500+: another +1 reach while held. 750+: +0.3 attack speed while held. Momentum slowly drains when you stop. **Downside:** Taking a hit drains 250 Momentum. |
| **Dagger of Lingering Souls** (golden sword) | `kandy:lingering_soul/give` | Fast dagger: 6 attack damage, 2.0 attack speed. Every charged hit leaves an echo on the target that deals 3 armor-piercing damage a second later, credited to you. Echoes stack up to 4. **Soul Spread:** when an echoed creature dies, its remaining echoes jump to the nearest other creature within 5 blocks. **Downside:** Every echo that lands costs you half a hunger point. |
| **Blood Pact Blade** (netherite sword) | `kandy:bloodpact/give` | 10 attack damage (+2 over netherite). Charged hits grant brief Absorption (it comes back only after the last dose wears off). Carrying it at low health grants Strength I (≤4 hearts) but brings Slowness (≤5 hearts) and Darkness (≤3). At 2 hearts or less it bleeds you 1 HP per second while held, but the blade drinks too: each charged hit while bleeding heals 2 hearts. |
| **World Breaker** (mace) | `kandy:worldbreaker/give` | Charged hits drag enemies toward you for 3 seconds. Start sneaking while holding it for Event Horizon: everything within 10 blocks is pulled in for up to 5s while you keep sneaking, and you're heavily slowed (25s cooldown once it ends; letting go of Sneak or switching items ends it early). Sneak-attack while airborne to slam the target down for +6 damage. |
| **Pyroclast Cleaver** (netherite axe) | `kandy:pyroclast/give` | 10 attack damage, 0.9 attack speed, disables shields for 6s, Fire Resistance while held. Charged hits build Heat (+10% per hit; it doesn't cool down) and deal +1 fire damage (+2 at 50%+ Heat). At 100% Heat: 6s of Overdrive — Speed, +3 fire damage, swings cleave everything in front, and every hit erupts for 4 damage around the target and sets the floor alight. Sneak + jump-attack: Magma Fissure (10s cooldown) tears 10 blocks of ground ahead, dealing 8 damage, launching and melting armor (-20% for 5s); spends 50% Heat for double damage. **Downside:** When Overdrive ends you Overheat: Slowness I and Mining Fatigue for 4s, and the cleaver's Fire Resistance stops for that time. |
| **Tempest Pike** (trident) | `kandy:tempest/give` | 9 attack damage, 1.2 attack speed, +0.5 reach. Charged and thrown hits arc lightning to the 2 nearest creatures within 6 blocks (3 armor-piercing damage + Slowness II for 2s). Jump again midair: Gale Surge, a 6-block dash that hits what you pass for 3 and cancels fall damage (4s cooldown). Sneak + charged melee hit, or any thrown hit: Skyward Wrath strikes the nearest other creature within 12 blocks of the one you hit (or that one, if nobody else is near) for 8 armor-piercing damage within 3 blocks and launches targets (10s cooldown). |
| **Frostveil Scythe** (diamond hoe) | `kandy:frostveil/give` | 8 attack damage, 1.0 attack speed, +0.5 reach. Charged hits stack Hypothermia (-10% speed per stack, clears after 6s). At 5 stacks the target is Frozen Solid for 1.5s (then 5s immune). Hitting a frozen target Shatters it for 6 armor-ignoring damage plus 3 to others within 4 blocks. Sneak-attack: Frost Nova, 4 damage + 2 stacks within 5 blocks and briefly freezes still water (8s cooldown). **Downside:** Its chill slows you 5% while held, and in powder snow you take an extra 1 freeze damage per second. |
| **Eclipse Longbow** (bow) | `kandy:eclipse/give` | Arrows pierce up to 3 targets and deal 15% more; full-draw hits give Glowing 3s + Darkness 1s. A full-draw shot off cooldown becomes a Singularity Arrow: a 2.5s vortex that pulls within 5 blocks (players weakly), ticks 1 damage every 0.5s, then implodes for 6 (12s cooldown). Start sneaking while your arrow flies to Shadow Warp to it, only onto a safe spot (10s cooldown). **Downside:** Shadow Warp costs 2 HP. |
| **Chronos Stiletto** (golden sword) | `kandy:chronos/give` | 6 attack damage, 1.8 attack speed, +5% speed while held. Charged hits stack a Paradox (max 3) that strikes for 1.5 per stack 3s later, ignoring armor. Right-click: 6s Temporal Anchor; sneak + right-click to rewind there, recover some health and cleanse debuffs (20s cooldown). Critical hits freeze mobs in time for 2s, or heavily slow players for 1s (10s per target). **Downside:** A rewind leaves you with Weakness I for 3s. |
| **Abyssal Bulwark** (shield) | `kandy:abyssal/give` | Works in either hand: +0.25 knockback resistance, +2 armor toughness, axes disable it for half as long. Blocking stores Abyssal Pressure (max 5, fades after 10s) and gives Resistance I (II at 4+). Tap Sneak just before a blocked melee hit to Parry: the attacker gets Slowness IV + Weakness II for 2s, +3 Pressure (4s cooldown). Sneak + Jump: Tidal Surge cone up to 7 blocks, 4/7/10 damage by charges, plus Slowness II and Mining Fatigue II for 4s (players are also lifted briefly) (8s cooldown). **Downside:** Heavy: -10% movement speed while held in either hand, and Tidal Surge's recoil gives you Slowness II for 2s. |
| **Chainwarden Arbalest** (crossbow) | `kandy:chainwarden/give` | Bolts Shackle what they hit (Slowness I 2s). A bolt that hits a creature Tethers it for 4s (10s cooldown, from when the Tether ends); Sneak while Tethered to Reel: light targets fly to you, heavy ones (players, golems, ravagers, wardens, bosses) pull you to them instead, with no fall damage. With no Tether up, Sneak within 3s of your bolt sticking in a block to Grapple to it (up to 30 blocks, 8s cooldown). **Downside:** -15% movement speed while a Tether is up. |
| **Falconer's Recurve** (bow) | `kandy:falconer/give` | Keep your crosshair on a creature for 0.75s while drawing to Lock On (it glows; the lock lasts 8s and each homing shot refreshes it). Full-draw arrows fired while locked curve toward the target for 15% less damage. Sneak + full draw: Falcon Volley, 3 extra homing spectral arrows (14s cooldown). **Downside:** while a lock is up you have Blindness and Slowness II, and locking onto a player makes you glow for 3s. |
| **Lifebloom Staff** (golden hoe) | `kandy:lifebloom/give` | Healer: 4 attack damage, 1.2 attack speed. Right-click: Mending Pulse, instantly heals teammates within 6 blocks for 4 HP, plus Regeneration I 4s for those at 10 HP or less (12s cooldown). Keep holding 2s: Sanctuary, a 5-block aura that follows you for 10s, giving you and teammates Regeneration II and monsters Slowness I (30s cooldown). Charged hits on mobs heal your most hurt teammate within 8 blocks by about 1 HP. Only helps your team (see Teams). **Downside:** your own Pulse is only Regeneration I for 3s. |
| **Oathbound Warhorn** (goat horn) | `kandy:warhorn/give` | Works from either hand. Blow: War Cry, you and teammates within 16 blocks get Strength III + Speed III for 10s. Sneak + blow: Rally, you and teammates within 16 blocks are cleansed (Weakness, Poison, Slowness, Mining Fatigue, Darkness, leaving pack drawbacks alone) and get Resistance III for 10s; monsters within 6 blocks are shoved back. 90s cooldown, shared. Only helps your team (see Teams). **Downside:** monsters within 24 blocks get Speed I and you glow for 8s. |
| **Dragoon's Wyrmspear** (netherite spear) | `kandy:dragoon/give` | 6 attack damage (+1 over netherite). Jabs on the same target within 2s stack Puncture: +1 damage per stack on your next jabs (max 3). Hits during a held charge Skewer: -15% armor and Slowness II for 3s. Sneak + Jump: Dragoon Leap (about 5 blocks, no fall damage); keep holding Sneak (or press it again) once you stop rising to Dive, landing for 6 damage within 3 blocks (12s cooldown from landing). **Downside:** Slowness III for 2s after a Dive. |

## Teams

The support weapons (Lifebloom Staff, Oathbound Warhorn) only help your team. Any player can join one, no operator needed:

- `/trigger kandy_team set <number>` joins team `<number>`; everyone who picks the same number is on the same team.
- `/trigger kandy_team set -1` leaves it.

With no team, they only affect you.

## Charms

Charms work from anywhere in your inventory (offhand included). They're crafted the same two-step way: Core at a crafting table, then Core + base item + extra item at a smithing table. Get them from `/function kandy:menu` or `/function kandy:<charm>/give`.

| Charm | Core recipe (center / sides / corners) | Unlocks when you | Forge with | Ability |
| --- | --- | --- | --- | --- |
| **Zephyr Charm** | Breeze Rod / Phantom Membranes / Feathers | Get a Phantom Membrane or Breeze Rod | Feather + Wind Charge | No fall damage. Sneak while falling to glide. Landing from 12+ blocks bursts for 4 damage and knockback (3s cooldown). |
| **Berserker Token** | Wither Skeleton Skull / Ghast Tears / Redstone Blocks | Kill a Wither or drop to 2 hearts | Ghast Tear + Enchanted Golden Apple | At 4 hearts or less: 8s Battle Frenzy (Strength I, Speed I, Night Vision); charged hits heal 2 hearts (3s cooldown). Then a 3s Slowness/Weakness crash. Recharges in 60s. |
| **Abyssal Pearl** | Conduit / Nautilus Shells / Sea Lanterns | Loot shipwreck treasure or get prismarine shards/crystals | Heart of the Sea + Bucket of Pufferfish | In water: Water Breathing, Dolphin's Grace, Night Vision while submerged, land-speed mining. Double-tap Jump in water for an 8-block dash (5s cooldown). |
| **Molten Core** | Blaze Rod / Magma Blocks / Nether Bricks | Enter the Nether or get a Blaze Rod | Magma Cream + Lava Bucket | Fire Resistance. In lava: Speed II and slow Regeneration. Melee attackers take 2 fire damage and catch fire (1s cooldown). Nearby fireballs fizzle; flaming arrows are snuffed. |
| **Void Talisman** | Sculk Catalyst / Echo Shards / Crying Obsidian | Enter the End or loot an Ancient City chest | Echo Shard + Chorus Fruit | Falling into the void returns you to safe ground (120s cooldown). Sneak in low light for 2s to turn Invisible; standing up, attacking or getting hurt breaks it. |
| **Alchemist Catalyst** | Brewing Stand / Golden Carrots / Amethyst Clusters | Brew a potion or get an Amethyst Cluster | Amethyst Shard + Honey Bottle | Cleanses Poison, Wither, Slowness, Weakness, Mining Fatigue, Darkness and Blindness into brief buffs (15s cooldown); leaves Blood Pact / World Breaker drawbacks alone. Beneficial potions (drunk, splash or lingering) last 50% longer (max 8 min). Carrying 3+ brewed potions: +1 max heart. |
| **Phoenix Plume** | Totem of Undying / Blaze Rods / Gold Blocks | Use a Totem of Undying | Blaze Powder + Golden Apple | At 2 hearts or less: Rebirth - Regeneration III 4s, Absorption II 8s, Fire Resistance 8s and a 4-damage ring of fire (5 min cooldown). **Downside:** -2 max hearts for 60s afterwards. |
| **Merchant's Sigil** | Emerald Block / Gold Ingots / Books | Trade with a villager | Emerald + Bell | Hero of the Village I and Luck I while carried; +3 XP per villager trade (5s cooldown). **Downside:** illagers and raiders within 16 blocks get Speed I. |
| **Watcher's Lens** | Ender Eye / Amethyst Shards / Glass Panes | Get a Spyglass or kill an Enderman | Spyglass + Phantom Membrane | Mobs targeting you within 16 blocks glow. Scope a creature for 1s to Mark it (Glowing 10s, 20s cooldown). **Downside:** marking makes you glow for 3s. |
| **Verdant Sprig** | Moss Block / Oak Saplings / Vines | Get Moss or a sapling | Stick + Glow Berries | On grass, moss or leaves under open sky: 1 HP every 5s. Sneaking there gives +50% knockback resistance. **Downside:** Hunger I after 60s without open sky. |
| **Stormcaller Coil** | Lightning Rod / Copper Blocks / Redstone | Get a Lightning Rod or be in a thunderstorm | Copper Ingot + Glowstone Dust | Sprinting builds Static; at 100% your next charged hit adds +4 armor-piercing lightning damage and Slowness II for 1s. Speed I in the rain. **Downside:** in thunderstorms, a 1-in-5 chance every 30s of being struck for 3. |
| **Deepdelver Lamp** | Lantern / Glow Ink Sacs / Raw Iron | Get deepslate or loot a mineshaft chest | Glowstone Dust + Amethyst Shard | Night Vision below Y 40 in the dark. Sneak still for 2s: ores within 6 blocks glow for 5s (30s cooldown). **Downside:** you glow to other players while underground. |
| **Reaper's Knuckle** | Skeleton Skull / Bone Blocks / Soul Sand | Kill a Skeleton or Zombie | Bone + Echo Shard | Each kill adds 1 max heart (max 4, 45s) and heals it; a player kill gives all 4. **Downside:** undead deal +1 damage to you. |
| **Hare's Foot** | Rabbit Hide / Carrots / Feathers | Get a Rabbit's Foot | Rabbit's Foot + Sugar | Jump Boost I and +10% speed; a sprint-jump gives a 1.5s Speed II burst (4s cooldown). **Downside:** -2 armor. |
| **Hearthstone** | Campfire / Coal Blocks / Bread | Get cooked food | Charcoal + Baked Potato | Eating gives Saturation I for 2s; near a lit campfire, furnace or smoker you get Regeneration I. **Downside:** hunger drains ~20% faster. |
| **Wayfarer's Compass** | Recovery Compass / Maps / Gold Ingots | Sleep in a bed or use a respawn anchor | Compass + Ender Pearl | Sneak still for 3s to recall to your bed or respawn anchor (same dimension, 10 min cooldown). **Downside:** each recall costs 5 levels. |
| **Prism Mirror** | Glass / Quartz Blocks / Amethyst Shards | Get Nether Quartz | Nether Quartz + Glass Pane | Projectiles that hit you reflect 30% of their damage at the shooter; every 15s one projectile hit is healed straight back. **Downside:** melee hits deal +1 damage to you. |
| **Predator's Fang** | Goat Horn / Bones / Flint | Kill a Wolf, Fox or Ocelot | Flint + Rotten Flesh | Charged hits on targets below 30% health deal +3 damage; kills that way give Speed I for 3s. **Downside:** -2 max health. |
| **Moonlit Pendant** | Phantom Membrane / Iron Ingots / Glowstone Dust | Kill a Phantom or be outside at midnight | Firework Star + Nether Star | At night under open sky: Strength I and Night Vision, plus Speed I on a full moon. Any Overworld night (roof or not): +2 max hearts, which start empty and vanish at dawn. **Downside:** Slowness I and -10% attack speed in daylight. |
| **Tinker's Whetstone** | Anvil / Iron Ingots / Flint | Get an Anvil or Grindstone | Brick + Grindstone | Mends your held item by 1 durability every 5s. Sneak still for 2s with a weapon: +1 attack damage for 20s (60s cooldown). **Downside:** -10% attack speed. |
| **Enderbrace** | Chorus Flower / Ender Pearls / Popped Chorus Fruit | Eat Chorus Fruit or enter the End | Popped Chorus Fruit + Shulker Shell | Double-tap Sneak: blink up to 10 blocks where you look, never into blocks (12s cooldown). **Downside:** 2 damage every 2s in water or rain. |

Charms are still their base item underneath, so don't put one in a crafting grid or brewing stand: it would be used up like a normal feather, ghast tear, etc.

## Uninstalling

Run `/function kandy:uninstall`, then `/datapack disable` the pack.
