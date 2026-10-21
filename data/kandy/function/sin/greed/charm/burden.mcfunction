# Run as a player whose Gilded Weight changed: swap the speed modifier for the new weight
execute if score @s plc_gw > @s plc_gwp at @s run playsound minecraft:block.chain.place player @s ~ ~ ~ 0.5 0.5
scoreboard players operation @s plc_gwp = @s plc_gw
attribute @s minecraft:movement_speed modifier remove kandy:gilded_weight
execute if score @s plc_gw matches 0 run return 0
execute store result storage kandy:plunder w.amt double -0.05 run scoreboard players get @s plc_gw
function kandy:sin/greed/charm/burden_apply with storage kandy:plunder w
