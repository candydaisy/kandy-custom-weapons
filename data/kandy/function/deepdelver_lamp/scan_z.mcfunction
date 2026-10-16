execute if block ~ ~ ~ #kandy:deepdelver_lamp_ores run function kandy:deepdelver_lamp/mark
scoreboard players remove #z dlv_tmp 1
execute if score #z dlv_tmp matches 1.. positioned ~ ~ ~1 run function kandy:deepdelver_lamp/scan_z
