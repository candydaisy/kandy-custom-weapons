# Custom Weapons & Charms (Ideas)

This directory contains design documents for custom weapons and passive charms for the **Kandy Custom Weapons** data pack.

Each item is crafted through the signature two-step system:
1. **Core Crafting:** 3×3 crafting table grid with rare materials.
2. **Smithing Forge:** Smithing table pairing Core + Base Item + Catalyst.

## Progress

Design docs for items already reworked into the Seven Sins are in [unused/](unused/); the current design is [seven_sins.md](seven_sins.md).

**In the pack:** all eleven weapons from this folder (plus the original Swiftwind, now retired, Dagger of Lingering Souls, Blood Pact Blade and World Breaker) and all 27 charms.

**Everything in this folder is in the pack.** The six PvE-only charms (Angler's Lure, Harvester's Sheaf, Plunderer's Coin, Slayer's Tally, Beastmaster's Whistle, Wardlight Lantern) never affect players or PvP damage. They and the five newest weapons (Chainwarden Arbalest, Falconer's Recurve, Lifebloom Staff, Oathbound Warhorn, Dragoon's Wyrmspear) are untested in game so far.

The original weapons have no docs here; their latest changes:
- **World Breaker:** the sneak pull (Event Horizon) now lasts up to 5s with a 25s cooldown instead of running for as long as you sneak, and the midair sneak-attack slam deals +6 damage.
- **Sin weapons** (Pyroclast, Dragoon's Wyrmspear, Chainwarden Arbalest, Blood Pact Blade): each active ability now has its own cooldown instead of one shared by all sin weapons. Sin charms too: Phoenix Plume's Rebirth and Berserker Token's Frenzy no longer share a cooldown.
- **Blood Pact Blade:** while it bleeds you (2 hearts or less), each charged hit heals 2 hearts.

Pyroclast Cleaver shipped with a few changes from its design doc, mostly for PvP balance:
- 10 attack damage (not 11), 0.9 attack speed, 6s shield disable, Fire Resistance while held.
- +10% Heat per hit (not 20%); bonus fire damage +1 / +2 at 50%+ / +3 in Overdrive (not +2 / +4).
- Overdrive lasts 6s (not 8s) and gives Speed I only (no Strength); eruptions deal 4 damage (not 6).
- Magma Fissure: sneak + jump-attack only (sneaking cancels sprint), 8 damage / 16 with 50% Heat (not 12 / 24), 10s cooldown (not 6s).
- The Core is a structure block that looks like a magma block, so a plain magma block can't be used to forge it.
- Death message uses vanilla "burned to a crisp" text, and the molten blade is shown with particles; custom text or textures would need a resource pack.

The other five weapons also changed from their docs:
- **Tempest Pike:** chain hits 2 targets within 6 blocks for 3 (not 3 / 8 / 4); Skyward Wrath is called with a sneaking charged melee hit or any thrown hit (detecting a sneak-throw wasn't reliable, so every throw counts while it's ready) and strikes the nearest other creature near your target instead of an aimed spot; Gale Surge is a fresh Jump press after 0.2s in the air (a trident's right-click is the throw), 6 blocks with a 4s cooldown (not 10 blocks / 3s); Skyward Wrath does 8 within 3 blocks on a 10s cooldown (not 14 / 4 / 6s) and the bolt is particles and thunder only, since a real bolt starts fires and converts mobs; +0.5 reach (not +1).
- **Frostveil Scythe:** diamond hoe only; 8 damage (not 8.5), +0.5 entity reach; -10% speed per stack instead of Slowness I-IV; Frozen Solid lasts 1.5s (not 2.5s) with a 5s re-freeze immunity, and frozen targets can still attack; Shatter is a flat 6 true damage + 3 splash (not +150% + 5); Frost Nova 5 blocks, 4 damage, +2 stacks, 8s cooldown (not 6 / 6 / +3 / 5s); ice spikes are particles only.
- **Eclipse Longbow:** arrows pierce up to 3 targets with vanilla damage +15% (not infinite pierce with 10 void damage); Darkness 1s on full-draw hits only; vortex 5 blocks, 2.5s, weak pull on players, 1 per pulse, 6 implosion, 12s cooldown (not 8 / 3.5s / full pull / 2 / 12 / 8s); Shadow Warp has a 10s cooldown (not 4s), only lands on safe spots, and doesn't keep momentum.
- **Chronos Stiletto:** 6 damage at 1.8 speed (not 7 at 2.0), +5% speed (not +10%); Paradox is 1.5 per stiletto hit, max 3 stacks (not 40% of all damage taken); rewind heals up to about 4 HP (player health can't be set directly), doesn't restore hunger, and has a 20s cooldown (not 15s); stasis on players is a 1s heavy slow, and frozen projectiles / buffered damage aren't implemented.
- **Abyssal Bulwark:** a datapack can't detect raising or releasing a shield, so Parry is "tap Sneak just before a blocked melee hit" and Tidal Surge is "Sneak + Jump"; Parry staggers with Slowness IV + Weakness II for 2s instead of a full stun, and doesn't re-enable a disabled shield (axes disable it for half as long instead); Resistance is capped at II (the doc's +1 per charge reached Resistance V, full immunity); surge 4/7/10 damage, ~90 degree cone, 7 blocks, 8s cooldown (not 6/12/20, 120 degrees, 8 blocks, no cooldown); knockback resistance +0.25, armor toughness +2 (not +0.4 / +3).

The 15 newer charms mostly follow their docs; the main differences:
- **Phoenix Plume:** the ring of fire uses vanilla `in_fire` damage, so fire-immune mobs ignore it.
- **Merchant's Sigil:** trade XP goes straight to you; the downside uses the vanilla `#minecraft:raiders` tag (includes ravagers and witches).
- **Watcher's Lens:** Hunter's Sense reveals any mob targeting you (angry wolves and golems too, never players); the creeper warning plays for targeting creepers within 5 blocks, since fuse state isn't readable.
- **Verdant Sprig / Moonlit Pendant / Enderbrace / Stormcaller Coil:** "under open sky" uses `can_see_sky`; weather is global, so rain checks also pass in deserts while it rains elsewhere.
- **Stormcaller Coil:** the discharge works on any charged hit (dealt 6+), and the storm strike is visual only.
- **Deepdelver Lamp:** ore outlines are visible to nearby players too.
- **Reaper's Knuckle:** souls are real max hearts (+1 per soul, up to 4) for 45s, each filled with a short Regeneration, instead of Absorption hearts for 30s.
- **Moonlit Pendant:** also gives +2 max hearts (4 health) through any Overworld night, roofed or not, so the doc's Nether Star catalyst pays off; the new hearts start empty.
- **Hare's Foot:** the Speed II burst is a +40% speed attribute for exactly 1.5s.
- **Hearthstone:** Regeneration near a hearth is topped up only when absent (~1 HP per 3-4s); food is detected with a tag of vanilla foods.
- **Prism Mirror / Predator's Fang:** damage taken is measured from health, and the extra damage is credited to you.
- **Tinker's Whetstone:** unlocks on getting an anvil or grindstone rather than using one.
- Cores use spawn eggs of low-value mobs (squid, bat, silverfish, endermite, cod, salmon, tropical fish, pufferfish, glow squid, frog, tadpole, chicken, rabbit, pig, sheep, axolotl) as templates.

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
| **Tempest Pike** | Implemented | Trident | Storms & Static Electricity | Heart of the Sea + Lightning Rods | Charged and thrown hits chain lightning to 2 nearby foes, Gale Surge midair dash (4s), sneak-hit or thrown Skyward Wrath bolt (10s). | [tempest_pike.md](tempest_pike.md) |
| **Frostveil Scythe** | Implemented | Diamond Hoe | Permafrost & Cryomancy | Blue Ice + Packed Ice + Snow | Hypothermia stacks (-10% speed each), Frozen Solid at 5 stacks, 6 true-damage Shatter, sneak-attack Frost Nova (8s). | [frostveil_scythe.md](frostveil_scythe.md) |
| **Eclipse Longbow** | Implemented | Bow | Void Singularity & Shadow | Ender Eye + Crying Obsidian + Pearls | Arrows pierce 3 targets for +15%, full-draw Singularity Arrow vortex (12s), Shadow Warp to your arrow (10s, costs 2 HP). | [eclipse_longbow.md](eclipse_longbow.md) |
| **Pyroclast Cleaver** | Implemented | Netherite Axe | Volcanic Rupture & Magma | Respawn Anchor + Blaze Rods + Magma Cream | Heat gauge (+10% per hit), 6s Overdrive at 100% with eruptions, sneak + jump-attack Magma Fissure (10s), Overheat crash. | [pyroclast_cleaver.md](unused/pyroclast_cleaver.md) (old design, reworked into Sin of Wrath, see [seven_sins.md](seven_sins.md)) |
| **Chronos Stiletto** | Implemented | Golden Sword | Time Dilation & Chronomancy | Recovery Compass + Clocks + Amethyst | Paradox delayed true damage (1.5 per stack, max 3), Temporal Anchor & Rewind (20s), crit Chrono Stasis. | [chronos_stiletto.md](chronos_stiletto.md) |
| **Abyssal Bulwark** | Implemented | Shield | Ocean Depths & Guard Counter | Sponge + Dark Prismarine + Prismarine Crystals | Blocking stores Pressure (max 5) and Resistance, Sneak-tap Parry stagger (4s), Sneak + Jump Tidal Surge cone (8s). | [abyssal_bulwark.md](unused/abyssal_bulwark.md) (old design, reworked into Sin of Sloth, see [seven_sins.md](seven_sins.md)) |
| **Chainwarden Arbalest** | Implemented | Crossbow | Chains & Grappling | Lodestone + Iron Chains + Tripwire Hooks | Bolts Shackle; a bolt hit Tethers (4s), Sneak to Reel it in or yourself to heavy targets; Grapple to a bolt in a block. | [chainwarden_arbalest.md](unused/chainwarden_arbalest.md) (old design, reworked into Sin of Greed, see [seven_sins.md](seven_sins.md)) |
| **Falconer's Recurve** | Implemented | Bow | Falconry & Homing | Spyglass + Arrows + Feathers | Lock On while drawing, homing full-draw arrows (-15% damage), sneak-shot Falcon Volley; Blindness + Slowness II while locked. | [falconers_recurve.md](unused/falconers_recurve.md) (old design, reworked into Sin of Envy, see [seven_sins.md](seven_sins.md)) |
| **Lifebloom Staff** | Implemented | Golden Hoe | Healer | Golden Apple + Glistering Melon + Flowering Azalea | Instant right-click Mending Pulse, hold for a 10s Sanctuary aura that follows you, charged hits on mobs heal your most hurt teammate. Team only. | [lifebloom_staff.md](lifebloom_staff.md) |
| **Oathbound Warhorn** | Implemented | Goat Horn | Support / Buffer | Bell + White Banners + Gold Ingots | War Cry (Strength III + Speed III, 10s), sneak Rally (cleanse + Resistance III, 10s), 90s shared. Team only. | [oathbound_warhorn.md](oathbound_warhorn.md) |
| **Dragoon's Wyrmspear** | Implemented | Netherite Spear | Dragoon / Spear | Dragon's Breath + Phantom Membranes + End Rods | Puncture stacks on jabs, charge hits Skewer, Sneak + Jump Leap, hold Sneak to Dive. | [dragoon_wyrmspear.md](unused/dragoon_wyrmspear.md) (old design, reworked into Sin of Pride, see [seven_sins.md](seven_sins.md)) |

---

## Custom Charms & Talismans

Charms are passive trinkets functioning when carried in the inventory (`container.*`) or in the offhand (`weapon.offhand`).

| Charm | Status | Base Item | Category / Focus | Key Powers & Effects Preset | Document |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Zephyr Charm** | Implemented | Feather | Fall Damage Immunity & Wind | **Zero Fall Damage:** fall damage is removed entirely.<br>**Kinetic Shockwave:** landing from 12+ blocks bursts for 4 damage and knockback (3s cooldown).<br>**Aerial Glide:** sneak while falling to slow your descent. | [charm_zephyr_feather.md](charm_zephyr_feather.md) |
| **Berserker Token** | Implemented | Ghast Tear | Last-stand Frenzy & Lifesteal | **Battle Frenzy:** at 4 hearts or less, 8s of Strength I, Speed I and Night Vision.<br>**Vampirism:** charged hits during Frenzy heal 2 hearts (3s cooldown).<br>**Crash:** 3s of Slowness and Weakness afterwards; recharges in 60s. | [charm_berserker_token.md](unused/charm_berserker_token.md) (old design, reworked into Sin of Wrath, see [seven_sins.md](seven_sins.md)) |
| **Abyssal Pearl** | Implemented | Heart of the Sea | Oceanic Mastery | **Aquatic:** Water Breathing and Dolphin's Grace in water, Night Vision while submerged.<br>**Aqua Haste:** mine underwater as fast as on land.<br>**Bubble Burst:** double-tap Jump in water for an 8-block dash (5s cooldown). | [charm_abyssal_pearl.md](charm_abyssal_pearl.md) |
| **Molten Core** | Implemented | Magma Cream | Fire & Lava Mastery | **Thermal Immunity:** Fire Resistance while carried.<br>**Thermal Surge:** in lava, Speed II and slow Regeneration.<br>**Molten Retaliation:** melee attackers take 2 fire damage and catch fire (1s cooldown).<br>**Cinder Ward:** nearby fireballs fizzle, flaming arrows are snuffed. | [charm_molten_core.md](charm_molten_core.md) |
| **Void Talisman** | Implemented | Echo Shard | Void Protection & Stealth | **Void Rescue:** falling into the void (below Y -70 in the Overworld, Y -6 in the Nether, Y -10 in the End) returns you to safe ground (120s cooldown).<br>**Shadow Cloak:** sneak in low light for 2s to turn Invisible; standing up, attacking or getting hurt breaks it. | [charm_void_talisman.md](charm_void_talisman.md) |
| **Alchemist Catalyst** | Implemented | Amethyst Shard | Debuff Cleansing & Potions | **Transmutation:** cleanses Poison, Wither, Slowness, Weakness, Mining Fatigue, Darkness and Blindness into brief buffs (15s cooldown).<br>**Potion Potency:** beneficial potions last 50% longer (max 8 min).<br>**Reserve:** carrying 3+ brewed potions gives +1 max heart. | [charm_alchemist_catalyst.md](charm_alchemist_catalyst.md) |
| **Phoenix Plume** | Implemented | Blaze Powder | Last Stand & Rebirth | **Rebirth:** at 2 hearts, a healing surge (Regen III, Absorption II, Fire Resistance) and a 4-damage ring of fire (5 min cooldown).<br>**Downside:** -2 max hearts for 60s afterwards. | [charm_phoenix_plume.md](unused/charm_phoenix_plume.md) (old design, reworked into Sin of Pride, see [seven_sins.md](seven_sins.md)) |
| **Merchant's Sigil** | Implemented | Emerald | Trade & Fortune | **Guild Favor:** Hero of the Village I and Luck I while carried.<br>**Haggler's Bonus:** +3 XP per villager trade.<br>**Downside:** nearby illagers get Speed I. | [charm_merchant_sigil.md](charm_merchant_sigil.md) |
| **Watcher's Lens** | Implemented | Spyglass | Awareness & Target Marking | **Hunter's Sense:** mobs targeting you glow.<br>**Mark:** scope a creature for 1s to make it glow for 10s (20s cooldown).<br>**Downside:** marking makes you glow for 3s. | [charm_watchers_lens.md](unused/charm_watchers_lens.md) (old design, reworked into Sin of Envy, see [seven_sins.md](seven_sins.md)) |
| **Verdant Sprig** | Implemented | Stick | Nature's Mending & Rooted Stance | **Photosynthesis:** 1 HP every 5s on natural ground under open sky.<br>**Rooted Stance:** sneaking there gives +50% knockback resistance.<br>**Downside:** Hunger I after 60s without sky. | [charm_verdant_sprig.md](unused/charm_verdant_sprig.md) (old design, reworked into Sin of Sloth, see [seven_sins.md](seven_sins.md)) |
| **Stormcaller Coil** | Implemented | Copper Ingot | Static Charge & Storm Riding | **Static:** sprinting charges your next hit for +4 armor-piercing lightning damage and Slowness II.<br>**Storm Rider:** Speed I in rain.<br>**Downside:** 20% chance per 30s of being struck for 3 in thunderstorms. | [charm_stormcaller_coil.md](charm_stormcaller_coil.md) |
| **Deepdelver Lamp** | Implemented | Glowstone Dust | Underground Sight & Ore Pinging | **Cave Eyes:** Night Vision below Y 40 in the dark.<br>**Ore Ping:** sneak still 2s to outline ores within 6 blocks for 5s (30s cooldown).<br>**Downside:** you glow to other players while underground. | [charm_deepdelver_lamp.md](charm_deepdelver_lamp.md) |
| **Reaper's Knuckle** | Implemented | Bone | Soul Harvest | **Soul Harvest:** each kill gives +1 max heart (max 4) for 45s, filled with a short Regeneration; player kills give all 4.<br>**Downside:** undead deal +1 damage to you. | [charm_reapers_knuckle.md](charm_reapers_knuckle.md) |
| **Hare's Foot** | Implemented | Rabbit's Foot | Fleet-footed Agility | **Fleet Foot:** Jump Boost I and +10% speed.<br>**Hop Burst:** sprint-jumping gives Speed II for 1.5s (4s cooldown).<br>**Downside:** -2 armor. | [charm_hares_foot.md](unused/charm_hares_foot.md) (old design, reworked into Sin of Lust, see [seven_sins.md](seven_sins.md)) |
| **Hearthstone** | Implemented | Charcoal | Well-fed Warmth | **Hearty Meals:** eating gives Saturation I for 2s.<br>**Hearthside:** Regeneration I near a lit campfire, furnace or smoker.<br>**Downside:** hunger drains ~20% faster. | [charm_hearthstone.md](unused/charm_hearthstone.md) (old design, reworked into Sin of Gluttony, see [seven_sins.md](seven_sins.md)) |
| **Wayfarer's Compass** | Implemented | Compass | Homeward Recall | **Homeward Recall:** sneak still 3s to teleport to your bed/anchor in the same dimension (10 min cooldown).<br>**Downside:** each recall costs 5 levels. | [charm_wayfarers_compass.md](charm_wayfarers_compass.md) |
| **Prism Mirror** | Implemented | Nether Quartz | Projectile Reflection | **Reflection:** shooters take 30% of the projectile damage you take.<br>**Glancing Facet:** every 15s, one projectile hit is negated.<br>**Downside:** melee hits deal +1 damage to you. | [charm_prism_mirror.md](charm_prism_mirror.md) |
| **Predator's Fang** | Implemented | Flint | Execute the Wounded | **Execution:** +3 damage on charged hits vs targets below 30% health.<br>**Bloodscent:** execute kills give Speed I for 3s.<br>**Downside:** -2 max health. | [charm_predators_fang.md](charm_predators_fang.md) |
| **Moonlit Pendant** | Implemented | Firework Star | Night Hunter | **Moonlight:** Strength I and Night Vision at night under open sky; Speed I during a full moon.<br>**Night Vigor:** +2 max hearts through any Overworld night.<br>**Downside:** Slowness I and -10% attack speed in daylight. | [charm_moonlit_pendant.md](charm_moonlit_pendant.md) |
| **Tinker's Whetstone** | Implemented | Brick | Field Repairs | **Field Mending:** +1 durability every 5s on your held item.<br>**Sharpen:** sneak still 2s for +1 attack damage for 20s (60s cooldown).<br>**Downside:** -10% attack speed. | [charm_tinkers_whetstone.md](charm_tinkers_whetstone.md) |
| **Enderbrace** | Implemented | Popped Chorus Fruit | Short-range Blink | **Blink:** double-tap Sneak to teleport up to 10 blocks where you look (12s cooldown).<br>**Downside:** 2 damage every 2s in water or rain. | [charm_enderbrace.md](charm_enderbrace.md) |
| **Angler's Lure** | Implemented | Lily Pad | Fishing (PvE-only) | **Lucky Waters:** Luck II with a rod in hand.<br>**Double Catch:** 20% chance of a second catch.<br>**Shore Lunch:** each catch restores 1 hunger.<br>**Downside:** Slowness I while holding a rod. | [charm_anglers_lure.md](charm_anglers_lure.md) |
| **Harvester's Sheaf** | Implemented | Wheat | Farming (PvE-only) | **Green Thumb:** crops within 5 blocks grow about twice as fast.<br>**Twin Births:** 25% chance of twins when breeding.<br>**Downside:** -1 attack damage. | [charm_harvesters_sheaf.md](charm_harvesters_sheaf.md) |
| **Plunderer's Coin** | Implemented | Gold Nugget | Mob Loot (PvE-only) | **Double Plunder:** 25% chance a mob drops its loot twice (not bosses).<br>**Spoils:** +50% mob experience.<br>**Downside:** each mob kill costs 1 hunger. | [charm_plunderers_coin.md](unused/charm_plunderers_coin.md) (old design, reworked into Sin of Greed, see [seven_sins.md](seven_sins.md)) |
| **Slayer's Tally** | Implemented | Paper | Monster Hunting (PvE-only) | **Notches:** +2% damage per kill against that kind of mob, up to +30%; shown on a boss bar.<br>**Downside:** dying wipes the tally. | [charm_slayers_tally.md](charm_slayers_tally.md) |
| **Beastmaster's Whistle** | Implemented | Lead | Pets (PvE-only) | **Pack Leader:** wolves within 24 blocks get Resistance I and +3 damage vs mobs; calm pets regenerate.<br>**Recall:** sneak still 1s to bring all your pets (60s cooldown).<br>**Downside:** Weakness I for 30s when a pet dies. | [charm_beastmasters_whistle.md](charm_beastmasters_whistle.md) |
| **Wardlight Lantern** | Implemented | Soul Lantern | Monster Ward (PvE-only) | **Hallowed Ground:** no natural hostile spawns within 16 blocks.<br>**Searing Light:** undead within 6 blocks take 1 damage every 2s and glow.<br>**Downside:** Night Vision doesn't work on you. | [charm_wardlight_lantern.md](charm_wardlight_lantern.md) |

---

## Datapack Technical Integration
All items follow the same architecture:
- Checked each tick via `data/kandy/function/holders.mcfunction` using `custom_data~{ability:"..."}` or `{charm:"..."}`.
- Supports passive inventory carriers (`kandy.inv.*`) and active hand holders (`kandy.main.*`).
- Hit abilities fire from a `player_hurt_entity` advancement gated on `damage.dealt` (about 85% of full-charge damage) and `blocked: false`, so only fully charged, unblocked hits count.
- Extra damage that must land in the same tick as the hit uses a custom damage type in `#minecraft:bypasses_cooldown` (e.g. `kandy:magma`). Damage types only load when the world is opened, not on `/reload`.
- Every weapon needs `give` and `give_core` functions and a line in `kandy:menu` so it shows up in the chat menu.
- Charms are detected in `holders.mcfunction` as `kandy.charm.<key>` (inventory or offhand); each charm has `setup`, `tick`, `uninstall`, `give` and `give_core` functions wired into load/tick/uninstall.
