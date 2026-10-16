# Run as and at the pinging player: outline every ore within 6 blocks (13x13x13 scan, only on a ping)
scoreboard players set @s dlv_still 0
scoreboard players set @s dlv_cd 600
playsound minecraft:block.amethyst_block.resonate player @a[distance=..16] ~ ~ ~ 1 0.5
particle minecraft:sculk_charge_pop ~ ~1 ~ 1.5 0.5 1.5 0.05 30
scoreboard players set #x dlv_tmp 13
execute align xyz positioned ~-6 ~-6 ~-6 run function kandy:deepdelver_lamp/scan_x
