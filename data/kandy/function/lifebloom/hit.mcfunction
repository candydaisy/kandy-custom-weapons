# Advancement reward: a charged hit on a mob. Seed of Life heals the most hurt teammate within 8 blocks
advancement revoke @s only kandy:hit/lifebloom
function kandy:team/tag_allies {r:8}
scoreboard players set #min lb_tmp 1000
execute as @a[tag=kandy.ally] run scoreboard players operation #min lb_tmp < @s hp
# shortcut: "hurt" means below 20 HP, so players with bonus max health count as full at 20
execute if score #min lb_tmp matches ..19 as @a[tag=kandy.ally] if score @s hp = #min lb_tmp run tag @s add kandy.lb_pick
effect give @a[tag=kandy.lb_pick,sort=nearest,limit=1] minecraft:regeneration 2 1
execute at @a[tag=kandy.lb_pick,sort=nearest,limit=1] run particle minecraft:heart ~ ~1.8 ~ 0.2 0.2 0.2 0 2
tag @a remove kandy.lb_pick
tag @a remove kandy.ally
