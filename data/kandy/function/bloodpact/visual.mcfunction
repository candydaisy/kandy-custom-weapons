execute as @a[tag=kandy.main.bloodpact] at @s run particle minecraft:block_crumble{block_state:{id:redstone_block}} ~ ~1 ~ 0.5 1.0 0.5 0.05 4 normal
execute as @a[tag=kandy.inv.bloodpact,scores={hp=..12}] at @s run particle minecraft:damage_indicator ~ ~1 ~ 0.5 0.5 0.5 0.1 1
