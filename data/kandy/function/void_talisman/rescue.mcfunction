# Run as and at a carrier who fell into the void
scoreboard players set @s void_cd 2400
tag @s remove kandy.void_moved

scoreboard players set #now void_dim 0
execute if dimension minecraft:the_nether run scoreboard players set #now void_dim 1
execute if dimension minecraft:the_end run scoreboard players set #now void_dim 2

# Back to the last place you stood in this dimension, if it is still clear
execute if score @s void_saved matches 1 if score @s void_dim = #now void_dim run function kandy:void_talisman/rescue_saved
# Otherwise the nearest surface around you
execute if entity @s[tag=!kandy.void_moved] run function kandy:void_talisman/rescue_surface

# Nothing safe found: float up and try again in 5s
execute if entity @s[tag=!kandy.void_moved] run effect give @s minecraft:levitation 3 3 true
execute if entity @s[tag=!kandy.void_moved] run scoreboard players set @s void_cd 100
execute if entity @s[tag=!kandy.void_moved] run return run effect give @s minecraft:slow_falling 10 0 true

effect give @s minecraft:slow_falling 5 0 true
effect give @s minecraft:regeneration 5 0 true
execute at @s run playsound minecraft:entity.warden.sonic_charge player @a[distance=..16] ~ ~ ~ 1 1.4
execute at @s run playsound minecraft:entity.enderman.teleport player @a[distance=..16] ~ ~ ~ 1 0.8
execute at @s run function kandy:void_talisman/helix
tag @s remove kandy.void_moved
