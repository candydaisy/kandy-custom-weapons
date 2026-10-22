# Seven Deadly Sins revamp (design draft, not implemented)

Status: **approved**. Implemented: **Wrath**, **Pride**, **Greed**, **Lust** (shared `sin/` core, quarrel rule). Swiftwind retired into `unused/`. Other sins: not started.

Implementation notes (where the build differs from the spec below):
- Added a `kandy.<sin>.wi` tag (weapon carried anywhere) so the HUD keeps showing the cleaver's bars while it's in your inventory.
- `kandy.wt` is read on demand (on hit / Overdrive) via `sin/tier`, not every tick, since reading it means reading the player's NBT.
- Recipe and advancement-unlock ids (`kandy:pyroclast`, `kandy:pyroclast_core`, `kandy:berserker`...) are kept so existing worlds keep their unlocked recipes. Only the forged item's `custom_data` changed.
- Hit advancements use two OR'd criteria (new key, old key): 26.3 rejects an `any_of` list in a criterion's `player` field.
- The quarrel rule is in (`kandy.n` counts sin charms carried); the player gets one chat message when it starts.
- Each sin weapon has its own active cooldown (`kandy.cd.<sin>`, with `kandy.cdmax.<sin>` holding the length it was started with, for the HUD bar), so swapping sin weapons gives you another ready active. Charm procs work the same way: `kandy.ccd.<sin>` / `kandy.ccdmax.<sin>` (Rebirth, Frenzy).
- Deeds go through one shared `sin/deed` helper. Pride: tier 2 after 15 Dives that hit, tier 3 after 10 Dive kills.
- Greed: tier 2 after 15 Reels, tier 3 after 25 kills on creatures you Tethered. Its set bonus counts the arbalest in either hand (crossbows live in the offhand a lot). Grapple keeps its own 8s cooldown; only Tether uses `kandy.cd.greed`. Gilded Weight's tier 3 cap applies while a tier 3 arbalest is carried anywhere.
- Lust: tier 2 after 10 Embraces that land, tier 3 after 15 kills while bleeding. Embrace lands for 4 damage (the spec gave none). Tier 2's "heal 3 hearts" is the 2-heart instant heal plus Regeneration IV for 1s (about 1.5 hearts), since instant health only heals in 2-heart steps. Old blades are migrated (sin keys + right-click component) the first time they're held. Hare's Foot's hop burst keeps its own 4s cooldown.
- Weapon give functions take no arguments (tier 1); `give_tier {tier:N}` gives another tier.
- `sin/tier` reads tiers with item checks (main hand first, then offhand) instead of player NBT.
- Above Them's bonus is 15% / 25% of the spear's attack damage attribute (enchantments not included).
- **Tiers are deed-based, not smithing.** A smithing tier-up recipe can't require the *forged* weapon (ingredients match item id only), so a plain item + Core + catalyst would skip to tier 2. Instead each weapon counts deeds in its own `custom_data.deeds` and rewrites its tier and lore when it levels. The per-sin "catalyst" items in section 2 are therefore unused. Wrath: tier 2 after 10 Overdrives, tier 3 after 30 Overdrive kills.

Facts this is built on (read from the pack, not assumed):
- Minecraft 26.3, `pack.mcmeta` `min_format 101` / `max_format 121`.
- Items are told apart by `custom_data`: weapons `{ability:"Pyroclast"}`, charms `{charm:"Berserker",type:"talisman"}`.
- Detection: `kandy:holders` tags `kandy.main.<item>` (mainhand) and `kandy.inv.<item>` (anywhere) every tick.
- Triggers: on-hit = `advancement/hit/<item>.json` (`player_hurt_entity` with a per-weapon minimum damage, so only charged hits count). Right-click = `consumable` component + a `using_item` advancement (Chronos, Lifebloom). Everything else is sneak/jump state checked in each item's `tick`.
- Cooldowns: one scoreboard per skill (`pyro_cd`, `bers_cd`, ...; 247 objectives in total), each with its own HUD boss bar.

---

## 1. Mapping: existing item -> sin

One weapon and one charm per sin, all taken from items you already have. Nothing has to be built from nothing.

