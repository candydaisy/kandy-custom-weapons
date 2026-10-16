$bossbar set kandy:hud_$(id) color white
$bossbar set kandy:hud_$(id) max 80
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get @s pyro_oh
$bossbar set kandy:hud_$(id) name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Overheated ","color":"gray"},{"score":{"name":"#h","objective":"hud_v"},"color":"gray"},{"text":"s","color":"gray"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
