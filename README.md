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

Operators can also skip crafting: `/function kandy:menu` opens a clickable chat menu that hands out every weapon, charm and core, or use `/function kandy:<weapon>/give` and `/function kandy:<weapon>/give_core` directly.

Weapon abilities only trigger on fully charged hits that aren't blocked by a shield, so spam-clicking won't apply them.

## Weapons

| Weapon | Command | Ability |
| --- | --- | --- |
| **Swiftwind** (diamond sword) | `kandy:swiftwind/give` | Sprinting builds Momentum (0–1000). 250+: Speed while carried. 500+: +1 reach while held. 750+: +0.3 attack speed while held. Momentum slowly drains when you stop. |
| **Dagger of Lingering Souls** (golden sword) | `kandy:lingering_soul/give` | Every charged hit leaves an echo on the target that deals 3 armor-piercing damage a second later. Echoes stack up to 3. |
| **Blood Pact Blade** (netherite sword) | `kandy:bloodpact/give` | 10 attack damage (+2 over netherite). Every charged hit costs you 2 HP; brief Absorption comes back only after the last dose wears off. Carrying it at low health brings Slowness (≤5 hearts), Weakness (≤4) and Darkness (≤3). At 2 hearts or less it bleeds you 1 HP per second while held. |
| **World Breaker** (mace) | `kandy:worldbreaker/give` | Charged hits drag enemies toward you for 3 seconds. Sneak while holding it to pull nearby entities in (you're slowed). Sneak-attack while airborne to slam the target down. |
| **Pyroclast Cleaver** (netherite axe) | `kandy:pyroclast/give` | 10 attack damage, 0.9 attack speed, disables shields for 6s, Fire Resistance while held. Charged hits build Heat (+10% per hit, cools 5%/s) and deal +1 fire damage (+2 at 50%+ Heat). At 100% Heat: 6s of Overdrive — Speed, +3 fire damage, swings cleave everything in front, and every hit erupts for 4 damage around the target and sets the floor alight. Sneak + jump-attack: Magma Fissure (10s cooldown) tears 10 blocks of ground ahead, dealing 8 damage, launching and melting armor (-20% for 5s); spends 50% Heat for double damage. |

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

## Uninstalling

Run `/function kandy:uninstall`, then `/datapack disable` the pack.
