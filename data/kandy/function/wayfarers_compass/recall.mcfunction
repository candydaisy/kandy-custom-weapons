# Fully charged: check the cost and the respawn point, then wait for its chunk to load
scoreboard players set @s way_chg 0
scoreboard players set @s way_lock 1
scoreboard players set #lvl way_tmp 0
execute store result score #lvl way_tmp run experience query @s levels
execute unless entity @s[gamemode=creative] if score #lvl way_tmp matches ..4 run return run function kandy:wayfarers_compass/fizzle {why:"Not enough experience: a recall costs 5 levels"}

data remove storage kandy:wayfarers_compass r
data modify storage kandy:wayfarers_compass r set from entity @s respawn
execute unless data storage kandy:wayfarers_compass r.pos run return run function kandy:wayfarers_compass/fizzle {why:"You have no bed or respawn anchor set"}
execute store result storage kandy:wayfarers_compass t.x int 1 run data get storage kandy:wayfarers_compass r.pos[0]
execute store result storage kandy:wayfarers_compass t.y int 1 run data get storage kandy:wayfarers_compass r.pos[1]
execute store result storage kandy:wayfarers_compass t.z int 1 run data get storage kandy:wayfarers_compass r.pos[2]
data modify storage kandy:wayfarers_compass t.dim set value "minecraft:overworld"
data modify storage kandy:wayfarers_compass t.dim set from storage kandy:wayfarers_compass r.dimension
scoreboard players set @s way_forced 0
execute if data storage kandy:wayfarers_compass r{forced:1b} run scoreboard players set @s way_forced 1
function kandy:wayfarers_compass/begin with storage kandy:wayfarers_compass t
