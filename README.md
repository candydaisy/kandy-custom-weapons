# kandy-custom-weapons

A custom weapons data pack for Minecraft Java Edition 26.1 – 26.3 (data pack format 101 – 121).

## Installing

Drop the pack folder (or zip) into your world's `datapacks` folder and run `/reload`.

## Weapons

Get a weapon with `/function kandy:<weapon>/give`.

| Weapon | Command | Ability |
| --- | --- | --- |
| **Swiftwind** (diamond sword) | `kandy:swiftwind/give` | Sprinting builds Momentum (0–1000). 250+: Speed while carried. 500+: +2 reach while held. 750+: +0.5 attack speed while held. Momentum slowly drains when you stop. |
| **Dagger of Lingering Souls** (golden sword) | `kandy:lingering_soul/give` | Every hit leaves an echo on the target that deals 5 extra damage a second later. Echoes stack. |
| **Blood Pact Blade** (netherite sword) | `kandy:bloodpact/give` | +3 attack damage. Every hit costs you 2 HP and gives brief Absorption. Carrying it at low health brings Slowness (≤5 hearts), Weakness (≤4) and Darkness (≤3). At 2 hearts or less it bleeds you 1 HP per second while held. |
| **World Breaker** (mace) | `kandy:worldbreaker/give` | Hits drag enemies toward you for 3 seconds. Sneak while holding it to pull nearby entities in (you're slowed). Sneak-attack while airborne to slam the target down. |

## Uninstalling

Run `/function kandy:uninstall`, then `/datapack disable` the pack.
