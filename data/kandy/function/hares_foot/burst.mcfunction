# Speed II for 1.5s, as an attribute so it lasts exactly 30 ticks (effects only take whole seconds)
scoreboard players set @s hare_cd 80
scoreboard players set @s hare_bt 30
attribute @s minecraft:movement_speed modifier remove kandy:hare_burst
attribute @s minecraft:movement_speed modifier add kandy:hare_burst 0.4 add_multiplied_total
tag @s add kandy.hare_burst
particle minecraft:cloud ~ ~0.1 ~ 0.3 0.05 0.3 0.02 8
playsound minecraft:entity.rabbit.jump player @a[distance=..12] ~ ~ ~ 1 1.2