| Sin | Weapon (existing) | Why | Charm (existing) | Why |
| --- | --- | --- | --- | --- |
| **Pride** | Dragoon's Wyrmspear | You leap above everyone and strike down. "Pride comes before a fall" is the Dive. | Phoenix Plume | Refuses to die. Rebirth is pride that won't accept defeat. |
| **Greed** | Chainwarden Arbalest | Shackle, Tether, Reel: you chain things up and drag them in. "Mine." | Plunderer's Coin | Double loot, more XP. Hoarding. |
| **Lust** | Blood Pact Blade **+ Swiftwind's Momentum** | Craves the rush: stronger near death, heals only while bleeding. Swiftwind's chase meter becomes *Desire*. | Hare's Foot | The hare is the classic lust symbol. Speed and leaps, and the −2 armor is "exposed". |
| **Envy** | Falconer's Recurve | Fixates on one rival (Lock On) and goes blind to everything else. | Watcher's Lens | The jealous eye: watching, marking, being watched back. |
| **Gluttony** | Dagger of Lingering Souls | Devours souls, and every echo already costs you hunger. | Hearthstone | Food buffs, hunger drains faster. Literally gluttony. |
| **Wrath** | Pyroclast Cleaver | Heat builds with every blow, Overdrive, then the Overheat crash. Rage and burnout. | Berserker Token | Frenzy at low HP, then a crash. |
| **Sloth** | Abyssal Bulwark | Stand still, block, let them come. Heavy. | Verdant Sprig | Lounging in the grass to heal. |
| *Melancholy* (hidden) | Frostveil Scythe | Cold, numbness, slowing everything, and the chill slows you too. | Moonlit Pendant | Strong at night, weak in daylight. |
| *Vanity* (hidden) | Chronos Stiletto | Rewind undoes the wound before anyone sees it. Refusing to let time mark you. | Prism Mirror | A mirror. Glass is fragile (+1 melee damage taken). |

