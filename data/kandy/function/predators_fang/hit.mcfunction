# Advancement reward: a charged melee hit by anyone; only Fang carriers execute
advancement revoke @s only kandy:predators_fang/hit
execute unless entity @s[tag=kandy.charm.predators_fang] run return 0
# Our own bonus damage counts as a hit too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.fang_busy] run return 0
tag @s add kandy.fang_busy
tag @s add kandy.fang_hunter
function kandy:util/tag_victims
execute as @e[tag=kandy.victim] run function kandy:predators_fang/check
tag @e[tag=kandy.victim] remove kandy.victim
tag @s remove kandy.fang_hunter
tag @s remove kandy.fang_busy
