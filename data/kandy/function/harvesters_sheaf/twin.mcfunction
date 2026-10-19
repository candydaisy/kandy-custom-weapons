# Run as a newborn: summon one more of its kind and copy everything but its identity (variant, colour, owner, age)
tag @s add kandy.hvs_seen
data modify storage kandy:sheaf d set from entity @s
data remove storage kandy:sheaf d.UUID
data remove storage kandy:sheaf d.Pos
data remove storage kandy:sheaf d.Motion
execute at @s run function kandy:harvesters_sheaf/summon
execute as @e[tag=kandy.hvs_new,limit=1] run data modify entity @s {} merge from storage kandy:sheaf d
tag @e[tag=kandy.hvs_new] remove kandy.hvs_new
execute at @s run particle minecraft:heart ~ ~0.6 ~ 0.4 0.3 0.4 0 6
execute at @s run playsound minecraft:entity.experience_orb.pickup neutral @a[distance=..16] ~ ~ ~ 0.6 1.6
