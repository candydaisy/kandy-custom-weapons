$bossbar add kandy:hud_$(id)_phx_rebirth ""
scoreboard players operation #s hud_v = @s phx_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 6000
scoreboard players operation #bar hud_v -= @s phx_cd
$bossbar set kandy:hud_$(id)_phx_rebirth color red
$bossbar set kandy:hud_$(id)_phx_rebirth max 6000
$execute store result bossbar kandy:hud_$(id)_phx_rebirth value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_phx_rebirth name [{"text":"Phoenix Plume","color":"#f3722c"},{"text":" - Rebirth ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_phx_rebirth players @s
$bossbar set kandy:hud_$(id)_phx_rebirth visible true
