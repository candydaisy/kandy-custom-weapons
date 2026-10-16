# Which carriers stand on natural ground (grass, moss, mud, rooted dirt, leaves)
tag @a remove kandy.ver_ground
execute as @a[tag=kandy.charm.verdant_sprig] if predicate kandy:verdant_sprig_grounded at @s if block ~ ~-0.5 ~ #kandy:verdant_sprig_ground run tag @s add kandy.ver_ground

# Photosynthesis: 1 HP every 5s on natural ground under open sky (a 3s Regeneration I heals exactly once)
scoreboard players add @a[tag=kandy.ver_ground,predicate=kandy:verdant_sprig_sky] ver_t 1
scoreboard players set @a[tag=!kandy.ver_ground] ver_t 0
scoreboard players set @a[predicate=!kandy:verdant_sprig_sky] ver_t 0
execute as @a[scores={ver_t=100..}] at @s run function kandy:verdant_sprig/bloom

# Rooted Stance: sneaking on natural ground gives +0.5 knockback resistance
tag @a remove kandy.ver_root
tag @a[tag=kandy.ver_ground,predicate=kandy:sneaking] add kandy.ver_root
execute as @a[tag=kandy.ver_root] run attribute @s minecraft:knockback_resistance modifier add kandy:verdant_root 0.5 add_value
execute as @a[tag=!kandy.ver_root] run attribute @s minecraft:knockback_resistance modifier remove kandy:verdant_root

# Withering: 60s in a row without open sky gives Hunger I until you see the sky again
scoreboard players add @a[tag=kandy.charm.verdant_sprig,predicate=!kandy:verdant_sprig_sky] ver_dark 1
scoreboard players set @a[predicate=kandy:verdant_sprig_sky] ver_dark 0
scoreboard players set @a[tag=!kandy.charm.verdant_sprig] ver_dark 0
effect give @a[scores={ver_dark=1200..}] minecraft:hunger 2 0 true
