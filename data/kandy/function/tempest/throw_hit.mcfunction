# Advancement reward: a thrown Tempest Pike hit something, arc lightning from where it landed
advancement revoke @s only kandy:tempest/throw_hit
execute if entity @s[tag=kandy.tem_busy] run return 0
tag @s add kandy.tem_busy
tag @s add kandy.tem_wielder
data modify storage kandy:tempest me set from entity @s UUID
execute as @e[type=trident,tag=kandy.tem_proj] if function kandy:tempest/is_mine run tag @s add kandy.tem_here
execute at @e[tag=kandy.tem_here] run function kandy:util/tag_victims
tag @e[tag=kandy.tem_here] remove kandy.tem_here
function kandy:tempest/chain_all
tag @s remove kandy.tem_wielder
tag @s remove kandy.tem_busy
