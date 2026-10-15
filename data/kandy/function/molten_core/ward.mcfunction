# Run as and at a carrier
tag @s add kandy.molt_self
execute as @e[type=minecraft:small_fireball,distance=..3] at @s run function kandy:molten_core/fizzle
execute as @e[type=minecraft:fireball,distance=..3] at @s run function kandy:molten_core/fizzle
execute as @e[type=#minecraft:arrows,distance=..3,predicate=kandy:molten_core_on_fire] at @s run function kandy:molten_core/snuff_arrow
tag @s remove kandy.molt_self
