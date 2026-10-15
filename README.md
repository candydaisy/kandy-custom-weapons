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

Operators can also skip crafting with `/function kandy:<weapon>/give`.

## Weapons

| Weapon | Command | Ability |
| --- | --- | --- |
| **Swiftwind** (diamond sword) | `kandy:swiftwind/give` | Sprinting builds Momentum (0–1000). 250+: Speed while carried. 500+: +2 reach while held. 750+: +0.5 attack speed while held. Momentum slowly drains when you stop. |
| **Dagger of Lingering Souls** (golden sword) | `kandy:lingering_soul/give` | Every hit leaves an echo on the target that deals 5 extra damage a second later. Echoes stack. |
| **Blood Pact Blade** (netherite sword) | `kandy:bloodpact/give` | +3 attack damage. Every hit costs you 2 HP and gives brief Absorption. Carrying it at low health brings Slowness (≤5 hearts), Weakness (≤4) and Darkness (≤3). At 2 hearts or less it bleeds you 1 HP per second while held. |
| **World Breaker** (mace) | `kandy:worldbreaker/give` | Hits drag enemies toward you for 3 seconds. Sneak while holding it to pull nearby entities in (you're slowed). Sneak-attack while airborne to slam the target down. |

## Uninstalling

Run `/function kandy:uninstall`, then `/datapack disable` the pack.
