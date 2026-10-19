$bossbar add kandy:hud_$(id)_wh_horn ""
scoreboard players add @s wh_cd 0
scoreboard players operation #s hud_v = @s wh_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 900
scoreboard players operation #bar hud_v -= @s wh_cd
$bossbar set kandy:hud_$(id)_wh_horn color red
$bossbar set kandy:hud_$(id)_wh_horn max 900
$execute store result bossbar kandy:hud_$(id)_wh_horn value run scoreboard players get #bar hud_v
$execute if score @s wh_cd matches 0 run bossbar set kandy:hud_$(id)_wh_horn name [{"text":"Oathbound Warhorn","color":"#e76f51"},{"text":" - War Cry / Rally ready","color":"white"}]
$execute if score @s wh_cd matches 1.. run bossbar set kandy:hud_$(id)_wh_horn name [{"text":"Oathbound Warhorn","color":"#e76f51"},{"text":" - War Cry / Rally ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_wh_horn players @s
$bossbar set kandy:hud_$(id)_wh_horn visible true
