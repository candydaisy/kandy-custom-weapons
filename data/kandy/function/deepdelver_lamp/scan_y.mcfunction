scoreboard players set #z dlv_tmp 13
function kandy:deepdelver_lamp/scan_z
scoreboard players remove #y dlv_tmp 1
execute if score #y dlv_tmp matches 1.. positioned ~ ~1 ~ run function kandy:deepdelver_lamp/scan_y
