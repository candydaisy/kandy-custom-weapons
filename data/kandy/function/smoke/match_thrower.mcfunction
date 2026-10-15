# Run as each player: tag them if their UUID matches the grenade's Owner
data remove storage kandy:smoke cmp
data modify storage kandy:smoke cmp set from storage kandy:smoke owner
execute store success score #diff smk_tmp run data modify storage kandy:smoke cmp set from entity @s UUID
execute if score #diff smk_tmp matches 0 run tag @s add smk.thrower
