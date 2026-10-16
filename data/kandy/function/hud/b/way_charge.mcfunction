$bossbar add kandy:hud_$(id)_way_charge ""
scoreboard players add @s way_chg 0
scoreboard players add @s way_wait 0
scoreboard players operation #bar hud_v = @s way_chg
execute if score @s way_wait matches 1.. run scoreboard players set #bar hud_v 60
$bossbar set kandy:hud_$(id)_way_charge color blue
$bossbar set kandy:hud_$(id)_way_charge max 60
$execute store result bossbar kandy:hud_$(id)_way_charge value run scoreboard players get #bar hud_v
$execute if score @s way_wait matches 0 run bossbar set kandy:hud_$(id)_way_charge name [{"text":"Wayfarer's Compass","color":"#2a9d8f"},{"text":" - Recall charging, hold still","color":"white"}]
$execute if score @s way_wait matches 1.. run bossbar set kandy:hud_$(id)_way_charge name [{"text":"Wayfarer's Compass","color":"#2a9d8f"},{"text":" - Recalling...","color":"white"}]
$bossbar set kandy:hud_$(id)_way_charge players @s
$bossbar set kandy:hud_$(id)_way_charge visible true
