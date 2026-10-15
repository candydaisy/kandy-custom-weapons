# Custom Weapons & Charms Design Directory (Ideas)

This directory contains complete design documents for new custom weapons and passive charms tailored specifically for the **Kandy Custom Weapons** data pack framework.

Each weapon and charm is crafted through the signature two-step system:
1. **Core Crafting:** 3×3 crafting table grid with rare materials.
2. **Smithing Forge:** Smithing table pairing Core + Base Item + Catalyst.

## Progress

**In the pack:** Swiftwind, Dagger of Lingering Souls, Blood Pact Blade, World Breaker, and **Pyroclast Cleaver** (the first design from this folder to be built).

**Not started:** the other five weapons and all six charms below.

Pyroclast Cleaver shipped with a few changes from its design doc, mostly for PvP balance:
- 10 attack damage (not 11), 0.9 attack speed, 6s shield disable, Fire Resistance while held.
- +10% Heat per hit (not 20%); bonus fire damage +1 / +2 at 50%+ / +3 in Overdrive (not +2 / +4).
- Overdrive lasts 6s (not 8s) and gives Speed I only (no Strength); eruptions deal 4 damage (not 6).
- Magma Fissure: sneak + jump-attack only (sneaking cancels sprint), 8 damage / 16 with 50% Heat (not 12 / 24), 10s cooldown (not 6s).
- The Core is a structure block that looks like a magma block, so a plain magma block can't be used to forge it.
- Death message uses vanilla "burned to a crisp" text, and the molten blade is shown with particles; custom text or textures would need a resource pack.

---

## Custom Weapons

| Weapon | Status | Base Item | Theme / Element | Core Crafting | Playstyle & Signature Skill | Document |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Tempest Pike** | Planned | Trident | Storms & Static Electricity | Heart of the Sea + Lightning Rods | Chain lightning on hit, Gale Surge aerial dash, Skyward Wrath lightning strike. | [tempest_pike.md](tempest_pike.md) |
| **Frostveil Scythe** | Planned | Diamond Hoe / Axe | Permafrost & Cryomancy | Blue Ice + Packed Ice + Snow | Hypothermia freeze stacks, Frozen Solid immobilization, Shatter execution crit, Frost Nova ring. | [frostveil_scythe.md](frostveil_scythe.md) |
| **Eclipse Longbow** | Planned | Bow | Void Singularity & Shadow | Ender Eye + Crying Obsidian + Pearls | Infinite piercing void arrows, Event Horizon black hole vortex, mid-air Shadow Warp teleport. | [eclipse_longbow.md](eclipse_longbow.md) |
| **Pyroclast Cleaver** | Implemented | Netherite Axe | Volcanic Rupture & Magma | Respawn Anchor + Blaze Rods + Magma | Heat Gauge mechanic, 100% Heat Overdrive mode, Magma Fissure ground eruptor. | [pyroclast_cleaver.md](pyroclast_cleaver.md) |
| **Chronos Stiletto** | Planned | Golden Sword | Time Dilation & Chronomancy | Recovery Compass + Clocks + Amethyst | Paradox delayed wound burst, Temporal Anchor & Rewind snapshot, Chrono Stasis time-freeze. | [chronos_stiletto.md](chronos_stiletto.md) |
| **Abyssal Bulwark** | Planned | Shield | Ocean Depths & Guard Counter | Sponge/Conduit + Dark Prismarine | Kinetic pressure charge accumulation, 0.35s Perfect Parry stagger, Tidal Surge cone blast. | [abyssal_bulwark.md](abyssal_bulwark.md) |

---

## Custom Charms & Talismans

Charms are passive trinkets functioning when carried in the inventory (`container.*`) or in the offhand (`weapon.offhand`).

| Charm | Status | Base Item | Category / Focus | Key Powers & Effects Preset | Document |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Zephyr Charm** | Planned | Feather | Fall Damage Immunity & Wind | **Zero Fall Damage:** Fall distance is continuously nullified.<br>**Kinetic Shockwave:** Falls >12 blocks detonate a breeze blast on landing.<br>**Aerial Glide:** Sneak while falling to slow descent. | [charm_zephyr_feather.md](charm_zephyr_feather.md) |
| **Berserker Token** | Planned | Ghast Tear | Combat Preset & Lifesteal | **Battle Frenzy Preset:** Triggered when HP ≤40%: grants Strength II, Speed II, Haste II, Resistance I, Night Vision for 12s.<br>**Vampirism:** +1.5 hearts heal on melee hits during frenzy.<br>**Exhaustion:** 45s cooldown with brief adrenaline crash. | [charm_berserker_token.md](charm_berserker_token.md) |
| **Abyssal Pearl** | Planned | Heart of the Sea | Oceanic Mastery & Drowning | **Aquatic Preset:** Permanent Water Breathing, Night Vision, & Dolphin's Grace submerged.<br>**Aqua Haste:** Mine underwater as fast as on land.<br>**Bubble Burst:** Double-jump swimming dash. | [charm_abyssal_pearl.md](charm_abyssal_pearl.md) |
| **Molten Core** | Planned | Magma Cream | Fire & Lava Immunity | **Thermal Immunity:** Complete immunity to Fire, Magma, and Lava.<br>**Thermal Surge:** Lava immersion grants Speed II and Regeneration I.<br>**Molten Retaliation:** Melee attackers are set ablaze for 6 seconds.<br>**Cinder Ward:** Burns incoming projectiles. | [charm_molten_core.md](charm_molten_core.md) |
| **Void Talisman** | Planned | Echo Shard | Void Protection & Stealth | **Void Rescue:** Falling into the Void (< Y -40 End, < Y -60 Overworld) teleports you back to surface safety.<br>**End Ward:** Endermen never aggro on gaze.<br>**Shadow Cloak:** Sneaking in low light (<5) grants Invisibility. | [charm_void_talisman.md](charm_void_talisman.md) |
| **Alchemist Catalyst** | Planned | Amethyst Shard | Status Debuff Inversion | **Toxin Transmutation:** Inverts harmful debuffs into buffs (Poison → Regen, Wither → Absorption, Slowness → Speed, Weakness → Strength).<br>**Potion Potency:** +50% duration on all beneficial potions. | [charm_alchemist_catalyst.md](charm_alchemist_catalyst.md) |

---

## Datapack Technical Integration
Both weapons and charms adhere to the same architecture:
- Checked each tick via `data/kandy/function/holders.mcfunction` using `custom_data~{charm:"..."}` or `{ability:"..."}`.
- Supports passive inventory carriers (`kandy.inv.*`) and active hand holders (`kandy.main.*`).
- Hit abilities fire from a `player_hurt_entity` advancement gated on `damage.dealt` (about 85% of full-charge damage) and `blocked: false`, so only fully charged, unblocked hits count.
- Extra damage that must land in the same tick as the hit uses a custom damage type in `#minecraft:bypasses_cooldown` (e.g. `kandy:magma`). Damage types only load when the world is opened, not on `/reload`.
- Every weapon needs `give` and `give_core` functions and a line in `kandy:menu` so it shows up in the chat menu.
- Charms will need their own `charm` checks added to `holders.mcfunction`; none exist yet.
