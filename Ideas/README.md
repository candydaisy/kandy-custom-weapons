# Custom Weapons, Charms & PvP Utilities (Ideas)

This directory contains design documents for custom weapons, passive charms and tactical PvP utilities for the **Kandy Custom Weapons** data pack.

Each item is crafted through the signature two-step system:
1. **Core Crafting:** 3×3 crafting table grid with rare materials.
2. **Smithing Forge:** Smithing table pairing Core + Base Item + Catalyst.

## Progress

**In the pack:** all six weapons from this folder (plus the original Swiftwind, Dagger of Lingering Souls, Blood Pact Blade and World Breaker) and all six charms.

**Everything in this folder is now in the pack**, including the six Tactical PvP Utilities. The PvP utilities are **untested in game** so far.

Pyroclast Cleaver shipped with a few changes from its design doc, mostly for PvP balance:
- 10 attack damage (not 11), 0.9 attack speed, 6s shield disable, Fire Resistance while held.
- +10% Heat per hit (not 20%); bonus fire damage +1 / +2 at 50%+ / +3 in Overdrive (not +2 / +4).
- Overdrive lasts 6s (not 8s) and gives Speed I only (no Strength); eruptions deal 4 damage (not 6).
- Magma Fissure: sneak + jump-attack only (sneaking cancels sprint), 8 damage / 16 with 50% Heat (not 12 / 24), 10s cooldown (not 6s).
- The Core is a structure block that looks like a magma block, so a plain magma block can't be used to forge it.
- Death message uses vanilla "burned to a crisp" text, and the molten blade is shown with particles; custom text or textures would need a resource pack.

