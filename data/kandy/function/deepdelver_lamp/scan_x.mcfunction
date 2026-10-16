scoreboard players set #y dlv_tmp 13
function kandy:deepdelver_lamp/scan_y
scoreboard players remove #x dlv_tmp 1
execute if score #x dlv_tmp matches 1.. positioned ~1 ~ ~ run function kandy:deepdelver_lamp/scan_x
