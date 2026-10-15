# Run as and at each player carrying the Eclipse Longbow: count warpable arrows, highlight
# the one Shadow Warp would pick (only you see it), and show both cooldowns while held
tag @s add ecl.warper
data modify storage kandy:eclipse me set from entity @s UUID
execute as @e[type=arrow,tag=ecl.arrow,distance=..64] if function kandy:eclipse/owned_by_warper run tag @s add ecl.mine
execute store result score @s ecl_n if entity @e[type=arrow,tag=ecl.mine]
execute if score @s ecl_warp matches 0 as @e[type=arrow,tag=ecl.mine,sort=nearest,limit=1] at @s run particle minecraft:end_rod ~ ~ ~ 0.15 0.15 0.15 0 3 force @a[tag=ecl.warper]
execute if score @s ecl_warp matches 0 as @e[type=arrow,tag=ecl.mine,sort=nearest,limit=1] at @s run particle minecraft:reverse_portal ~ ~ ~ 0.2 0.2 0.2 0.05 4 force @a[tag=ecl.warper]
tag @e[type=arrow,tag=ecl.mine] remove ecl.mine
tag @s remove ecl.warper

execute unless entity @s[tag=kandy.main.eclipse] run return 0
# Cooldowns in whole seconds, rounded up
scoreboard players operation @s ecl_ws = @s ecl_warp
scoreboard players add @s ecl_ws 19
scoreboard players operation @s ecl_ws /= #20 ecl_tmp
scoreboard players operation @s ecl_ss = @s ecl_cd
scoreboard players add @s ecl_ss 19
scoreboard players operation @s ecl_ss /= #20 ecl_tmp
execute if entity @s[scores={ecl_cd=0,ecl_warp=1..}] run title @s actionbar [{"text":"✦ Singularity ","color":"light_purple","bold":true},{"text":"ready","color":"white"},{"text":"   ✦ Shadow Warp ","color":"dark_purple","bold":true},{"score":{"name":"@s","objective":"ecl_ws"},"color":"gray"},{"text":"s","color":"gray"}]
execute if entity @s[scores={ecl_cd=0,ecl_warp=0,ecl_n=0}] run title @s actionbar [{"text":"✦ Singularity ","color":"light_purple","bold":true},{"text":"ready","color":"white"},{"text":"   ✦ Shadow Warp ","color":"dark_purple","bold":true},{"text":"no arrow","color":"dark_gray","italic":true}]
execute if entity @s[scores={ecl_cd=0,ecl_warp=0,ecl_n=1..}] run title @s actionbar [{"text":"✦ Singularity ","color":"light_purple","bold":true},{"text":"ready","color":"white"},{"text":"   ✦ Shadow Warp ","color":"dark_purple","bold":true},{"text":"ready ","color":"white"},{"text":"(","color":"gray"},{"score":{"name":"@s","objective":"ecl_n"},"color":"light_purple"},{"text":" in range)","color":"gray"}]
execute if entity @s[scores={ecl_cd=1..,ecl_warp=1..}] run title @s actionbar [{"text":"✦ Singularity ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"ecl_ss"},"color":"gray"},{"text":"s","color":"gray"},{"text":"   ✦ Shadow Warp ","color":"dark_purple","bold":true},{"score":{"name":"@s","objective":"ecl_ws"},"color":"gray"},{"text":"s","color":"gray"}]
execute if entity @s[scores={ecl_cd=1..,ecl_warp=0,ecl_n=0}] run title @s actionbar [{"text":"✦ Singularity ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"ecl_ss"},"color":"gray"},{"text":"s","color":"gray"},{"text":"   ✦ Shadow Warp ","color":"dark_purple","bold":true},{"text":"no arrow","color":"dark_gray","italic":true}]
execute if entity @s[scores={ecl_cd=1..,ecl_warp=0,ecl_n=1..}] run title @s actionbar [{"text":"✦ Singularity ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"ecl_ss"},"color":"gray"},{"text":"s","color":"gray"},{"text":"   ✦ Shadow Warp ","color":"dark_purple","bold":true},{"text":"ready ","color":"white"},{"text":"(","color":"gray"},{"score":{"name":"@s","objective":"ecl_n"},"color":"light_purple"},{"text":" in range)","color":"gray"}]
