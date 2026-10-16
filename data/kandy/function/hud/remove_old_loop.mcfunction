execute unless score #i hud_v matches 1.. run return 0
execute store result storage kandy:hud rid int 1 run scoreboard players get #i hud_v
function kandy:hud/remove_old with storage kandy:hud
scoreboard players remove #i hud_v 1
function kandy:hud/remove_old_loop
