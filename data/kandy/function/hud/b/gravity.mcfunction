$bossbar add kandy:hud_$(id)_gravity ""
scoreboard players add @s grav_cd 0
scoreboard players add @s grav_vtx 0
$bossbar set kandy:hud_$(id)_gravity color purple
$bossbar set kandy:hud_$(id)_gravity max 500
scoreboard players set #bar hud_v 500
scoreboard players operation #bar hud_v -= @s grav_cd
scoreboard players operation #s hud_v = @s grav_cd
execute if score @s grav_vtx matches 1.. run scoreboard players operation #bar hud_v = @s grav_vtx
execute if score @s grav_vtx matches 1.. run scoreboard players operation #bar hud_v *= #5 hud_v
execute if score @s grav_vtx matches 1.. run scoreboard players operation #s hud_v = @s grav_vtx
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
$execute store result bossbar kandy:hud_$(id)_gravity value run scoreboard players get #bar hud_v
$execute if score @s grav_vtx matches 0 if score @s grav_cd matches 0 run bossbar set kandy:hud_$(id)_gravity name [{"text":"World Breaker","color":"#7b7bec"},{"text":" - Sneak to pull nearby","color":"white"}]
$execute if score @s grav_vtx matches 1.. run bossbar set kandy:hud_$(id)_gravity name [{"text":"World Breaker","color":"#7b7bec"},{"text":" - Pulling ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$execute if score @s grav_vtx matches 0 if score @s grav_cd matches 1.. run bossbar set kandy:hud_$(id)_gravity name [{"text":"World Breaker","color":"#7b7bec"},{"text":" - Event Horizon ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_gravity players @s
$bossbar set kandy:hud_$(id)_gravity visible true
