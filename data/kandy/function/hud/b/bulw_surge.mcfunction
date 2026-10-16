$bossbar add kandy:hud_$(id)_bulw_surge ""
scoreboard players add @s bulw_scd 0
scoreboard players operation #s hud_v = @s bulw_scd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 160
scoreboard players operation #bar hud_v -= @s bulw_scd
$bossbar set kandy:hud_$(id)_bulw_surge color blue
$bossbar set kandy:hud_$(id)_bulw_surge max 160
$execute store result bossbar kandy:hud_$(id)_bulw_surge value run scoreboard players get #bar hud_v
$execute if score @s bulw_scd matches 0 run bossbar set kandy:hud_$(id)_bulw_surge name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Tidal Surge ready","color":"white"}]
$execute if score @s bulw_scd matches 1.. run bossbar set kandy:hud_$(id)_bulw_surge name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Tidal Surge ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_bulw_surge players @s
$bossbar set kandy:hud_$(id)_bulw_surge visible true
