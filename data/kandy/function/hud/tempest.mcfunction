scoreboard players add @s tem_scd 0
scoreboard players add @s tem_dcd 0
scoreboard players operation #s hud_v = @s tem_scd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #d hud_v = @s tem_dcd
scoreboard players add #d hud_v 19
scoreboard players operation #d hud_v /= #20 hud_v
scoreboard players set #bar hud_v 200
scoreboard players operation #bar hud_v -= @s tem_scd
$bossbar set kandy:hud_$(id) color blue
$bossbar set kandy:hud_$(id) max 200
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get #bar hud_v
$execute if score @s tem_scd matches 0 if score @s tem_dcd matches 0 run bossbar set kandy:hud_$(id) name [{"text":"Tempest Pike","color":"#38b6ff"},{"text":" - Wrath ready | Surge ready","color":"white"}]
$execute if score @s tem_scd matches 0 if score @s tem_dcd matches 1.. run bossbar set kandy:hud_$(id) name [{"text":"Tempest Pike","color":"#38b6ff"},{"text":" - Wrath ready | Surge ","color":"white"},{"score":{"name":"#d","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$execute if score @s tem_scd matches 1.. if score @s tem_dcd matches 0 run bossbar set kandy:hud_$(id) name [{"text":"Tempest Pike","color":"#38b6ff"},{"text":" - Wrath ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s | Surge ready","color":"white"}]
$execute if score @s tem_scd matches 1.. if score @s tem_dcd matches 1.. run bossbar set kandy:hud_$(id) name [{"text":"Tempest Pike","color":"#38b6ff"},{"text":" - Wrath ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s | Surge ","color":"white"},{"score":{"name":"#d","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
