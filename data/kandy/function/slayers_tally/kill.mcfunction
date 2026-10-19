# Advancement reward: the player killed something. Carrying the Tally, a hostile kill notches its kind
advancement revoke @s only kandy:slayers_tally/kill
execute unless entity @s[tag=kandy.charm.slayers_tally] run return 0
tag @s add kandy.tly_slayer
function kandy:util/tag_kills
execute as @e[tag=kandy.killed] run function kandy:slayers_tally/notch
tag @e[tag=kandy.killed] remove kandy.killed
tag @s remove kandy.tly_slayer
