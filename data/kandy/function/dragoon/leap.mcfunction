# Dragoon Leap: about 5 blocks straight up, no fall damage until you land
effect give @s minecraft:levitation 1 9 true
scoreboard players set @s dg_lev 10
scoreboard players set @s dg_st 70
attribute @s minecraft:fall_damage_multiplier modifier add kandy:dragoon_fall -1 add_multiplied_total
tag @s add kandy.dg_nofall
scoreboard players set @s dg_fall 15
particle minecraft:cloud ~ ~0.2 ~ 0.4 0.1 0.4 0.05 15
playsound minecraft:entity.ender_dragon.flap player @a[distance=..16] ~ ~ ~ 1 1.2
