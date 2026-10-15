# Advancement reward: a blocked melee hit. It's a Parry if Sneak was tapped just before it landed
advancement revoke @s only kandy:abyssal/parry
execute unless score @s bulw_brace matches 1.. run return 0
scoreboard players set @s bulw_brace 0
scoreboard players set @s bulw_pcd 80
# +2 here and +1 from the block itself = 3 charges
scoreboard players add @s bulw_chg 2
scoreboard players set @s[scores={bulw_chg=6..}] bulw_chg 5
scoreboard players set @s bulw_decay 200
execute on attacker at @s run function kandy:abyssal/stagger
particle minecraft:splash ~ ~1.2 ~ 0.6 0.6 0.6 0.2 40
particle minecraft:nautilus ~ ~1.2 ~ 0.6 0.6 0.6 0.5 30
playsound minecraft:block.anvil.land player @a[distance=..16] ~ ~ ~ 0.7 2
