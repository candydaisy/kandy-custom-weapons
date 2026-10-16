$bossbar add kandy:hud_$(id)_frost_nova ""
scoreboard players add @s frost_cd 0
scoreboard players operation #s hud_v = @s frost_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 160
scoreboard players operation #bar hud_v -= @s frost_cd
$bossbar set kandy:hud_$(id)_frost_nova color white
$bossbar set kandy:hud_$(id)_frost_nova max 160
$execute store result bossbar kandy:hud_$(id)_frost_nova value run scoreboard players get #bar hud_v
$execute if score @s frost_cd matches 0 run bossbar set kandy:hud_$(id)_frost_nova name [{"text":"Frostveil Scythe","color":"#7bc5eb"},{"text":" - Frost Nova ready","color":"white"}]
$execute if score @s frost_cd matches 1.. run bossbar set kandy:hud_$(id)_frost_nova name [{"text":"Frostveil Scythe","color":"#7bc5eb"},{"text":" - Frost Nova ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_frost_nova players @s
$bossbar set kandy:hud_$(id)_frost_nova visible true
