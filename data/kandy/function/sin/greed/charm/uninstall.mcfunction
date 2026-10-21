scoreboard objectives remove plc_tmp
data remove storage kandy:plunder g
data remove storage kandy:plunder w
data remove storage kandy:plunder u
data remove storage kandy:plunder hex
kill @e[type=minecraft:item_display,tag=kandy.plc_eye]
tag @e remove kandy.plc_marked
advancement revoke @a only kandy:sin/greed/plunder
execute as @a run attribute @s minecraft:movement_speed modifier remove kandy:gilded_weight
scoreboard objectives remove plc_gw
scoreboard objectives remove plc_gwp
