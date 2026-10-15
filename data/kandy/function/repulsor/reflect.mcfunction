# Run as and at a projectile: reverse its flight and credit the mine's owner
tag @s add kandy.rep_reflected
execute store result score #x rep_tmp run data get entity @s Motion[0] 1000
execute store result score #y rep_tmp run data get entity @s Motion[1] 1000
execute store result score #z rep_tmp run data get entity @s Motion[2] 1000
execute store result entity @s Motion[0] double -0.001 run scoreboard players get #x rep_tmp
execute store result entity @s Motion[1] double -0.001 run scoreboard players get #y rep_tmp
execute store result entity @s Motion[2] double -0.001 run scoreboard players get #z rep_tmp
execute if data storage kandy:repulsor me run data modify entity @s Owner set from storage kandy:repulsor me
particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0.2 6
playsound minecraft:item.shield.block player @a[distance=..16] ~ ~ ~ 0.8 1.4
