$bossbar add kandy:hud_$(id)_pearl_dash ""
scoreboard players operation #s hud_v = @s pearl_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 100
scoreboard players operation #bar hud_v -= @s pearl_cd
$bossbar set kandy:hud_$(id)_pearl_dash color blue
$bossbar set kandy:hud_$(id)_pearl_dash max 100
$execute store result bossbar kandy:hud_$(id)_pearl_dash value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_pearl_dash name [{"text":"Abyssal Pearl","color":"#1e88e5"},{"text":" - Bubble Burst ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_pearl_dash players @s
$bossbar set kandy:hud_$(id)_pearl_dash visible true
