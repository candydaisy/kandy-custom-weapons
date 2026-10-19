# Run as a pet: does its Owner match the UUID in kandy:beast me? (Copying over an equal value doesn't count as a change)
data remove storage kandy:beast c
data modify storage kandy:beast c set from entity @s Owner
execute store success score #diff bst_tmp run data modify storage kandy:beast c set from storage kandy:beast me
execute if score #diff bst_tmp matches 0 run return 1
return fail
