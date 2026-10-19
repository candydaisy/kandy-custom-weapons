$bossbar add kandy:hud_$(id)_lb_sanct ""
scoreboard players add @s lb_scd 0
scoreboard players operation #s hud_v = @s lb_scd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 600
scoreboard players operation #bar hud_v -= @s lb_scd
$bossbar set kandy:hud_$(id)_lb_sanct color green
$bossbar set kandy:hud_$(id)_lb_sanct max 600
$execute store result bossbar kandy:hud_$(id)_lb_sanct value run scoreboard players get #bar hud_v
$execute if score @s lb_scd matches 0 run bossbar set kandy:hud_$(id)_lb_sanct name [{"text":"Lifebloom Staff","color":"#ffafcc"},{"text":" - Sanctuary ready","color":"white"}]
$execute if score @s lb_scd matches 1.. run bossbar set kandy:hud_$(id)_lb_sanct name [{"text":"Lifebloom Staff","color":"#ffafcc"},{"text":" - Sanctuary ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_lb_sanct players @s
$bossbar set kandy:hud_$(id)_lb_sanct visible true
