# Advancement reward: a hit was blocked with the Bulwark, store it as Abyssal Pressure
advancement revoke @s only kandy:sin/sloth/block
scoreboard players add @s bulw_chg 1
function kandy:sin/sloth/weapon/cap
scoreboard players set @s bulw_decay 200
effect give @s minecraft:resistance 3 0 true
execute if score @s bulw_chg matches 4.. run effect give @s minecraft:resistance 3 1 true
particle minecraft:bubble_pop ~ ~1 ~ 0.4 0.5 0.4 0.05 10
playsound minecraft:block.bubble_column.bubble_pop player @a[distance=..12] ~ ~ ~ 1 0.8
