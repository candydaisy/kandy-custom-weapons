$bossbar set kandy:hud_$(id) color yellow
$bossbar set kandy:hud_$(id) max 120
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get @s pyro_od
$bossbar set kandy:hud_$(id) name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - OVERDRIVE ","color":"yellow"},{"score":{"name":"#o","objective":"hud_v"},"color":"yellow"},{"text":"s","color":"yellow"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
