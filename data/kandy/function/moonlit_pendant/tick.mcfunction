# Moonlight: night under open sky (the Nether and End have no sky, so nothing happens there)
execute as @a[tag=kandy.charm.moonlit_pendant] if predicate kandy:moonlit_pendant_sky if predicate kandy:moonlit_pendant_night run tag @s add kandy.moon_lit
effect give @a[tag=kandy.moon_lit] minecraft:strength 2 0 true
effect give @a[tag=kandy.moon_lit] minecraft:night_vision 12 0 true
execute as @a[tag=kandy.moon_lit] if predicate kandy:moonlit_pendant_full_moon run effect give @s minecraft:speed 2 0 true

# Night Vigor: +4 max health through the Overworld night, even under a roof (the new hearts start empty)
execute as @a[tag=kandy.charm.moonlit_pendant] if dimension minecraft:overworld if predicate kandy:moonlit_pendant_night run tag @s add kandy.moon_vigor
execute as @a[tag=kandy.moon_vigor] run attribute @s minecraft:max_health modifier add kandy:moon_vigor 4 add_value
execute as @a[tag=!kandy.moon_vigor] run attribute @s minecraft:max_health modifier remove kandy:moon_vigor

# Daylight Burden: day under open sky gives Slowness I and -10% attack speed
execute as @a[tag=kandy.charm.moonlit_pendant] if predicate kandy:moonlit_pendant_sky unless predicate kandy:moonlit_pendant_night run tag @s add kandy.moon_burdened
effect give @a[tag=kandy.moon_burdened] minecraft:slowness 2 0 true
execute as @a[tag=kandy.moon_burdened] run attribute @s minecraft:attack_speed modifier add kandy:moon_burden -0.1 add_multiplied_total
execute as @a[tag=!kandy.moon_burdened] run attribute @s minecraft:attack_speed modifier remove kandy:moon_burden

tag @a remove kandy.moon_lit
tag @a remove kandy.moon_vigor
tag @a remove kandy.moon_burdened
