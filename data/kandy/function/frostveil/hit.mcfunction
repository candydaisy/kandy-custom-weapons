# Advancement reward: chill or shatter whatever the wielder hit
advancement revoke @s only kandy:hit/frostveil
# Shatter and Nova damage count as hits too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.frost_busy] run return 0
tag @s add kandy.frost_busy
tag @s add kandy.frost_wielder
function kandy:util/tag_victims

# Frozen victims shatter, everyone else gains a Hypothermia stack
execute as @e[tag=kandy.victim,scores={frost_frozen=1..}] at @s run function kandy:frostveil/shatter
execute as @e[tag=kandy.victim,tag=!kandy.frost_shattered] at @s run function kandy:frostveil/add_stack
tag @e[tag=kandy.frost_shattered] remove kandy.frost_shattered
tag @e[tag=kandy.victim] remove kandy.victim

# Frost Nova: sneak-attack, 8s cooldown
execute if score @s frost_cd matches 0 if predicate kandy:sneaking run function kandy:frostveil/nova

tag @s remove kandy.frost_wielder
tag @s remove kandy.frost_busy
