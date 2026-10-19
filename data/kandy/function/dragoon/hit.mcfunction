# Advancement reward: the spear hit something. During a held charge it Skewers, otherwise it Punctures
advancement revoke @s only kandy:hit/dragoon
# Our own Puncture damage counts as a hit too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.dg_busy] run return 0
tag @s add kandy.dg_busy
function kandy:util/tag_victims
scoreboard players operation #id dg_tmp = @s ecl_pid
execute if score @s dg_use matches 1.. as @e[tag=kandy.victim] run function kandy:dragoon/skewer
execute unless score @s dg_use matches 1.. as @e[tag=kandy.victim] at @s run function kandy:dragoon/puncture
tag @e[tag=kandy.victim] remove kandy.victim
tag @s remove kandy.dg_busy
