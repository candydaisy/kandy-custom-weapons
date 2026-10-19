$bossbar add kandy:hud_$(id)_lb_pulse ""
scoreboard players add @s lb_cd 0
scoreboard players operation #s hud_v = @s lb_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 240
scoreboard players operation #bar hud_v -= @s lb_cd
$bossbar set kandy:hud_$(id)_lb_pulse color pink
$bossbar set kandy:hud_$(id)_lb_pulse max 240
$execute store result bossbar kandy:hud_$(id)_lb_pulse value run scoreboard players get #bar hud_v
$execute if score @s lb_cd matches 0 run bossbar set kandy:hud_$(id)_lb_pulse name [{"text":"Lifebloom Staff","color":"#ffafcc"},{"text":" - Mending Pulse ready","color":"white"}]
$execute if score @s lb_cd matches 1.. run bossbar set kandy:hud_$(id)_lb_pulse name [{"text":"Lifebloom Staff","color":"#ffafcc"},{"text":" - Mending Pulse ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_lb_pulse players @s
$bossbar set kandy:hud_$(id)_lb_pulse visible true
