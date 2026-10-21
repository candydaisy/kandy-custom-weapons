execute as @a run attribute @s minecraft:movement_speed modifier remove kandy:hare_speed
execute as @a run attribute @s minecraft:movement_speed modifier remove kandy:hare_burst
execute as @a run attribute @s minecraft:armor modifier remove kandy:hare_frail
tag @a remove kandy.hare_mod
tag @a remove kandy.hare_burst
scoreboard objectives remove hare_cd
scoreboard objectives remove hare_bt
scoreboard objectives remove hare_jump
scoreboard objectives remove hare_prev
