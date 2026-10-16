# Advancement reward: hit entities get pulled for 3s; a sneaking, airborne hit also slams them
advancement revoke @s only kandy:hit/worldbreaker
# Our own slam damage counts as a hit too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.grav_busy] run return 0
tag @s add kandy.grav_busy
function kandy:util/tag_victims
scoreboard players set @e[tag=kandy.victim] grav_pull 60
execute if entity @s[nbt={OnGround:0b}] if predicate kandy:sneaking run tag @e[tag=kandy.victim] add kandy.grav_slam
# Slam: 6 extra damage on the same tick as the hit, credited to the wielder
execute as @e[tag=kandy.victim,tag=kandy.grav_slam] run damage @s 6 kandy:worldbreaker_slam by @p[tag=kandy.grav_busy]
tag @e[tag=kandy.victim] remove kandy.victim
tag @s remove kandy.grav_busy
