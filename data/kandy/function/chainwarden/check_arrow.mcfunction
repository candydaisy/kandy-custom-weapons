# Run once per arrow
tag @s add kandy.cw_seen
execute unless data entity @s weapon.components."minecraft:custom_data"{ability:"Chainwarden"} run return 0
tag @s add kandy.cw_bolt
# (execute on owner doesn't resolve arrow owners in 26.3, so compare the Owner UUID directly)
data modify storage kandy:chainwarden owner set from entity @s Owner
scoreboard players set #pid cw_tmp 0
execute as @a[tag=kandy.inv.chainwarden] run function kandy:chainwarden/match_owner
scoreboard players operation @s cw_by = #pid cw_tmp
