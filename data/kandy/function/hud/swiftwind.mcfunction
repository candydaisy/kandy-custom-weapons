scoreboard players add @s sprint 0
$bossbar set kandy:hud_$(id) color green
$bossbar set kandy:hud_$(id) max 1000
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get @s sprint
$bossbar set kandy:hud_$(id) name [{"text":"Swiftwind","color":"#1bf9ce"},{"text":" - Momentum ","color":"white"},{"score":{"name":"@s","objective":"sprint"},"color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
