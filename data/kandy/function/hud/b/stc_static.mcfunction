$bossbar add kandy:hud_$(id)_stc_static ""
$bossbar set kandy:hud_$(id)_stc_static color blue
$bossbar set kandy:hud_$(id)_stc_static max 100
$execute store result bossbar kandy:hud_$(id)_stc_static value run scoreboard players get @s stc_static
$execute if score @s stc_static matches ..99 run bossbar set kandy:hud_$(id)_stc_static name [{"text":"Stormcaller Coil","color":"#4cc9f0"},{"text":" - Static ","color":"white"},{"score":{"name":"@s","objective":"stc_static"},"color":"white"},{"text":"%","color":"white"}]
$execute if score @s stc_static matches 100.. run bossbar set kandy:hud_$(id)_stc_static name [{"text":"Stormcaller Coil","color":"#4cc9f0"},{"text":" - Static CHARGED","color":"yellow"}]
$bossbar set kandy:hud_$(id)_stc_static players @s
$bossbar set kandy:hud_$(id)_stc_static visible true
