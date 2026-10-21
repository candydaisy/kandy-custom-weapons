# Advancement reward: the player killed something. Carrying the Coin: spoils from every mob, sometimes its loot twice
advancement revoke @s only kandy:sin/greed/plunder
execute unless entity @s[tag=kandy.greed.c] run return 0
function kandy:util/tag_kills
execute store result score #n plc_tmp if entity @e[tag=kandy.killed]
execute if score #n plc_tmp matches 0 run return 0
tag @s add kandy.plc_greedy
scoreboard players operation #gid plc_tmp = @s ecl_pid
execute as @e[tag=kandy.killed] at @s run function kandy:sin/greed/charm/plunder
tag @e[tag=kandy.killed] remove kandy.killed
tag @s remove kandy.plc_greedy
