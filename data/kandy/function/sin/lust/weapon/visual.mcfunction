execute as @a[tag=kandy.lust.w] at @s run particle minecraft:block_crumble{block_state:{id:redstone_block}} ~ ~1 ~ 0.5 1.0 0.5 0.05 4 normal
execute as @a[tag=kandy.lust.wi,scores={hp=..12}] at @s run particle minecraft:damage_indicator ~ ~1 ~ 0.5 0.5 0.5 0.1 1
execute as @a[tag=kandy.lust.w,scores={sprint=750..}] at @s run particle minecraft:dust{color:[1.0,0.31,0.64],scale:0.8} ~ ~0.2 ~ 0.4 0.1 0.4 0 3
