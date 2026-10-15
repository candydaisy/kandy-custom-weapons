# Run as a player off Singularity cooldown: tag them if they shot the arrow being checked
data remove storage kandy:eclipse cmp
data modify storage kandy:eclipse cmp set from storage kandy:eclipse owner
execute store success score #diff ecl_tmp run data modify storage kandy:eclipse cmp set from entity @s UUID
execute if score #diff ecl_tmp matches 0 run tag @s add ecl.shooter
