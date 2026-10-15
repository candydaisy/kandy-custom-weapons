# Advancement reward: a charged melee hit arcs lightning from each victim (and calls Skyward Wrath when sneaking)
advancement revoke @s only kandy:hit/tempest
# Our own lightning damage counts as a hit too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.tem_busy] run return 0
tag @s add kandy.tem_busy
tag @s add kandy.tem_wielder
function kandy:util/tag_victims
# Skyward Wrath first, while the hit targets are still tagged: a sneaking charged hit calls the bolt
scoreboard players add @s tem_scd 0
execute if score @s tem_scd matches 0 if entity @e[tag=kandy.victim] if predicate kandy:sneaking at @s run function kandy:tempest/wrath
function kandy:tempest/chain_all
tag @s remove kandy.tem_wielder
tag @s remove kandy.tem_busy
