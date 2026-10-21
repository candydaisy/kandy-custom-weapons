$bossbar add kandy:hud_$(id)_momentum ""
scoreboard players add @s sprint 0
$bossbar set kandy:hud_$(id)_momentum color pink
$bossbar set kandy:hud_$(id)_momentum max 1000
$execute store result bossbar kandy:hud_$(id)_momentum value run scoreboard players get @s sprint
$bossbar set kandy:hud_$(id)_momentum name [{"text":"Blood Pact Blade","color":"#ff4fa3"},{"text":" - Desire ","color":"white"},{"score":{"name":"@s","objective":"sprint"},"color":"white"}]
$bossbar set kandy:hud_$(id)_momentum players @s
$bossbar set kandy:hud_$(id)_momentum visible true
