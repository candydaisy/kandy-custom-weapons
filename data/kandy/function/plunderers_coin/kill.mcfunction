# Advancement reward: the player killed something. Carrying the Coin: spoils from every mob, sometimes its loot twice
advancement revoke @s only kandy:plunderers_coin/kill
execute unless entity @s[tag=kandy.charm.plunderers_coin] run return 0
function kandy:util/tag_kills
execute store result score #n plc_tmp if entity @e[tag=kandy.killed]
execute if score #n plc_tmp matches 0 run return 0
tag @s add kandy.plc_greedy
execute as @e[tag=kandy.killed] at @s run function kandy:plunderers_coin/plunder
tag @e[tag=kandy.killed] remove kandy.killed
tag @s remove kandy.plc_greedy
# Greed: 4 exhaustion per kill is 1 hunger point (saturation goes first, as with any hunger)
execute if score #n plc_tmp matches 7.. run scoreboard players set #n plc_tmp 6
scoreboard players operation #a plc_tmp = #n plc_tmp
scoreboard players operation #a plc_tmp *= #40 plc_tmp
scoreboard players remove #a plc_tmp 1
execute store result storage kandy:plunder g.a int 1 run scoreboard players get #a plc_tmp
function kandy:plunderers_coin/greed with storage kandy:plunder g
