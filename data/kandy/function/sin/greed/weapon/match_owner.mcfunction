# Run as a carrier: if they shot the arrow being checked, store their Eclipse player id (every player has one)
data modify storage kandy:chainwarden cmp set from storage kandy:chainwarden owner
execute store success score #diff cw_tmp run data modify storage kandy:chainwarden cmp set from entity @s UUID
execute if score #diff cw_tmp matches 0 run scoreboard players operation #pid cw_tmp = @s ecl_pid
