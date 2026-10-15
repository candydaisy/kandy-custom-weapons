execute if block ~ ~-1 ~ #kandy:passable run tp @s ~ ~-1 ~
effect give @s minecraft:slowness 1 0 true
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1
playsound minecraft:block.anvil.land player @a[distance=..10] ~ ~ ~ 1 0.6
tag @s remove kandy.grav_slam
