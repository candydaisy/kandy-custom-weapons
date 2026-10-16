scoreboard players add @s bulw_chg 0
scoreboard players add @s bulw_scd 0
scoreboard players operation #s hud_v = @s bulw_scd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
$bossbar set kandy:hud_$(id) color blue
$bossbar set kandy:hud_$(id) max 5
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get @s bulw_chg
$execute if score @s bulw_scd matches 0 run bossbar set kandy:hud_$(id) name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Pressure ","color":"white"},{"score":{"name":"@s","objective":"bulw_chg"},"color":"white"},{"text":"/5 | Surge ready","color":"white"}]
$execute if score @s bulw_scd matches 1.. run bossbar set kandy:hud_$(id) name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Pressure ","color":"white"},{"score":{"name":"@s","objective":"bulw_chg"},"color":"white"},{"text":"/5 | Surge ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
