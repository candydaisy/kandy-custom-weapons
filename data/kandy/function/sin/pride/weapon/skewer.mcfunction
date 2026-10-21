# Run as a creature hit by a charge: -15% armor and Slowness II for 3s
attribute @s minecraft:armor modifier remove kandy:skewer
attribute @s minecraft:armor modifier add kandy:skewer -0.15 add_multiplied_total
effect give @s minecraft:slowness 3 1
scoreboard players set @s dg_sk 60
