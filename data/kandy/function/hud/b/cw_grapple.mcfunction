$bossbar add kandy:hud_$(id)_cw_grapple ""
scoreboard players add @s cw_gcd 0
scoreboard players operation #s hud_v = @s cw_gcd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 160
scoreboard players operation #bar hud_v -= @s cw_gcd
$bossbar set kandy:hud_$(id)_cw_grapple color white
$bossbar set kandy:hud_$(id)_cw_grapple max 160
$execute store result bossbar kandy:hud_$(id)_cw_grapple value run scoreboard players get #bar hud_v
$execute if score @s cw_gcd matches 0 run bossbar set kandy:hud_$(id)_cw_grapple name [{"text":"Chainwarden Arbalest","color":"#8d6e63"},{"text":" - Grapple ready","color":"white"}]
$execute if score @s cw_gcd matches 1.. run bossbar set kandy:hud_$(id)_cw_grapple name [{"text":"Chainwarden Arbalest","color":"#8d6e63"},{"text":" - Grapple ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_cw_grapple players @s
$bossbar set kandy:hud_$(id)_cw_grapple visible true
