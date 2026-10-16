$bossbar add kandy:hud_$(id)_way_cd ""
scoreboard players operation #s hud_v = @s way_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #60 hud_v 60
scoreboard players operation #min hud_v = #s hud_v
scoreboard players operation #min hud_v /= #60 hud_v
scoreboard players operation #sec hud_v = #s hud_v
scoreboard players operation #sec hud_v %= #60 hud_v
scoreboard players set #bar hud_v 12000
scoreboard players operation #bar hud_v -= @s way_cd
$bossbar set kandy:hud_$(id)_way_cd color yellow
$bossbar set kandy:hud_$(id)_way_cd max 12000
$execute store result bossbar kandy:hud_$(id)_way_cd value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_way_cd name [{"text":"Wayfarer's Compass","color":"#2a9d8f"},{"text":" - Homeward Recall ","color":"white"},{"score":{"name":"#min","objective":"hud_v"},"color":"white"},{"text":"m ","color":"white"},{"score":{"name":"#sec","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_way_cd players @s
$bossbar set kandy:hud_$(id)_way_cd visible true
