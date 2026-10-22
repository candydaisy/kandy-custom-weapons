# Which carriers stand on natural ground (grass, moss, mud, rooted dirt, leaves)
tag @a remove kandy.ver_ground
execute as @a[tag=kandy.sloth.c] if predicate kandy:verdant_sprig_grounded at @s if block ~ ~-0.5 ~ #kandy:verdant_sprig_ground run tag @s add kandy.ver_ground

# Idle and Inertia: track how long each carrier has stood still
execute as @a[tag=kandy.sloth.c] at @s run function kandy:sin/sloth/charm/still
scoreboard players set @a[tag=!kandy.sloth.c] ver_idle 0
scoreboard players set @a[tag=!kandy.sloth.c] ver_t 0

# Rooted Stance: sneaking on natural ground gives +0.5 knockback resistance
tag @a remove kandy.ver_root
tag @a[tag=kandy.ver_ground,predicate=kandy:sneaking] add kandy.ver_root
execute as @a[tag=kandy.ver_root] run attribute @s minecraft:knockback_resistance modifier add kandy:verdant_root 0.5 add_value
execute as @a[tag=!kandy.ver_root] run attribute @s minecraft:knockback_resistance modifier remove kandy:verdant_root
