# Melt any Frost Nova ice, then strip every frost modifier from loaded entities
execute as @e[type=minecraft:marker,tag=kandy.frost_ice] at @s run function kandy:sin/melancholy/weapon/melt
execute as @e[type=!#kandy:unpullable] run attribute @s minecraft:movement_speed modifier remove kandy:frost_slow
execute as @e[type=!#kandy:unpullable] run attribute @s minecraft:movement_speed modifier remove kandy:frost_freeze
execute as @e[type=!#kandy:unpullable] run attribute @s minecraft:jump_strength modifier remove kandy:frost_freeze

scoreboard objectives remove frost_stacks
scoreboard objectives remove frost_timer
scoreboard objectives remove frost_frozen
scoreboard objectives remove frost_imm
scoreboard objectives remove frost_cd
tag @a remove kandy.frost_alone
advancement revoke @a only kandy:sin/melancholy/kill
scoreboard objectives remove frost_ice
scoreboard objectives remove frost_tmp

advancement revoke @a only kandy:sin/melancholy/hit
advancement revoke @a only kandy:sin/unlock/melancholy
tag @a remove kandy.melancholy_known
