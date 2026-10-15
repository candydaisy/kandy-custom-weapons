# Run as each player: tag them if their UUID matches the stored Owner (execute on owner doesn't resolve arrow owners in 26.3)
data remove storage kandy:decay_dart cmp
data modify storage kandy:decay_dart cmp set from storage kandy:decay_dart owner
execute store success score #diff dart_tmp run data modify storage kandy:decay_dart cmp set from entity @s UUID
execute if score #diff dart_tmp matches 0 run tag @s add dart.src
