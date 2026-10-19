execute if score @s lb_scd matches 1.. run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.6
scoreboard players set @s lb_scd 600
scoreboard players set @s lb_sa 200
playsound minecraft:block.beacon.activate player @a[distance=..16] ~ ~ ~ 1 1.6
