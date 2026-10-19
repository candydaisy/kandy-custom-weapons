# Advancement reward: a charged hit on a mob. Seed of Life heals the most hurt other player within 8 blocks
advancement revoke @s only kandy:hit/lifebloom
scoreboard players set #min lb_tmp 1000
execute as @a[distance=0.01..8] run scoreboard players operation #min lb_tmp < @s hp
# shortcut: "hurt" means below 20 HP, so players with bonus max health count as full at 20
execute if score #min lb_tmp matches 20.. run return 0
execute as @a[distance=0.01..8] if score @s hp = #min lb_tmp run tag @s add kandy.lb_pick
effect give @a[tag=kandy.lb_pick,sort=nearest,limit=1] minecraft:regeneration 2 1
execute at @a[tag=kandy.lb_pick,sort=nearest,limit=1] run particle minecraft:heart ~ ~1.8 ~ 0.2 0.2 0.2 0 2
tag @a remove kandy.lb_pick
