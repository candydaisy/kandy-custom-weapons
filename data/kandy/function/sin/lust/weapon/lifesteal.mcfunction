execute if score @s kandy.wt matches 2.. run effect give @s minecraft:regeneration 1 3 true
effect give @s minecraft:instant_health 1 0 true
particle minecraft:damage_indicator ~ ~1 ~ 0.4 0.5 0.4 0.1 6
particle minecraft:block_crumble{block_state:{id:redstone_block}} ~ ~1 ~ 0.4 0.6 0.4 0.05 12
playsound minecraft:entity.generic.drink player @a[distance=..12] ~ ~ ~ 0.8 0.6
