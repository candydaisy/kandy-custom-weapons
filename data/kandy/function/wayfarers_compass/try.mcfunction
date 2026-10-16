# Macro: once the chunk is loaded (or time runs out), find a safe spot at the respawn point
$execute unless loaded $(x) $(y) $(z) if score @s way_wait matches 1.. run return 0
scoreboard players set @s way_wait 0
tag @s remove kandy.way_arrived
$execute if loaded $(x) $(y) $(z) positioned $(x) $(y) $(z) run function kandy:wayfarers_compass/find
$execute if score @s way_fl matches 1 run forceload remove $(x) $(z)
scoreboard players set @s way_fl 0
execute if entity @s[tag=kandy.way_arrived] run return run function kandy:wayfarers_compass/arrived
function kandy:wayfarers_compass/fizzle {why:"Your bed or anchor is missing, blocked or out of reach"}
