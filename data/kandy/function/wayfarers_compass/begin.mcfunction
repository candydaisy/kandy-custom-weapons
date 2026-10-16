# Macro: same dimension only; load the destination chunk if needed, then pending/try finish the recall
$execute unless dimension $(dim) run return run function kandy:wayfarers_compass/fizzle {why:"Your respawn point is in another dimension"}
$scoreboard players set @s way_tx $(x)
$scoreboard players set @s way_ty $(y)
$scoreboard players set @s way_tz $(z)
scoreboard players set @s way_fl 0
$execute unless loaded $(x) $(y) $(z) run scoreboard players set @s way_fl 1
$execute if score @s way_fl matches 1 run forceload add $(x) $(z)
scoreboard players set @s way_wait 60
playsound minecraft:block.portal.trigger player @s ~ ~ ~ 0.4 1.6