The other five weapons also changed from their docs:
- **Tempest Pike:** chain hits 2 targets within 6 blocks for 3 (not 3 / 8 / 4); Skyward Wrath is called with a sneaking charged melee hit (detecting a sneak-throw wasn't reliable) and strikes the nearest other creature near your target instead of an aimed spot; Gale Surge is a fresh Jump press after 0.2s in the air (a trident's right-click is the throw), 6 blocks with a 4s cooldown (not 10 blocks / 3s); Skyward Wrath does 8 within 3 blocks on a 10s cooldown (not 14 / 4 / 6s) and the bolt is particles and thunder only, since a real bolt starts fires and converts mobs; +0.5 reach (not +1).
- **Frostveil Scythe:** diamond hoe only; 8 damage (not 8.5), +0.5 entity reach; -10% speed per stack instead of Slowness I-IV; Frozen Solid lasts 1.5s (not 2.5s) with a 5s re-freeze immunity, and frozen targets can still attack; Shatter is a flat 6 true damage + 3 splash (not +150% + 5); Frost Nova 5 blocks, 4 damage, +2 stacks, 8s cooldown (not 6 / 6 / +3 / 5s); ice spikes are particles only.
- **Eclipse Longbow:** arrows pierce up to 3 targets with vanilla damage +15% (not infinite pierce with 10 void damage); Darkness 1s on full-draw hits only; vortex 5 blocks, 2.5s, weak pull on players, 1 per pulse, 6 implosion, 12s cooldown (not 8 / 3.5s / full pull / 2 / 12 / 8s); Shadow Warp has a 10s cooldown (not 4s), only lands on safe spots, and doesn't keep momentum.
- **Chronos Stiletto:** 6 damage at 1.8 speed (not 7 at 2.0), +5% speed (not +10%); Paradox is 1.5 per stiletto hit, max 3 stacks (not 40% of all damage taken); rewind heals up to about 4 HP (player health can't be set directly), doesn't restore hunger, and has a 20s cooldown (not 15s); stasis on players is a 1s heavy slow, and frozen projectiles / buffered damage aren't implemented.
- **Abyssal Bulwark:** a datapack can't detect raising or releasing a shield, so Parry is "tap Sneak just before a blocked melee hit" and Tidal Surge is "Sneak + Jump"; Parry staggers with Slowness IV + Weakness II for 2s instead of a full stun, and doesn't re-enable a disabled shield (axes disable it for half as long instead); Resistance is capped at II (the doc's +1 per charge reached Resistance V, full immunity); surge 4/7/10 damage, ~90 degree cone, 7 blocks, 8s cooldown (not 6/12/20, 120 degrees, 8 blocks, no cooldown); knockback resistance +0.25, armor toughness +2 (not +0.4 / +3).

The PvP utilities also changed from their docs, mostly toned down for PvP or limited by what a datapack can do (there's no team system, so "allies" means only the user):
- **Shadow Smoke Grenade:** snowball only; 3-block radius for 5s (not 3.5 / 6s); Blindness 1s refreshed inside, no Darkness; can't hide nameplates or hit indicators; 12s item cooldown; 4 per forge.
- **Entanglement Bola:** thrown as a snowball that looks like a lead (a lead can't be thrown); 1.5s heavy slow + no jumping instead of a 2.5s full root, with 4s re-snare immunity; elytra fliers are grounded with Levitation + Slow Falling; Pearl Lock destroys and refunds pearls for 3s, since items can't be put on cooldown by command; no bow-draw block; 14s cooldown; 3 per forge.
- **Barbed Caltrops:** a stack of consumable caltrops (4 per forge) instead of a 3-charge pouch; 2 damage (not 3) and 1 HP/s bleed (not 2); 12s fields (not 15s), max 2 per player; -35% speed via an attribute instead of Slowness III; no boot durability loss.
- **Bloodhound's Whistle:** 20 blocks (not 30), Glowing 5s (not 8s), 30s cooldown (not 25s); re-invisibility blocked for 4s, not permanently; the trail is a 4s straight line only you see; Pack Rush is Speed II on the user only.
- **Decay Dart:** 3 true damage through shields (not 5); no shield disable (it can't be set by command); Necrosis lasts 4s (not 6s) and works by taking back any health regained; golden apple Absorption isn't halved; totems keep a weakened Regeneration I; 4 per forge; bow/crossbow ammo only.
- **Repulsor Mine:** the item is a breeze rod that looks like a wind charge (a real wind charge throws on right-click); one vanilla wind burst instead of hurling targets 10 blocks; 5 damage (not 8); 3-block trigger (not 4); no Respawn Anchor trigger; ground only; max 2 per player with a 2-minute lifetime; pickup by sneaking on it; 2 per forge.
- Utility cores are spawn eggs for low-value mobs (squid, bat, silverfish, endermite, cod, salmon), shown as the doc's item; using one as an egg loses the core.

The charms also changed from their docs, mostly toned down for PvP or limited by what a datapack can do:
- **Zephyr:** fall immunity via the fall_damage_multiplier attribute; glide via a gravity modifier while sneaking; shockwave 4 damage (not 6) with vanilla wind-charge knockback, 3s cooldown, hits players too.
- **Berserker:** Strength I + Speed I for 8s (not Strength II / Speed II / Haste II / Resistance I for 12s); lifesteal is Instant Health once per 3s on charged hits; 60s cooldown from trigger.
- **Abyssal Pearl:** mining speed via the submerged_mining_speed attribute (not Haste II); no Conduit Power; dash 8 blocks with a 5s cooldown (not 12 blocks / 3s).
- **Molten Core:** retaliation 2 damage + 4s fire with a 1s cooldown (not 4 damage + 6s); players can't be set on fire by commands; flaming arrows are extinguished, not deleted.
- **Void Talisman:** End Ward (enderman pacification) left out, it can't be done reliably; rescue cooldown 120s (not 60s); Overworld threshold Y -70 (not -60, which is inside bedrock); cloak needs a 2s sneak and breaks on attacking or taking damage.
- **Alchemist Catalyst:** weaker, shorter converted buffs with a 15s cooldown; Weakness is only cleansed (never becomes Strength); potion extension capped at 8 min; the Absorption heart became +1 max heart; Aura of Vitality dropped.
- Every core uses its own unobtainable item as the smithing template so a plain vanilla item can't forge it. Some cores (Molten Core, Alchemist, and the five newer weapons) use blocks that can be placed in survival, which loses the core but never drops a usable template.

---

## Custom Weapons

| Weapon | Status | Base Item | Theme / Element | Core Crafting | Playstyle & Signature Skill | Document |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Tempest Pike** | Implemented | Trident | Storms & Static Electricity | Heart of the Sea + Lightning Rods | Chain lightning on hit, Gale Surge aerial dash, Skyward Wrath lightning strike. | [tempest_pike.md](tempest_pike.md) |
| **Frostveil Scythe** | Implemented | Diamond Hoe / Axe | Permafrost & Cryomancy | Blue Ice + Packed Ice + Snow | Hypothermia freeze stacks, Frozen Solid immobilization, Shatter execution crit, Frost Nova ring. | [frostveil_scythe.md](frostveil_scythe.md) |
| **Eclipse Longbow** | Implemented | Bow | Void Singularity & Shadow | Ender Eye + Crying Obsidian + Pearls | Infinite piercing void arrows, Event Horizon black hole vortex, mid-air Shadow Warp teleport. | [eclipse_longbow.md](eclipse_longbow.md) |
| **Pyroclast Cleaver** | Implemented | Netherite Axe | Volcanic Rupture & Magma | Respawn Anchor + Blaze Rods + Magma | Heat Gauge mechanic, 100% Heat Overdrive mode, Magma Fissure ground eruptor. | [pyroclast_cleaver.md](pyroclast_cleaver.md) |
| **Chronos Stiletto** | Implemented | Golden Sword | Time Dilation & Chronomancy | Recovery Compass + Clocks + Amethyst | Paradox delayed wound burst, Temporal Anchor & Rewind snapshot, Chrono Stasis time-freeze. | [chronos_stiletto.md](chronos_stiletto.md) |
| **Abyssal Bulwark** | Implemented | Shield | Ocean Depths & Guard Counter | Sponge/Conduit + Dark Prismarine | Kinetic pressure charge accumulation, 0.35s Perfect Parry stagger, Tidal Surge cone blast. | [abyssal_bulwark.md](abyssal_bulwark.md) |

---

## Custom Charms & Talismans

Charms are passive trinkets functioning when carried in the inventory (`container.*`) or in the offhand (`weapon.offhand`).

| Charm | Status | Base Item | Category / Focus | Key Powers & Effects Preset | Document |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Zephyr Charm** | Implemented | Feather | Fall Damage Immunity & Wind | **Zero Fall Damage:** Fall distance is continuously nullified.<br>**Kinetic Shockwave:** Falls >12 blocks detonate a breeze blast on landing.<br>**Aerial Glide:** Sneak while falling to slow descent. | [charm_zephyr_feather.md](charm_zephyr_feather.md) |
| **Berserker Token** | Implemented | Ghast Tear | Combat Preset & Lifesteal | **Battle Frenzy Preset:** Triggered when HP ≤40%: grants Strength II, Speed II, Haste II, Resistance I, Night Vision for 12s.<br>**Vampirism:** +1.5 hearts heal on melee hits during frenzy.<br>**Exhaustion:** 45s cooldown with brief adrenaline crash. | [charm_berserker_token.md](charm_berserker_token.md) |
| **Abyssal Pearl** | Implemented | Heart of the Sea | Oceanic Mastery & Drowning | **Aquatic Preset:** Permanent Water Breathing, Night Vision, & Dolphin's Grace submerged.<br>**Aqua Haste:** Mine underwater as fast as on land.<br>**Bubble Burst:** Double-jump swimming dash. | [charm_abyssal_pearl.md](charm_abyssal_pearl.md) |
| **Molten Core** | Implemented | Magma Cream | Fire & Lava Immunity | **Thermal Immunity:** Complete immunity to Fire, Magma, and Lava.<br>**Thermal Surge:** Lava immersion grants Speed II and Regeneration I.<br>**Molten Retaliation:** Melee attackers are set ablaze for 6 seconds.<br>**Cinder Ward:** Burns incoming projectiles. | [charm_molten_core.md](charm_molten_core.md) |
| **Void Talisman** | Implemented | Echo Shard | Void Protection & Stealth | **Void Rescue:** Falling into the Void (< Y -40 End, < Y -60 Overworld) teleports you back to surface safety.<br>**End Ward:** Endermen never aggro on gaze.<br>**Shadow Cloak:** Sneaking in low light (<5) grants Invisibility. | [charm_void_talisman.md](charm_void_talisman.md) |
| **Alchemist Catalyst** | Implemented | Amethyst Shard | Status Debuff Inversion | **Toxin Transmutation:** Inverts harmful debuffs into buffs (Poison → Regen, Wither → Absorption, Slowness → Speed, Weakness → Strength).<br>**Potion Potency:** +50% duration on all beneficial potions. | [charm_alchemist_catalyst.md](charm_alchemist_catalyst.md) |

---

## Tactical PvP Utilities

> **Untested:** these are implemented but haven't been tested in game yet.

Specialized combat utilities engineered to disrupt enemy positioning, counter meta strategies (shields, end crystals, elytra dives, and golden apple healing spam).

| Utility | Status | Base Item | PvP Role | Core Crafting | Key Mechanics & Counterplay | Document |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Shadow Smoke Grenade** | Implemented | Snowball / Potion | Obscurity & Anti-Pearl | Wither Rose + Gunpowder | **Smoke Veil:** 7×7 blind/darkness screen.<br>**Anti-Pearl:** Intercepts & kills passing ender pearls in mid-air.<br>**Cleanse:** Clears glowing effects on allies. | [pvp_smoke_grenade.md](pvp_smoke_grenade.md) |
| **Entanglement Bola** | Implemented | Lead | Anti-Elytra & Rooting | Iron Bars + Chains | **Ground Root:** Immobility (stops sprinting/jumping) for 2.5s.<br>**Anti-Elytra Grounder:** Instantly forces gliding fliers to land.<br>**Pearl Lock:** Puts enemy ender pearls on 3s cooldown. | [pvp_entanglement_bola.md](pvp_entanglement_bola.md) |
| **Barbed Caltrops Pouch** | Implemented | Iron Nugget / Dripstone | Area Denial & Anti-Sprint | Pointed Dripstone + Iron Bars | **Hazard Field:** 5×5 ground perimeter lasting 15s.<br>**Puncture:** 3 armor-piercing damage + Slowness III.<br>**Cripple Bleed:** Sprinting while crippled deals 2 bleed damage/sec. | [pvp_caltrops.md](pvp_caltrops.md) |
| **Bloodhound's Whistle** | Implemented | Goat Horn | Anti-Stealth & Hunting | Sculk Sensor + Amethyst | **Sonar Scan:** Strips Invisibility and applies Glowing for 8s in a 30-block sphere.<br>**Blood Trail:** Directional particle path to lowest-HP runner.<br>**Pack Rush:** Grants allies Speed II. | [pvp_tracking_whistle.md](pvp_tracking_whistle.md) |
| **Decay Dart** | Implemented | Spectral Arrow | Anti-Heal & Shield Piercing | Fermented Spider Eye + Poison Potato | **Shield Phasing:** Bypasses shields completely with 5 true damage and disables shield for 3s.<br>**Necrosis:** Shuts down all potion, gapple, & saturation healing for 6s.<br>**Totem Diminisher:** Halves totem bonus HP. | [pvp_decay_dart.md](pvp_decay_dart.md) |
| **Repulsor Mine** | Implemented | Wind Charge / Plate | Anti-Crystal & Kinetic Blast | Crying Obsidian + Breeze Rods | **Anti-Crystal:** Vaporizes placed End Crystals safely.<br>**Kinetic Repulse:** Hurls rushers 10 blocks backward.<br>**Projectile Deflector:** Reflects incoming arrows back at shooters. | [pvp_repulsor_mine.md](pvp_repulsor_mine.md) |

---

## Datapack Technical Integration
All items follow the same architecture:
- Checked each tick via `data/kandy/function/holders.mcfunction` using `custom_data~{ability:"..."}`, `{charm:"..."}` or (for PvP utilities) `{utility:"..."}`.
- Supports passive inventory carriers (`kandy.inv.*`) and active hand holders (`kandy.main.*`).
- Hit abilities fire from a `player_hurt_entity` advancement gated on `damage.dealt` (about 85% of full-charge damage) and `blocked: false`, so only fully charged, unblocked hits count.
- Extra damage that must land in the same tick as the hit uses a custom damage type in `#minecraft:bypasses_cooldown` (e.g. `kandy:magma`). Damage types only load when the world is opened, not on `/reload`.
- Every weapon needs `give` and `give_core` functions and a line in `kandy:menu` so it shows up in the chat menu.
- Charms are detected in `holders.mcfunction` as `kandy.charm.<key>` (inventory or offhand); each charm has `setup`, `tick`, `uninstall`, `give` and `give_core` functions wired into load/tick/uninstall.
