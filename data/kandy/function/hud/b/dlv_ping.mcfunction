$bossbar add kandy:hud_$(id)_dlv_ping ""
scoreboard players operation #s hud_v = @s dlv_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 600
scoreboard players operation #bar hud_v -= @s dlv_cd
$bossbar set kandy:hud_$(id)_dlv_ping color green
$bossbar set kandy:hud_$(id)_dlv_ping max 600
$execute store result bossbar kandy:hud_$(id)_dlv_ping value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_dlv_ping name [{"text":"Deepdelver Lamp","color":"#3fa7a3"},{"text":" - Ore Ping ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_dlv_ping players @s
$bossbar set kandy:hud_$(id)_dlv_ping visible true
