$bossbar add kandy:hud_$(id)_phx_ash ""
scoreboard players operation #s hud_v = @s phx_ash
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
$bossbar set kandy:hud_$(id)_phx_ash color white
$bossbar set kandy:hud_$(id)_phx_ash max 1200
$execute store result bossbar kandy:hud_$(id)_phx_ash value run scoreboard players get @s phx_ash
$bossbar set kandy:hud_$(id)_phx_ash name [{"text":"Phoenix Plume","color":"#f3722c"},{"text":" - Ash Body ","color":"gray"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"gray"}]
$bossbar set kandy:hud_$(id)_phx_ash players @s
$bossbar set kandy:hud_$(id)_phx_ash visible true