**Sins with no item yet:** none. Lust's weapon is a merge (Blood Pact + Swiftwind's Momentum). Three charms need a **new curse** because their current downside isn't sin-shaped: Pride (Phoenix), Greed (Plunderer's), Sloth (Verdant's Hunger-without-sky).

### Items that fit no sin

| Item | Suggestion |
| --- | --- |
| Swiftwind | **Retire the item, keep the code.** `momentum.mcfunction` becomes Lust's Desire meter. Two items running the same mechanic would be redundant. |
| Reaper's Knuckle | **Keep the item, reuse the code.** Its kill → max-heart logic becomes Gluttony's set bonus ("Feast"). |
| World Breaker | **Keep as a Relic** (unthemed). It's the pack's original flagship and its closest sin (Pride) is already taken by a better fit. |
| Tempest Pike, Eclipse Longbow | **Keep as Relics.** They're elemental, not sinful. No work needed. |
| Lifebloom Staff, Oathbound Warhorn | **Keep as Relics.** Sins are selfish, these are team support. (If you ever want a mirror set, they're natural seeds for the Seven Virtues.) |
| The other 18 charms (Zephyr, Abyssal Pearl, Molten Core, Void, Alchemist, Merchant, Stormcaller, Deepdelver, Wayfarer, Predator's Fang, Tinker's, Enderbrace and the six PvE charms) | **Keep as Trinkets** (unthemed utility). Cutting them gains nothing, and they don't touch the sin system. |

"Relic" and "Trinket" are just labels for the menu and README. They keep their current code and `custom_data`.

---

## 2. Sin specs

Shared rules:
- **Held** = weapon in mainhand (Bulwark: either hand, as now). **Carried** = charm anywhere in inventory or offhand (as now).
- **Set bonus** = sin weapon held + same-sin charm carried, both any tier. Bonuses scale with the *lower* of the two tiers.
- **One sin at a time:** carrying charms of two different sins turns off **all** sin charm effects ("the sins quarrel"). Relics and Trinkets are unaffected. This stops cross-sin stacking, which is the biggest balance risk.
- **Tiers:** T1 = the item as forged. T2/T3 = forge it again at a smithing table (that sin's Core as template + the item + the catalyst listed). Each tier raises the power **and** deepens the drawback.
- Numbers marked *(existing)* are what the pack does today. Everything else is new.

### Pride: Dragoon's Wyrmspear · Phoenix Plume
- **Identity:** You strike from above and refuse to fall, until you do.
- **Weapon** (netherite spear, 6 dmg *(existing)*)
  - Passive: **Above Them**: +15% damage to targets at least 2 blocks below you.
  - On-hit: Puncture stacks +1 dmg (max 3), Skewer −15% armor + Slowness II on held-charge hits *(existing)*.
  - Active: **Dragoon Leap → Dive**, 6 dmg in 3 blocks *(existing)*.
  - Cooldown: 23s *(existing)*.
- **Charm** (Phoenix Plume)
  - Buff: **Rebirth** at ≤2 hearts, 5 min cooldown *(existing)*.
  - Curse: **Never Retreat**: Slowness I while below half health. Pride won't run.
- **Drawback: The Fall.** Slowness III 2s after a Dive *(existing)*. New: a Dive that hits nothing deals the fall damage you skipped to you. Pride comes before a fall.
- **Set: Ascendant.** Rebirth resets the Leap cooldown. Each Dive kill takes 30s off Rebirth's cooldown.
- **Tiers:** T2 (catalyst: Phantom Membrane): Leap ~5→7 blocks, Dive 6→8. T3 (Nether Star): Above Them +25%, Dive leaves Slowness I on hit enemies for 3s. Drawback: missed Dives deal **double** the skipped fall damage.
- **Look:** `end_rod` + `dragon_breath` on Dive; `entity.ender_dragon.flap` on Leap, `entity.generic.explode` (pitch 1.4) on landing; name color **#9B59FF** fading to **#E8C547** (violet to gold).

### Greed: Chainwarden Arbalest · Plunderer's Coin
- **Identity:** Everything in reach is yours. You just have to drag it home.
- **Weapon** (crossbow)
  - Passive: **Pilfer**: bolt hits steal 1 XP level from players (you get it). Mobs drop +1 XP orb.
  - On-hit: Shackle, Slowness I 2s *(existing)*.
  - Active: **Tether → Reel** *(existing)*. Grapple stays as the no-Tether fallback *(existing)*.
  - Cooldown: 10s from Tether end *(existing)*.
- **Charm** (Plunderer's Coin)
  - Buff: 25% double loot, +50% mob XP *(existing)*.
  - Curse: **Gilded Weight**: −5% movement speed per 64 valuables carried (`#kandy:valuables` = gold/emerald/diamond ingots, nuggets, blocks), max −25. *Replaces* the current hunger cost.
- **Drawback: Can't Let Go.** −15% speed while Tethered *(existing)*. New: switching off the arbalest mid-Tether snaps the chain and doubles the cooldown.
- **Set: Compound Interest.** Mobs that die while Tethered *always* double-drop (bosses still excluded). Reeled players lose 1 extra level to Pilfer.
- **Tiers:** T2 (Gold Block): Tether 4→6s, Pilfer 1→2 levels. T3 (Nether Star): Tether chains to a second creature within 4 blocks. Drawback: Gilded Weight cap −25% → −35%.
- **Look:** `wax_on` + `electric_spark` along the chain; `block.chain.place` on Tether, `entity.item.pickup` on Pilfer; name **#FFCC00** to **#B8860B**.

### Lust: Blood Pact Blade · Hare's Foot
- **Identity:** You crave the rush of the chase and the bleeding edge, and can't stop once you start.
- **Weapon** (netherite sword, 10 dmg *(existing)*)
  - Passive: **Desire** (Swiftwind's Momentum, 0–1000, built by sprinting). 500+: +1 reach. 1000: Speed I. Low-HP Strength *(existing)*.
  - On-hit: brief Absorption *(existing)*. While bleeding, each charged hit heals 2 hearts *(existing)*.
  - Active: **Embrace**: right-click to lunge up to 6 blocks at the creature you're looking at. Costs 500 Desire. (Reuses Tempest's Gale Surge dash.)
  - Cooldown: 12s.
- **Charm** (Hare's Foot)
  - Buff: Jump Boost I, +10% speed, sprint-jump Speed II burst *(existing)*.
  - Curse: **Bared**: −2 armor *(existing, renamed)*.
- **Drawback: Obsession.** At ≤2 hearts you bleed 1 HP/s *(existing)*, and the blade only heals you *while* you bleed, which pulls you toward death. Taking a hit drains 250 Desire *(existing, from Swiftwind)*.
- **Set: Fever.** Hare's sprint-jump burst also gives +250 Desire. At 1000 Desire your next Embrace has no cooldown.
- **Tiers:** T2 (Glistering Melon): Embrace 6→8 blocks, bleed heal 2→3 hearts. T3 (Nether Star): Embrace hit gives Weakness I 3s. Drawback: bleed starts at ≤3 hearts instead of ≤2.
- **Look:** `heart` + `dust{color:[1.0,0.2,0.5]}`; `entity.player.breath` on Embrace, `block.sculk_vein.break` while bleeding; name **#FF4FA3** to **#9E0B3F**.

### Envy: Falconer's Recurve · Watcher's Lens
- **Identity:** You fixate on one rival until you take what they have.
- **Weapon** (bow)
  - Passive: **Lock On**, 0.75s *(existing)*.
  - On-hit: homing arrows at −15% damage *(existing)*. New **Covet**: hitting your locked player steals one positive effect from them (Strength, Speed, Resistance, Regeneration, Absorption, Jump Boost) and gives it to you for 5s.
  - Active: **Falcon Volley** *(existing)*.
  - Cooldown: 14s *(existing)*.
- **Charm** (Watcher's Lens)
  - Buff: mobs targeting you glow, Mark *(existing)*.
  - Curse: **Green Eye**: −1 armor for each player within 16 blocks who has more health than you (max −4).
- **Drawback: Tunnel Vision.** Blindness + Slowness II while locked *(existing)*. Locking a player makes you glow 3s *(existing)*.
- **Set: Spite.** Lens-Marked targets lock instantly. Covet steals 2 effects.
- **Tiers:** T2 (Emerald Block): Lock 0.75→0.5s, stolen effect 5→8s. T3 (Nether Star): Covet also works on mobs (steals 1 HP per hit). Drawback: Slowness II → III while locked.
- **Look:** `happy_villager` + `dust{color:[0.3,0.7,0.3]}` on Covet; `entity.elder_guardian.curse` (quiet, pitch 1.6) on Lock; name **#4CAF50** to **#1B5E20**.

### Gluttony: Dagger of Lingering Souls · Hearthstone
- **Identity:** You devour souls and food alike, and you are never full.
- **Weapon** (golden sword, 6 dmg, 2.0 speed *(existing)*)
  - Passive: Soul Spread *(existing)*.
  - On-hit: Echo, 3 armor-piercing dmg 1s later, stacks to 4 *(existing)*.
  - Active: **Devour**: right-click to cash in every echo on creatures within 6 blocks at once, and get +1 hunger per echo eaten.
  - Cooldown: 15s.
- **Charm** (Hearthstone)
  - Buff: Saturation on eating, Regeneration near fires *(existing)*.
  - Curse: hunger drains ~20% faster *(existing)*.
- **Drawback: Insatiable.** Each echo that lands costs ½ hunger *(existing)*. Your weapon starves you, and your charm makes you hungrier.
- **Set: Feast.** Kills add +1 max heart for 45s, max 4 (Reaper's Knuckle code). Devour also gives Saturation I 2s.
- **Tiers:** T2 (Cake): echo 3→4 dmg, stacks 4→5. T3 (Nether Star): Soul Spread 5→8 blocks, Devour heals 1 HP per echo. Drawback: echo hunger cost ½ → 1.
- **Look:** `soul` + `sculk_soul`; `entity.generic.eat` on Devour, `particle.soul_escape` on echo; name **#FF8C1A** to **#8B4513**.

### Wrath: Pyroclast Cleaver · Berserker Token
- **Identity:** Rage builds with every blow until it burns out, and burns you.
- **Weapon** (netherite axe, 10 dmg *(existing)*)
  - Passive: Heat (+10%/hit, no cooldown), Fire Resistance while held *(existing)*.
  - On-hit: +1/+2 fire damage. At 100%: Overdrive *(existing)*.
  - Active: **Magma Fissure** *(existing)*.
  - Cooldown: 10s *(existing)*.
- **Charm** (Berserker Token)
  - Buff: Battle Frenzy at ≤4 hearts *(existing)*.
  - Curse: Slowness/Weakness crash after Frenzy *(existing)*.
- **Drawback: Burnout.** Overheat after Overdrive: Slowness, Mining Fatigue, no Fire Resistance for 4s *(existing)*.
- **Set: Blind Fury.** Taking damage gives +5% Heat. Frenzy instantly fills Heat to 100%. Both crashes can land at once, and that's the point.
- **Tiers:** T2 (Blaze Rod): Overdrive 6→8s, eruption 4→5. T3 (Nether Star): eruptions chain once to a second creature within 4 blocks. Drawback: Overheat 4→6s and it sets you on fire.
- **Look:** `lava` + `flame` + `large_smoke` *(existing)*; `entity.blaze.shoot` on Overdrive, `block.fire.extinguish` on Overheat; name **#FF9F1A** to **#7D0B00** *(existing gradient)*.

### Sloth: Abyssal Bulwark · Verdant Sprig
- **Identity:** Why move? Let them come to you and break on your shell.
- **Weapon** (shield, either hand *(existing)*)
  - Passive: +0.25 KB resistance, +2 toughness, Pressure + Resistance while blocking *(existing)*.
  - On-hit: a shield doesn't hit, so its on-hit is **on-block**: Parry, Slowness IV + Weakness II *(existing)*.
  - Active: **Tidal Surge** *(existing)*.
  - Cooldown: 8s *(existing)*, Parry 4s *(existing)*.
- **Charm** (Verdant Sprig)
  - Buff: **Idle**: 1 HP / 5s after standing still for 3s, anywhere. Grass under open sky makes it 1 HP / 3s. *(Today it's grass-only.)*
  - Curse: **Inertia**: after standing still 5s+, your first 2s of movement are Slowness II. Getting up is hard. *Replaces* Hunger-without-sky.
- **Drawback: Heavy.** −10% speed while held *(existing)*. Surge recoil *(existing)*. Inertia from the charm.
- **Set: Dead Weight.** Standing still with the shield raised builds +1 Pressure every 2s without being hit. Idle regen doubles.
- **Tiers:** T2 (Sponge): Pressure max 5→6, Surge range 7→9. T3 (Nether Star): Parry also roots the attacker for 0.5s. Drawback: −10% → −15% speed.
- **Look:** `bubble` + `nautilus`; `block.conduit.ambient` while idle, `item.shield.block` (low pitch) on Parry; name **#7A9BB5** to **#3E5566**.

---

## 3. Hidden sins

Both are **sidegrades of their twin**: same slot, different job. Neither beats its twin on its twin's strength.

### Melancholy, Sloth's forgotten twin: Frostveil Scythe · Moonlit Pendant
- **Lore:** *"Before there were seven there were eight. Sorrow was folded into Sloth, and Sloth forgot it ever had a sister."*
- **Sidegrade logic:** Sloth tanks and wants company to come to it. Melancholy controls and wears enemies down. It's strongest **alone** and **at night**, and fragile otherwise.
- **Identity:** Sorrow that numbs everything it touches, including you.
- **Weapon** (diamond hoe, 8 dmg *(existing)*)
  - Passive: **Solitude**: +1 damage when no other player is within 16 blocks.
  - On-hit: Hypothermia → Frozen Solid → Shatter *(existing)*.
  - Active: **Frost Nova** *(existing)*.
  - Cooldown: 8s *(existing)*.
- **Charm** (Moonlit Pendant)
  - Buff: night Strength I + Night Vision, +2 empty max hearts at night *(existing)*.
  - Curse: daylight Slowness I and −10% attack speed *(existing)*. It can't face the day.
- **Drawback: Withdrawn.** Team support (Warhorn, Lifebloom) **skips you**. You can't be helped. Plus the existing −5% chill and powder-snow damage.
- **Set: Long Night.** At night, Shatter gives Darkness 3s to players hit and refills one Moonlit heart. Frost Nova radius 5→8.
- **Tiers:** T2 (Blue Ice): Frozen Solid 1.5→2s. T3 (Nether Star): Solitude +2, Frost Nova freezes for 1s. Drawback: daylight Slowness I → II.
- **Look:** `snowflake` + `falling_dust{block_state:"blue_ice"}`; `music_disc.11`-style `ambient.cave` on Nova, `block.glass.break` (low) on Shatter; name **#3D5A99** to **#AFC4E8**.
- **Unlock:** At night, with **no other player within 32 blocks**, in a snowy biome, carry a Sloth charm and **play music disc "11" in a jukebox**. That grants a hidden advancement that unlocks the Melancholy Core recipe.
  - Tech: `item_used_on_block` (jukebox + `music_disc_11`) with a location/time predicate. The reward function checks the Sloth charm and the 32-block solitude.

### Vanity, Pride's forgotten twin: Chronos Stiletto · Prism Mirror
- **Lore:** *"Pride wanted to be greater than everyone. Vanity only wanted everyone to see it. The monks called it Vainglory, then forgot it had a name."*
- **Sidegrade logic:** Pride gets stronger as it gets hurt (Rebirth, Never Retreat) and wins with vertical burst. Vanity is a flawless duelist. It's strong **only while unhurt**, and one hit takes its edge away.
- **Identity:** You'll never let the world see you hurt. You undo the wound before it shows.
- **Weapon** (golden sword, 6 dmg, 1.8 speed *(existing)*)
  - Passive: **Flawless**: at full HP, +2 damage and +10% speed (instead of the current +5%).
  - On-hit: Paradox stacks, crit time-freeze *(existing)*.
  - Active: **Temporal Anchor → Rewind** *(existing)*.
  - Cooldown: 20s *(existing)*.
- **Charm** (Prism Mirror)
  - Buff: reflect 30% projectile damage, heal one projectile hit every 15s *(existing)*.
  - Curse: melee hits deal +1 to you *(existing)*. Glass is fragile.
- **Drawback: Blemished.** Taking damage from full HP turns Flawless off for 10s and gives Weakness I for 3s (shame). Rewind's Weakness *(existing)*.
- **Set: Unblemished.** Rewinding to an anchor set at full HP restores you to full. The Mirror also reflects 15% of melee damage.
- **Tiers:** T2 (Amethyst Block): Flawless +2→+3, anchor 6→8s. T3 (Nether Star): Rewind grants Resistance I 2s. Drawback: Blemished 10→15s.
- **Look:** `end_rod` + `dust{color:[1.0,0.85,0.95]}`; `block.amethyst_block.chime` on Flawless returning, `block.glass.break` on Blemished; name **#F2C6DE** to **#C0C0D8** (rose to silver).
- **Unlock:** Carrying a Pride charm, **kill 10 hostile mobs in a row without taking any damage**. That grants a hidden advancement that unlocks the Vanity Core recipe.
  - Tech: a `kandy.vain` streak score. Kills come from the existing `util/tag_kills`, and the streak resets on hurt (existing hurt detection).
  - I left out a "witness" requirement so solo players aren't locked out.

---

## 4. Technical structure

### custom_data (one format)
```
{sin:"wrath", type:"weapon", tier:1}
{sin:"wrath", type:"charm",  tier:1}
```
- `type` is `"weapon"` or `"charm"`. Today's charms use `type:"talisman"`; sin charms switch to `"charm"`. Trinkets keep their old data.
- **Back-compat:** holders also match the old keys (`{ability:"Pyroclast"}` → wrath weapon T1, `{charm:"Berserker"}` → wrath charm T1), so items already in chests keep working. No inventory conversion needed.

### Scoreboards
| Objective | Use |
| --- | --- |
| `kandy.cd.<sin>` | Active-ability cooldown in ticks, one per sin weapon (`kandy.cd.wrath`, `kandy.cd.pride`...). Changed from one shared `kandy.cd`: each weapon now cools down on its own. |
| `kandy.ccd.<sin>` | Charm proc cooldown, one per sin charm (`kandy.ccd.pride` for Rebirth, `kandy.ccd.wrath` for Frenzy). Changed from one shared `kandy.ccd`. |
| `kandy.wt` / `kandy.ct` | Held weapon tier / carried charm tier (0 = none). |
| `kandy.vain` | Vanity unlock streak. |

Per-sin *state* (Heat, Desire, Pressure, Puncture...) keeps its existing objective. Those aren't cooldowns, and renaming them buys nothing. Old per-skill cooldown objectives (`pyro_cd`, `dg_cd`...) are replaced by `kandy.cd.<sin>` and removed in `uninstall`.

### Tags
| Tag | Meaning |
| --- | --- |
| `kandy.<sin>.w` | sin weapon in mainhand (Sloth: either hand) |
| `kandy.<sin>.c` | sin charm carried |
| `kandy.<sin>.set` | both of the above |
| `kandy.quarrel` | carrying 2+ different sin charms (all `.c` tags are removed) |

`<sin>` ∈ `pride greed lust envy gluttony wrath sloth melancholy vanity`.

### Dispatcher
- **Tick:** `kandy:tick` calls `kandy:sin/tick`. That runs `sin/holders` (sets tags and tiers), then for each sin `execute as @a[tag=kandy.<sin>.w] run function kandy:sin/<sin>/weapon/tick`, the same for `.c` → `charm/tick`, and `.set` → `set`. 9 sins × 3 lines.
- **Active:** every right-click and sneak-combo trigger calls `kandy:sin/active`. It checks `kandy.cd.<sin>`, reads the held item's `sin` into storage, and calls one macro line: `$function kandy:sin/$(sin)/weapon/active`. It then sets `kandy.cd.<sin>` from that sin's cooldown (scaled by tier).
- **Hit:** stays as **one advancement per sin** (`advancement/sin/<sin>/hit.json`), because each weapon needs its own minimum damage to count as charged. One advancement can't hold nine thresholds. Each reward points straight at `sin/<sin>/weapon/hit`.
- **HUD:** one boss bar per sin weapon for its `kandy.cd.<sin>` plus one per sin charm for its `kandy.ccd.<sin>`, replacing the per-skill bars for sin items. Relics keep theirs.

### Layout
```
data/kandy/
  function/
    sin/
      tick.mcfunction          # dispatcher
      holders.mcfunction       # tags, tiers, quarrel, old-key back-compat
      active.mcfunction        # cooldown gate + macro route
      setup.mcfunction         # kandy.cd.<sin>, kandy.ccd.<sin>, kandy.wt, kandy.ct
      uninstall.mcfunction
      unlock/
        melancholy.mcfunction
        vanity.mcfunction
      <sin>/                   # x9
        weapon/                # old weapon folder, moved
          tick, hit, active, give, give_core, visual ...
        charm/                 # old charm folder, moved
          tick, give, give_core ...
        set.mcfunction         # set bonus
    hud/  team/  util/         # shared, kept
    <relic and trinket folders unchanged>
  advancement/
    sin/<sin>/hit.json  sin/<sin>/using.json
    sin/unlock/melancholy.json  sin/unlock/vanity.json
  recipe/
    sin/<sin>/core.json  forge.json  tier2.json  tier3.json
  tags/item/valuables.json     # Greed's Gilded Weight
```
Moves are done with `git mv` so file history follows the code.

---

## 5. Migration list

| Existing | Action | Notes |
| --- | --- | --- |
| `function/dragoon/` | **rename** → `sin/pride/weapon/` + **modify** | `give` custom_data/lore. Cooldown → `kandy.cd.<sin>`. Add Above Them and the missed-Dive self-damage. |
| `function/phoenix_plume/` | **rename** → `sin/pride/charm/` + **modify** | Add Never Retreat. Cooldown → `kandy.ccd.pride`. |
| `function/chainwarden/` | **rename** → `sin/greed/weapon/` + **modify** | Add Pilfer and the snap-on-switch rule. |
| `function/plunderers_coin/` | **rename** → `sin/greed/charm/` + **modify** | Swap the hunger cost for Gilded Weight. |
| `function/bloodpact/` | **rename** → `sin/lust/weapon/` + **modify** | Add Embrace. |
| `function/swiftwind/` | **replace** | `momentum.mcfunction` moves into `sin/lust/weapon/desire`. The rest (give, effects, visual, advancement, recipe) is retired. |
| `function/hares_foot/` | **rename** → `sin/lust/charm/` | Lore rename only ("Bared"). |
| `function/falconer/` | **rename** → `sin/envy/weapon/` + **modify** | Add Covet. |
| `function/watchers_lens/` | **rename** → `sin/envy/charm/` + **modify** | Add Green Eye. |
| `function/lingering_soul/` | **rename** → `sin/gluttony/weapon/` + **modify** | Add Devour (needs a `consumable` component plus `using.json`). |
| `function/hearthstone/` | **rename** → `sin/gluttony/charm/` | Keep as-is apart from custom_data. |
| `function/reapers_knuckle/` | **keep** | The item stays a Trinket. Its heart logic is **copied** into `sin/gluttony/set`. |
| `function/pyroclast/` | **rename** → `sin/wrath/weapon/` + **modify** | Fissure cooldown → `kandy.cd.<sin>`. |
| `function/berserker/` | **rename** → `sin/wrath/charm/` + **modify** | Frenzy cooldown → `kandy.ccd.wrath`. |
| `function/abyssal/` | **rename** → `sin/sloth/weapon/` + **modify** | Surge cooldown → `kandy.cd.<sin>`. |
| `function/verdant_sprig/` | **rename** → `sin/sloth/charm/` + **modify** | Grass-only → Idle. Hunger → Inertia. |
| `function/frostveil/` | **rename** → `sin/melancholy/weapon/` + **modify** | Add Solitude. |
| `function/moonlit_pendant/` | **rename** → `sin/melancholy/charm/` | Keep as-is apart from custom_data. |
| `function/chronos/` | **rename** → `sin/vanity/weapon/` + **modify** | Add Flawless and Blemished. |
| `function/prism_mirror/` | **rename** → `sin/vanity/charm/` | Keep as-is apart from custom_data. |
| `function/worldbreaker, tempest, eclipse, lifebloom, warhorn/` | **keep as-is** | Relics. |
| `function/team/` | **modify** | Skip players tagged `kandy.melancholy.c` (Withdrawn). |
| Other 18 charm folders | **keep as-is** | Trinkets. |
| `holders.mcfunction` | **modify** | Delete the lines for moved items. `sin/holders` replaces them. |
| `tick.mcfunction` | **modify** | Moved items' calls → one `function kandy:sin/tick`. |
| `load.mcfunction` | **modify** | Moved items' setups → `sin/setup` + each sin's setup. Hit revokes → `advancement/sin/*`. |
| `uninstall.mcfunction` | **modify** | Add `sin/uninstall`. Drop the per-skill cooldown objectives. |
| `menu`, `give_all`, `give_all_cores` | **modify** | Group the menu by sin / Relics / Trinkets. Hidden sins aren't in `give_all`. |
| `hud/` | **modify** | Add the `kandy.cd.<sin>` / `kandy.ccd.<sin>` bars. Drop the moved items' per-skill bars. |
| `util/` | **keep as-is** | |
| `advancement/hit/<moved>.json`, `advancement/<moved>/` | **rename** → `advancement/sin/<sin>/` + **modify** | Predicate matches `{sin:"x",type:"weapon"}` **or** the old key. |
| `recipe/` for moved items | **modify** | Forge result gets the new custom_data. Add tier2/tier3 recipes. |
| new | **add** | `sin/` core, two unlock advancements, Melancholy + Vanity cores, `tags/item/valuables.json`. |

---

## 6. Balance check

1–5 scale. Risk: higher = more dangerous to the user. Net = Damage + Utility − Risk, aimed at **3** for every sin.

| Sin | Damage | Utility | Risk | Net | Best at | Countered by |
| --- | --- | --- | --- | --- | --- | --- |
| Pride | 4 | 3 | 4 | 3 | burst from above, mobility | low ceilings, dodging the Dive |
| Greed | 2 | 5 | 4 | 3 | displacement, loot, XP | fights up close, no line of sight |
| Lust | 4 | 4 | 5 | 3 | sticking to targets, sustain at low HP | burst while you're bleeding |
| Envy | 3 | 4 | 4 | 3 | single-target ranged, stealing buffs | flankers (you're blind while locked) |
| Gluttony | 4 | 2 | 3 | 3 | damage over time, multi-target | food shortage, long fights |
| Wrath | 5 | 2 | 4 | 3 | raw melee, AoE in Overdrive | kiting through the Overheat window |
| Sloth | 1 | 4 | 2 | 3 | holding ground, team anchor | being ignored, zoning, ranged poke |
| Melancholy | 3 | 4 | 4 | 3 | control, solo at night | daylight, team fights (no support) |
| Vanity | 4 | 3 | 4 | 3 | dueling, untouched openers | melee chip damage (the Mirror only covers projectiles) |

Things to watch in testing:
- **Lust** has the highest risk *and* highest sustain. If bleed-healing outpaces bleed at T3, drop the T3 heal back to 2 hearts.
- **Wrath + Blind Fury** can chain Frenzy into Overdrive. That's 100% intended, but check Overdrive's damage against T3 Pride's Dive.
- **Per-item cooldowns** (`kandy.cd.<sin>`, `kandy.ccd.<sin>`) let someone carrying two sin weapons swap between actives, and two sin charms proc independently. The quarrel rule is what limits stacking sins.
- **Quarrel rule** is what keeps the table honest. Without it, Wrath charm + Lust weapon (Frenzy + bleed-heal) breaks the numbers.
