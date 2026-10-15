# Run as and at an Ender Pearl inside a cloud
data remove storage kandy:smoke cmp
data modify storage kandy:smoke cmp set from entity @s Owner
execute store success score #diff smk_tmp run data modify storage kandy:smoke cmp set from storage kandy:smoke cloud_owner
execute if score #diff smk_tmp matches 0 run return 0
particle minecraft:portal ~ ~ ~ 0.3 0.3 0.3 0.3 25
particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0.02 8
playsound minecraft:block.fire.extinguish player @a[distance=..16] ~ ~ ~ 0.6 1.6
kill @s
