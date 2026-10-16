$bossbar add kandy:hud_$(id)_ver_wither ""
scoreboard players set #bar hud_v 1200
scoreboard players operation #bar hud_v -= @s ver_dark
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
scoreboard players operation #s hud_v = #bar hud_v
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
$bossbar set kandy:hud_$(id)_ver_wither color green
$bossbar set kandy:hud_$(id)_ver_wither max 600
$execute store result bossbar kandy:hud_$(id)_ver_wither value run scoreboard players get #bar hud_v
$execute if score @s ver_dark matches ..1199 run bossbar set kandy:hud_$(id)_ver_wither name [{"text":"Verdant Sprig","color":"#52b788"},{"text":" - Withering in ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s (find open sky)","color":"white"}]
$execute if score @s ver_dark matches 1200.. run bossbar set kandy:hud_$(id)_ver_wither name [{"text":"Verdant Sprig","color":"#52b788"},{"text":" - Withering: find open sky","color":"red"}]
$bossbar set kandy:hud_$(id)_ver_wither players @s
$bossbar set kandy:hud_$(id)_ver_wither visible true
