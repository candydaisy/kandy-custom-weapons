# Macro: $(id) just got a fresh potion; give it 50% more time (capped at 8 minutes), keeping its level
$data modify storage kandy:alchemist cur set value {id:"$(id)",amp:0}
$execute store result storage kandy:alchemist cur.amp int 1 run data get storage kandy:alchemist fx[{id:"$(id)"}].amplifier
scoreboard players operation #dur alch_tmp = #cur alch_tmp
scoreboard players operation #dur alch_tmp *= #3 alch_tmp
scoreboard players operation #dur alch_tmp /= #2 alch_tmp
execute if score #dur alch_tmp matches 9601.. run scoreboard players set #dur alch_tmp 9600
scoreboard players operation #dur alch_tmp /= #20 alch_tmp
execute store result storage kandy:alchemist cur.secs int 1 run scoreboard players get #dur alch_tmp
function kandy:alchemist/infuse_apply with storage kandy:alchemist cur
scoreboard players set #ext alch_tmp 1
