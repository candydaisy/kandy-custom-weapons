# Run as a player holding the pouch
scoreboard players operation @s calt_s = @s calt_cd
scoreboard players add @s calt_s 19
scoreboard players operation @s calt_s /= #20 calt_tmp
execute if score @s calt_cd matches 0 run title @s actionbar [{"text":"✦ Caltrops ","color":"#e84118","bold":true},{"text":"ready","color":"white"},{"text":"  — Right-click to scatter","color":"gray","italic":true}]
execute if score @s calt_cd matches 1.. run title @s actionbar [{"text":"✦ Caltrops ","color":"#8a95a8","bold":true},{"score":{"name":"@s","objective":"calt_s"},"color":"gray"},{"text":"s","color":"gray"}]
