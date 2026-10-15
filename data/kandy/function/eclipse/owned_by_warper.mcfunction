# Run as an arrow: is it owned by the player whose UUID is cached in storage kandy:eclipse me?
# (execute on owner doesn't resolve arrow owners in 26.3, so compare the Owner UUID directly)
data remove storage kandy:eclipse cmp
data modify storage kandy:eclipse cmp set from entity @s Owner
execute store success score #diff ecl_tmp run data modify storage kandy:eclipse cmp set from storage kandy:eclipse me
execute if score #diff ecl_tmp matches 0 run return 1
return fail
