# Melt any Frost Nova ice, then strip every frost modifier from loaded entities
execute as @e[type=minecraft:marker,tag=kandy.frost_ice] at @s run function kandy:frostveil/melt
execute as @e[type=!#kandy:unpullable] run attribute @s minecraft:movement_speed modifier remove kandy:frost_slow
execute as @e[type=!#kandy:unpullable] run attribute @s minecraft:movement_speed modifier remove kandy:frost_freeze
execute as @e[type=!#kandy:unpullable] run attribute @s minecraft:jump_strength modifier remove kandy:frost_freeze

scoreboard objectives remove frost_stacks
scoreboard objectives remove frost_timer
scoreboard objectives remove frost_frozen
scoreboard objectives remove frost_imm
scoreboard objectives remove frost_cd
scoreboard objectives remove frost_ice
scoreboard objectives remove frost_tmp

advancement revoke @a only kandy:hit/frostveil
