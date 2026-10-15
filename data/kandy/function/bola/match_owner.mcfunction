# Run as a player: tag them bola.thrower if their UUID matches storage kandy:bola owner
# (execute on owner doesn't resolve projectile owners in 26.3)
data remove storage kandy:bola cmp
data modify storage kandy:bola cmp set from storage kandy:bola owner
execute store success score #diff bola_tmp run data modify storage kandy:bola cmp set from entity @s UUID
execute if score #diff bola_tmp matches 0 run tag @s add bola.thrower
