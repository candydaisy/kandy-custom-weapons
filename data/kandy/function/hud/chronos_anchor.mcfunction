$bossbar set kandy:hud_$(id) color yellow
$bossbar set kandy:hud_$(id) max 120
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get @s chr_anc
$bossbar set kandy:hud_$(id) name [{"text":"Chronos Stiletto","color":"#fdcb6e"},{"text":" - Anchored ","color":"white"},{"score":{"name":"#a","objective":"hud_v"},"color":"white"},{"text":"s | Sneak + right-click to rewind","color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
