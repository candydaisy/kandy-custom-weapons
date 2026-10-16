# Run as and at a player whose recall is waiting on the destination chunk
scoreboard players remove @s way_wait 1
execute store result storage kandy:wayfarers_compass t.x int 1 run scoreboard players get @s way_tx
execute store result storage kandy:wayfarers_compass t.y int 1 run scoreboard players get @s way_ty
execute store result storage kandy:wayfarers_compass t.z int 1 run scoreboard players get @s way_tz
function kandy:wayfarers_compass/try with storage kandy:wayfarers_compass t
