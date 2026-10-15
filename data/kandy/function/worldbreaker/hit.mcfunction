# Advancement reward: hit entities get pulled for 3s; a sneaking, airborne hit also slams them
advancement revoke @s only kandy:hit/worldbreaker
function kandy:util/tag_victims
scoreboard players set @e[tag=kandy.victim] grav_pull 60
execute if entity @s[nbt={OnGround:0b}] if predicate kandy:sneaking run tag @e[tag=kandy.victim] add kandy.grav_slam
tag @e[tag=kandy.victim] remove kandy.victim
