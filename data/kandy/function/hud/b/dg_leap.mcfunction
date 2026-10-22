$bossbar add kandy:hud_$(id)_dg_leap ""
scoreboard players operation #s hud_v = @s kandy.cd.pride
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #m hud_v = @s kandy.cdmax.pride
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.cd.pride
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_dg_leap color purple
$execute store result bossbar kandy:hud_$(id)_dg_leap max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_dg_leap value run scoreboard players get #bar hud_v
$execute if score @s kandy.cd.pride matches 0 run bossbar set kandy:hud_$(id)_dg_leap name [{"text":"Dragoon's Wyrmspear","color":"#9d4edd"},{"text":" - Dragoon Leap ready","color":"white"}]
$execute if score @s kandy.cd.pride matches 1.. run bossbar set kandy:hud_$(id)_dg_leap name [{"text":"Dragoon's Wyrmspear","color":"#9d4edd"},{"text":" - Dragoon Leap ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_dg_leap players @s
$bossbar set kandy:hud_$(id)_dg_leap visible true
