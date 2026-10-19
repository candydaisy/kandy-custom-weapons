effect clear @s minecraft:levitation
scoreboard players set @s dg_lev 0
scoreboard players set @s dg_dive 1
attribute @s minecraft:gravity modifier add kandy:dragoon_dive 0.4 add_value
playsound minecraft:entity.phantom.swoop player @a[distance=..16] ~ ~ ~ 1 0.8
