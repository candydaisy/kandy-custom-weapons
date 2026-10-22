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

Operators can also skip crafting: `/function kandy:menu` opens a clickable chat menu that hands out every weapon, charm and core, or use `/function kandy:<weapon>/give` and `/function kandy:<weapon>/give_core` directly (sin items live under `kandy:sin/<sin>/weapon/` and `kandy:sin/<sin>/charm/`, see Sins). `/function kandy:give_all` gives every weapon and charm at once (36 items), and `/function kandy:give_all_cores` gives every core.

Weapon abilities only trigger on fully charged hits that aren't blocked by a shield, so spam-clicking won't apply them.

## Weapons

Each skill has its own boss bar at the top of your screen (only you see them). Holding a weapon shows all of its bars; a weapon that's only carried shows bars just for skills that are recharging, and each disappears when the skill is ready. The Abyssal Bulwark counts as held in either hand. Charms show a bar only while one of their abilities is recharging (and the Berserker's Frenzy while it lasts).

| Weapon | Command | Ability |
| --- | --- | --- |
| **Dagger of Lingering Souls** (golden sword) | `kandy:lingering_soul/give` | Fast dagger: 6 attack damage, 2.0 attack speed. Every charged hit leaves an echo on the target that deals 3 armor-piercing damage a second later, credited to you. Echoes stack up to 4. **Soul Spread:** when an echoed creature dies, its remaining echoes jump to the nearest other creature within 5 blocks. **Downside:** Every echo that lands costs you half a hunger point. |
| **Blood Pact Blade** (netherite sword) · *Sin of Lust* | `kandy:sin/lust/weapon/give` | 10 attack damage (+2 over netherite). Charged hits grant brief Absorption (it comes back only after the last dose wears off). Carrying it at low health grants Strength I (≤4 hearts) but brings Slowness (≤5 hearts) and Darkness (≤3). At 2 hearts or less it bleeds you 1 HP per second while held, but the blade drinks too: each charged hit while bleeding heals 2 hearts. |
| **World Breaker** (mace) | `kandy:worldbreaker/give` | Charged hits drag enemies toward you for 3 seconds. Start sneaking while holding it for Event Horizon: everything within 10 blocks is pulled in for up to 5s while you keep sneaking, and you're heavily slowed (25s cooldown once it ends; letting go of Sneak or switching items ends it early). Sneak-attack while airborne to slam the target down for +6 damage. |
| **Pyroclast Cleaver** (netherite axe) · *Sin of Wrath* | `kandy:sin/wrath/weapon/give` | 10 attack damage, 0.9 attack speed, disables shields for 6s, Fire Resistance while held. Charged hits build Heat (+10% per hit; it doesn't cool down) and deal +1 fire damage (+2 at 50%+ Heat). At 100% Heat: 6s of Overdrive — Speed, +3 fire damage, swings cleave everything in front, and every hit erupts for 4 damage around the target and sets the floor alight. Sneak + jump-attack: Magma Fissure (10s cooldown) tears 10 blocks of ground ahead, dealing 8 damage, launching and melting armor (-20% for 5s); spends 50% Heat for double damage. **Downside:** When Overdrive ends you Overheat: Slowness I and Mining Fatigue for 4s, and the cleaver's Fire Resistance stops for that time. |
| **Tempest Pike** (trident) | `kandy:tempest/give` | 9 attack damage, 1.2 attack speed, +0.5 reach. Charged and thrown hits arc lightning to the 2 nearest creatures within 6 blocks (3 armor-piercing damage + Slowness II for 2s). Jump again midair: Gale Surge, a 6-block dash that hits what you pass for 3 and cancels fall damage (4s cooldown). Sneak + charged melee hit, or any thrown hit: Skyward Wrath strikes the nearest other creature within 12 blocks of the one you hit (or that one, if nobody else is near) for 8 armor-piercing damage within 3 blocks and launches targets (10s cooldown). |
| **Frostveil Scythe** (diamond hoe) | `kandy:frostveil/give` | 8 attack damage, 1.0 attack speed, +0.5 reach. Charged hits stack Hypothermia (-10% speed per stack, clears after 6s). At 5 stacks the target is Frozen Solid for 1.5s (then 5s immune). Hitting a frozen target Shatters it for 6 armor-ignoring damage plus 3 to others within 4 blocks. Sneak-attack: Frost Nova, 4 damage + 2 stacks within 5 blocks and briefly freezes still water (8s cooldown). **Downside:** Its chill slows you 5% while held, and in powder snow you take an extra 1 freeze damage per second. |
| **Eclipse Longbow** (bow) | `kandy:eclipse/give` | Arrows pierce up to 3 targets and deal 15% more; full-draw hits give Glowing 3s + Darkness 1s. A full-draw shot off cooldown becomes a Singularity Arrow: a 2.5s vortex that pulls within 5 blocks (players weakly), ticks 1 damage every 0.5s, then implodes for 6 (12s cooldown). Start sneaking while your arrow flies to Shadow Warp to it, only onto a safe spot (10s cooldown). **Downside:** Shadow Warp costs 2 HP. |
| **Chronos Stiletto** (golden sword) | `kandy:chronos/give` | 6 attack damage, 1.8 attack speed, +5% speed while held. Charged hits stack a Paradox (max 3) that strikes for 1.5 per stack 3s later, ignoring armor. Right-click: 6s Temporal Anchor; sneak + right-click to rewind there, recover some health and cleanse debuffs (20s cooldown). Critical hits freeze mobs in time for 2s, or heavily slow players for 1s (10s per target). **Downside:** A rewind leaves you with Weakness I for 3s. |
| **Abyssal Bulwark** (shield) | `kandy:abyssal/give` | Works in either hand: +0.25 knockback resistance, +2 armor toughness, axes disable it for half as long. Blocking stores Abyssal Pressure (max 5, fades after 10s) and gives Resistance I (II at 4+). Tap Sneak just before a blocked melee hit to Parry: the attacker gets Slowness IV + Weakness II for 2s, +3 Pressure (4s cooldown). Sneak + Jump: Tidal Surge cone up to 7 blocks, 4/7/10 damage by charges, plus Slowness II and Mining Fatigue II for 4s (players are also lifted briefly) (8s cooldown). **Downside:** Heavy: -10% movement speed while held in either hand, and Tidal Surge's recoil gives you Slowness II for 2s. |
| **Chainwarden Arbalest** (crossbow) · *Sin of Greed* | `kandy:sin/greed/weapon/give` | Bolts Shackle what they hit (Slowness I 2s). A bolt that hits a creature Tethers it for 4s (10s cooldown, from when the Tether ends); Sneak while Tethered to Reel: light targets fly to you, heavy ones (players, golems, ravagers, wardens, bosses) pull you to them instead, with no fall damage. With no Tether up, Sneak within 3s of your bolt sticking in a block to Grapple to it (up to 30 blocks, 8s cooldown). **Downside:** -15% movement speed while a Tether is up. |
| **Falconer's Recurve** (bow) · *Sin of Envy* | `kandy:sin/envy/weapon/give` | Keep your crosshair on a creature for 0.75s while drawing to Lock On (it glows; the lock lasts 8s and each homing shot refreshes it). Full-draw arrows fired while locked curve toward the target for 15% less damage. Sneak + full draw: Falcon Volley, 3 extra homing spectral arrows (14s cooldown). **Downside:** while a lock is up you have Darkness and Slowness II, and locking onto a player makes you glow for 3s. |
| **Lifebloom Staff** (golden hoe) | `kandy:lifebloom/give` | Healer: 4 attack damage, 1.2 attack speed. Right-click: Mending Pulse, instantly heals teammates within 6 blocks for 4 HP, plus Regeneration I 4s for those at 10 HP or less (12s cooldown). Keep holding 2s: Sanctuary, a 5-block aura that follows you for 10s, giving you and teammates Regeneration II and monsters Slowness I (30s cooldown). Charged hits on mobs heal your most hurt teammate within 8 blocks by about 1 HP. Only helps your team (see Teams). **Downside:** your own Pulse is only Regeneration I for 3s. |
| **Oathbound Warhorn** (goat horn) | `kandy:warhorn/give` | Works from either hand. Blow: War Cry, you and teammates within 16 blocks get Strength III + Speed III for 10s. Sneak + blow: Rally, you and teammates within 16 blocks are cleansed (Weakness, Poison, Slowness, Mining Fatigue, Darkness, leaving pack drawbacks alone) and get Resistance III for 10s; monsters within 6 blocks are shoved back. 90s cooldown, shared. Only helps your team (see Teams). **Downside:** monsters within 24 blocks get Speed I and you glow for 8s. |
| **Dragoon's Wyrmspear** (netherite spear) · *Sin of Pride* | `kandy:sin/pride/weapon/give` | 6 attack damage (+1 over netherite). Jabs on the same target within 2s stack Puncture: +1 damage per stack on your next jabs (max 3). Hits during a held charge Skewer: -15% armor and Slowness II for 3s. Sneak + Jump: Dragoon Leap (about 5 blocks, no fall damage); keep holding Sneak (or press it again) once you stop rising to Dive, landing for 6 damage within 3 blocks (23s cooldown from landing). **Downside:** Slowness III for 2s after a Dive. |

## Sins

The pack is being reworked around the Seven Deadly Sins (design: `Ideas/seven_sins.md`). Each sin pairs a weapon (held) with a charm (carried); having both gives a set bonus. Done so far:

- **Wrath** — Pyroclast Cleaver + Berserker Token.
  - **Blind Fury** (set bonus): taking damage gives +5% Heat (reaching 100% starts Overdrive), and Battle Frenzy instantly starts Overdrive.
  - **Tiers** are earned by indulging the sin, and progress is stored on the cleaver itself (your action bar shows it). Tier 2 comes after 10 Overdrives, tier 3 after 30 kills made during Overdrive at tier 2. Operators can skip ahead with `/function kandy:sin/wrath/weapon/give_tier {tier:2}`. Tier 2 makes Overdrive last 8s and eruptions deal 5. Tier 3 also chains each eruption to the nearest other creature within 4 blocks, but Overheat lasts 6s and sets you on fire.

- **Pride** — Dragoon's Wyrmspear + Phoenix Plume.
  - **Above Them:** spear hits on creatures at least 2 blocks below you deal +15% damage.
  - **The Fall:** a Dive that hits nothing deals you the fall damage you skipped.
  - **Never Retreat** (Phoenix Plume): Slowness I while below half health.
  - **Ascendant** (set bonus): Rebirth readies the Leap at once, and each Dive kill takes 30s off Rebirth's cooldown.
  - **Tiers:** tier 2 after 15 Dives that hit, tier 3 after 10 Dive kills. Tier 2 Leaps higher and Dives for 8. Tier 3 makes Above Them +25% and Dives slow what they hit for 3s, but a missed Dive's fall hurts double.

- **Greed** — Chainwarden Arbalest + Plunderer's Coin.
  - **Pilfer:** bolt hits steal a level from players (you get it); mobs drop an extra XP orb.
  - **Can't Let Go:** putting the arbalest away (out of both hands) while Tethered snaps the chain and doubles the cooldown.
  - **Gilded Weight** (Plunderer's Coin, replaces its hunger cost): -5% speed for every 64 gold, emeralds, diamonds or netherite you carry (blocks count 9, nuggets 1/9), up to -25%.
  - **Compound Interest** (set bonus, arbalest in either hand): creatures you Tethered always drop their loot twice when you kill them, and a reeled player pays one more level.
  - **Tiers:** tier 2 after 15 Reels, tier 3 after 25 kills on creatures you Tethered (counted while the arbalest is in your main hand). Tier 2 Tethers last 6s and Pilfer takes 2 levels. Tier 3 also chains each Tether to a second creature within 4 blocks, but Gilded Weight can reach -35%.

- **Lust** — Blood Pact Blade + Hare's Foot.
  - **Desire** (Swiftwind's old Momentum): sprinting builds it, 0–1000. With the blade in hand: +1 reach at 500, Speed I at 1000. Taking a hit cools it by 250.
  - **Embrace** (right-click the blade): lunge at the creature you're looking at, up to 6 blocks, for 500 Desire; landing it deals 4 damage. 12s cooldown.
  - **Obsession:** the bleed at 2 hearts or less, with charged hits healing 2 hearts only while you bleed.
  - **Bared** (Hare's Foot): its -2 armor.
  - **Fever** (set bonus): Hare's Foot's sprint-jump burst also gives 250 Desire, and an Embrace made at full Desire starts no cooldown.
  - **Tiers:** tier 2 after 10 Embraces that land, tier 3 after 15 kills while bleeding. Tier 2 Embraces reach 8 blocks and bleed-heals add a burst of Regeneration (about 1.5 hearts more). Tier 3 Embraces give Weakness I for 3s, but you start bleeding at 3 hearts.
  - Blood Pact Blades made before the rework get Embrace the first time you hold them.

- **Envy** — Falconer's Recurve + Watcher's Lens.
  - **Covet:** hitting the player you're locked onto steals every buff they have (at its level) for 7s.
  - **Falcon Volley** now uses the sin weapon cooldown (still 14s).
  - **Tunnel Vision:** Darkness (instead of the old Blindness, only re-applied once it wears off) and Slowness II while locked on.
  - **Mark** (Watcher's Lens) now also gives Weakness I for its 10s, and the Marked creature takes +2 damage from your hits.
  - **Green Eye** (Watcher's Lens): -1 armor for each player within 16 blocks with more health than you (max -4).
  - **Spite** (set bonus): creatures you Marked with the Lens lock on at once, and stolen buffs last twice as long.
  - **Tiers:** tier 2 after 20 hits on your locked target, tier 3 after 10 kills on it (counted with the bow in your main hand). Tier 2 locks on in 0.5s and stolen buffs last 10s. Tier 3 Covets mobs too, draining 1 HP from them to you, but locking on slows you with Slowness III.
- **Swiftwind is retired.** Its Momentum lives on as Lust's Desire; the item, its recipes and its effects moved to `unused/` (the game ignores that folder). Existing Swiftwinds become plain diamond swords with their old stats.

**One sin at a time:** carrying charms of two different sins turns every sin charm off until you drop one.

**Separate cooldowns:** each sin weapon's ability and each sin charm's proc has its own cooldown, so one sin item never puts another on cooldown.

Items made before the rework keep working as tier 1.

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
| **Berserker Token** · *Sin of Wrath* | Wither Skeleton Skull / Ghast Tears / Redstone Blocks | Kill a Wither or drop to 2 hearts | Ghast Tear + Enchanted Golden Apple | At 4 hearts or less: 8s Battle Frenzy (Strength I, Speed I, Night Vision); charged hits heal 2 hearts (3s cooldown). Then a 3s Slowness/Weakness crash. Recharges in 60s. |
| **Abyssal Pearl** | Conduit / Nautilus Shells / Sea Lanterns | Loot shipwreck treasure or get prismarine shards/crystals | Heart of the Sea + Bucket of Pufferfish | In water: Water Breathing, Dolphin's Grace, Night Vision while submerged, land-speed mining. Double-tap Jump in water for an 8-block dash (5s cooldown). |
| **Molten Core** | Blaze Rod / Magma Blocks / Nether Bricks | Enter the Nether or get a Blaze Rod | Magma Cream + Lava Bucket | Fire Resistance. In lava: Speed II and slow Regeneration. Melee attackers take 2 fire damage and catch fire (1s cooldown). Nearby fireballs fizzle; flaming arrows are snuffed. |
| **Void Talisman** | Sculk Catalyst / Echo Shards / Crying Obsidian | Enter the End or loot an Ancient City chest | Echo Shard + Chorus Fruit | Falling into the void returns you to safe ground (120s cooldown). Sneak in low light for 2s to turn Invisible; standing up, attacking or getting hurt breaks it. |
| **Alchemist Catalyst** | Brewing Stand / Golden Carrots / Amethyst Clusters | Brew a potion or get an Amethyst Cluster | Amethyst Shard + Honey Bottle | Cleanses Poison, Wither, Slowness, Weakness, Mining Fatigue, Darkness and Blindness into brief buffs (15s cooldown); leaves Blood Pact / World Breaker drawbacks alone. Beneficial potions (drunk, splash or lingering) last 50% longer (max 8 min). Carrying 3+ brewed potions: +1 max heart. |
| **Phoenix Plume** · *Sin of Pride* | Totem of Undying / Blaze Rods / Gold Blocks | Use a Totem of Undying | Blaze Powder + Golden Apple | At 2 hearts or less: Rebirth - Regeneration III 4s, Absorption II 8s, Fire Resistance 8s and a 4-damage ring of fire (5 min cooldown). **Downside:** -2 max hearts for 60s afterwards. |
| **Merchant's Sigil** | Emerald Block / Gold Ingots / Books | Trade with a villager | Emerald + Bell | Hero of the Village I and Luck I while carried; +3 XP per villager trade (5s cooldown). **Downside:** illagers and raiders within 16 blocks get Speed I. |
| **Watcher's Lens** · *Sin of Envy* | Ender Eye / Amethyst Shards / Glass Panes | Get a Spyglass or kill an Enderman | Spyglass + Phantom Membrane | Mobs targeting you within 16 blocks glow. Scope a creature for 1s to Mark it for 10s: Glowing, Weakness I, and +2 damage from your hits (20s cooldown). **Downside:** marking makes you glow for 3s. |
| **Verdant Sprig** | Moss Block / Oak Saplings / Vines | Get Moss or a sapling | Stick + Glow Berries | On grass, moss or leaves under open sky: 1 HP every 5s. Sneaking there gives +50% knockback resistance. **Downside:** Hunger I after 60s without open sky. |
| **Stormcaller Coil** | Lightning Rod / Copper Blocks / Redstone | Get a Lightning Rod or be in a thunderstorm | Copper Ingot + Glowstone Dust | Sprinting builds Static; at 100% your next charged hit adds +4 armor-piercing lightning damage and Slowness II for 1s. Speed I in the rain. **Downside:** in thunderstorms, a 1-in-5 chance every 30s of being struck for 3. |
| **Deepdelver Lamp** | Lantern / Glow Ink Sacs / Raw Iron | Get deepslate or loot a mineshaft chest | Glowstone Dust + Amethyst Shard | Night Vision below Y 40 in the dark. Sneak still for 2s: ores within 6 blocks glow for 5s (30s cooldown). **Downside:** you glow to other players while underground. |
| **Reaper's Knuckle** | Skeleton Skull / Bone Blocks / Soul Sand | Kill a Skeleton or Zombie | Bone + Echo Shard | Each kill adds 1 max heart (max 4, 45s) and heals it; a player kill gives all 4. **Downside:** undead deal +1 damage to you. |
| **Hare's Foot** · *Sin of Lust* | Rabbit Hide / Carrots / Feathers | Get a Rabbit's Foot | Rabbit's Foot + Sugar | Jump Boost I and +10% speed; a sprint-jump gives a 1.5s Speed II burst (4s cooldown). **Downside:** -2 armor. |
| **Hearthstone** | Campfire / Coal Blocks / Bread | Get cooked food | Charcoal + Baked Potato | Eating gives Saturation I for 2s; near a lit campfire, furnace or smoker you get Regeneration I. **Downside:** hunger drains ~20% faster. |
| **Wayfarer's Compass** | Recovery Compass / Maps / Gold Ingots | Sleep in a bed or use a respawn anchor | Compass + Ender Pearl | Sneak still for 3s to recall to your bed or respawn anchor (same dimension, 10 min cooldown). **Downside:** each recall costs 5 levels. |
| **Prism Mirror** | Glass / Quartz Blocks / Amethyst Shards | Get Nether Quartz | Nether Quartz + Glass Pane | Projectiles that hit you reflect 30% of their damage at the shooter; every 15s one projectile hit is healed straight back. **Downside:** melee hits deal +1 damage to you. |
| **Predator's Fang** | Goat Horn / Bones / Flint | Kill a Wolf, Fox or Ocelot | Flint + Rotten Flesh | Charged hits on targets below 30% health deal +3 damage; kills that way give Speed I for 3s. **Downside:** -2 max health. |
| **Moonlit Pendant** | Phantom Membrane / Iron Ingots / Glowstone Dust | Kill a Phantom or be outside at midnight | Firework Star + Nether Star | At night under open sky: Strength I and Night Vision, plus Speed I on a full moon. Any Overworld night (roof or not): +2 max hearts, which start empty and vanish at dawn. **Downside:** Slowness I and -10% attack speed in daylight. |
| **Tinker's Whetstone** | Anvil / Iron Ingots / Flint | Get an Anvil or Grindstone | Brick + Grindstone | Mends your held item by 1 durability every 5s. Sneak still for 2s with a weapon: +1 attack damage for 20s (60s cooldown). **Downside:** -10% attack speed. |
| **Enderbrace** | Chorus Flower / Ender Pearls / Popped Chorus Fruit | Eat Chorus Fruit or enter the End | Popped Chorus Fruit + Shulker Shell | Double-tap Sneak: blink up to 10 blocks where you look, never into blocks (12s cooldown). **Downside:** 2 damage every 2s in water or rain. |
| **Angler's Lure** | Fishing Rod / String / Lily Pads | Catch anything with a fishing rod | Lily Pad + Tropical Fish | Holding a fishing rod: Luck II. Each catch restores 1 hunger and has a 20% chance of a second catch. **Downside:** Slowness I while holding a fishing rod. |
| **Harvester's Sheaf** | Composter / Hay Bales / Bone Meal | Breed animals or get a Hay Bale | Wheat + Golden Carrot | Crops within 5 blocks of you grow about twice as fast. Animals you breed have a 25% chance of twins. **Downside:** -1 attack damage. |
| **Plunderer's Coin** · *Sin of Greed* | Gold Block / Emeralds / Gold Nuggets | Loot a Buried Treasure or Bastion chest | Gold Nugget + Rabbit's Foot | Mobs you kill have a 25% chance to drop their loot twice (Looting counts, bosses excluded) and drop 50% more experience. **Downside:** each mob kill costs 1 hunger point. |
| **Slayer's Tally** | Book and Quill / Bones / Iron Ingots | Kill a hostile mob | Paper + Ink Sac | Each hostile kill notches its kind (zombies, skeletons, spiders, creepers, endermen, blazes, piglins, illagers, slimes, other): +2% damage against that kind, up to +30%. Never against players. **Downside:** dying wipes the tally. |
| **Beastmaster's Whistle** | Goat Horn / Leads / Steak | Tame an animal | Lead + Name Tag | Your tamed wolves within 24 blocks get Resistance I and +3 damage against mobs; your wolves, cats and parrots regenerate 1 HP a second after 5s without damage. Sneak still for 1s to recall all your pets in this dimension (60s cooldown). **Downside:** Weakness I for 30s when one of your pets dies. |
| **Wardlight Lantern** | Soul Lantern / Candles / Gold Ingots | Kill or cure a Zombie Villager | Soul Lantern + Golden Apple | Hostile mobs can't spawn naturally within 16 blocks of you (spawners, raids and named mobs still work). Undead within 6 blocks take 1 damage every 2s and glow. **Downside:** Night Vision has no effect on you. |

Charms are still their base item underneath, so don't put one in a crafting grid or brewing stand: it would be used up like a normal feather, ghast tear, etc.

## Uninstalling

Run `/function kandy:uninstall`, then `/datapack disable` the pack.
