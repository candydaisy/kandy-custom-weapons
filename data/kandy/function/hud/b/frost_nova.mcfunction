$bossbar add kandy:hud_$(id)_frost_nova ""
scoreboard players operation #s hud_v = @s kandy.cd.melancholy
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #m hud_v = @s kandy.cdmax.melancholy
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.cd.melancholy
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_frost_nova color white
$execute store result bossbar kandy:hud_$(id)_frost_nova max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_frost_nova value run scoreboard players get #bar hud_v
$execute if score @s kandy.cd.melancholy matches 0 run bossbar set kandy:hud_$(id)_frost_nova name [{"text":"Frostveil Scythe","color":"#7bc5eb"},{"text":" - Frost Nova ready","color":"white"}]
$execute if score @s kandy.cd.melancholy matches 1.. run bossbar set kandy:hud_$(id)_frost_nova name [{"text":"Frostveil Scythe","color":"#7bc5eb"},{"text":" - Frost Nova ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_frost_nova players @s
$bossbar set kandy:hud_$(id)_frost_nova visible true
