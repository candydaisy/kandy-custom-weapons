# Run as a projectile: was it fired by the mine's owner (UUID in storage kandy:repulsor me)?
# execute on owner doesn't resolve projectile owners in 26.3, so compare the Owner UUID directly
data remove storage kandy:repulsor cmp
data modify storage kandy:repulsor cmp set from entity @s Owner
execute store success score #diff rep_tmp run data modify storage kandy:repulsor cmp set from storage kandy:repulsor me
execute if score #diff rep_tmp matches 0 run return 1
return fail
