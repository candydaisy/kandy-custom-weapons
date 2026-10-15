# Macro, run as a mob hit by the surge: shove it along the wave direction
$execute store result entity @s Motion[0] double $(scale) run scoreboard players get #dx bulw_tmp
$execute store result entity @s Motion[2] double $(scale) run scoreboard players get #dz bulw_tmp
$data modify entity @s Motion[1] set value $(up)d
