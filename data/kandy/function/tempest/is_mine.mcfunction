# Run as a trident: is it owned by the player whose UUID is cached in storage kandy:tempest me?
# (execute on owner doesn't resolve projectile owners in 26.3, so compare the Owner UUID directly)
data remove storage kandy:tempest cmp
data modify storage kandy:tempest cmp set from entity @s Owner
execute store success score #diff tem_tmp run data modify storage kandy:tempest cmp set from storage kandy:tempest me
execute if score #diff tem_tmp matches 0 run return 1
return fail
