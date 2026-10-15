# Bubble Burst: dash up to 8 blocks where you're looking, stopping at solid blocks
scoreboard players set @s pearl_cd 100
scoreboard players set @s pearl_tap 0
particle minecraft:bubble_pop ~ ~1 ~ 0.4 0.4 0.4 0.05 20
particle minecraft:current_down ~ ~1 ~ 0.3 0.3 0.3 0 10
playsound minecraft:item.trident.riptide_1 player @a[distance=..16] ~ ~ ~ 1 1.2
scoreboard players set #steps pearl_tmp 16
function kandy:abyssal_pearl/dash_step

# Burst out of the water: launch skyward (good for opening an elytra), and land softly
execute at @s unless block ~ ~ ~ minecraft:water run effect give @s minecraft:levitation 1 6 true
execute at @s unless block ~ ~ ~ minecraft:water run effect give @s minecraft:slow_falling 3 0 true
