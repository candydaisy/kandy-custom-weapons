$bossbar add kandy:hud_$(id)_dg_leap ""
scoreboard players add @s dg_cd 0
scoreboard players operation #s hud_v = @s dg_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 240
scoreboard players operation #bar hud_v -= @s dg_cd
$bossbar set kandy:hud_$(id)_dg_leap color purple
$bossbar set kandy:hud_$(id)_dg_leap max 240
$execute store result bossbar kandy:hud_$(id)_dg_leap value run scoreboard players get #bar hud_v
$execute if score @s dg_cd matches 0 run bossbar set kandy:hud_$(id)_dg_leap name [{"text":"Dragoon's Wyrmspear","color":"#9d4edd"},{"text":" - Dragoon Leap ready","color":"white"}]
$execute if score @s dg_cd matches 1.. run bossbar set kandy:hud_$(id)_dg_leap name [{"text":"Dragoon's Wyrmspear","color":"#9d4edd"},{"text":" - Dragoon Leap ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_dg_leap players @s
$bossbar set kandy:hud_$(id)_dg_leap visible true
