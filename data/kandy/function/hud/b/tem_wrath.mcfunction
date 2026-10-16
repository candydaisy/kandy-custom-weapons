$bossbar add kandy:hud_$(id)_tem_wrath ""
scoreboard players add @s tem_scd 0
scoreboard players operation #s hud_v = @s tem_scd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 200
scoreboard players operation #bar hud_v -= @s tem_scd
$bossbar set kandy:hud_$(id)_tem_wrath color white
$bossbar set kandy:hud_$(id)_tem_wrath max 200
$execute store result bossbar kandy:hud_$(id)_tem_wrath value run scoreboard players get #bar hud_v
$execute if score @s tem_scd matches 0 run bossbar set kandy:hud_$(id)_tem_wrath name [{"text":"Tempest Pike","color":"#38b6ff"},{"text":" - Skyward Wrath ready","color":"white"}]
$execute if score @s tem_scd matches 1.. run bossbar set kandy:hud_$(id)_tem_wrath name [{"text":"Tempest Pike","color":"#38b6ff"},{"text":" - Skyward Wrath ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_tem_wrath players @s
$bossbar set kandy:hud_$(id)_tem_wrath visible true
