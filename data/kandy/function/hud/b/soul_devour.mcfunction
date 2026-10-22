$bossbar add kandy:hud_$(id)_soul_devour ""
scoreboard players operation #s hud_v = @s kandy.cd.gluttony
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #m hud_v = @s kandy.cdmax.gluttony
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.cd.gluttony
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_soul_devour color yellow
$execute store result bossbar kandy:hud_$(id)_soul_devour max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_soul_devour value run scoreboard players get #bar hud_v
$execute if score @s kandy.cd.gluttony matches 0 run bossbar set kandy:hud_$(id)_soul_devour name [{"text":"Lingering Souls","color":"#d724ff"},{"text":" - Devour ready","color":"white"}]
$execute if score @s kandy.cd.gluttony matches 1.. run bossbar set kandy:hud_$(id)_soul_devour name [{"text":"Lingering Souls","color":"#d724ff"},{"text":" - Devour ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_soul_devour players @s
$bossbar set kandy:hud_$(id)_soul_devour visible true
