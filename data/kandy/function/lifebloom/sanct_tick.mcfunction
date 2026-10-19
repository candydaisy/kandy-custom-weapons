# Run as and at a Sanctuary marker: a 5-block circle for 6s
scoreboard players remove @s lb_life 1
scoreboard players operation #m lb_tmp = @s lb_life
scoreboard players operation #m lb_tmp %= #20 lb_tmp
# Regeneration II: a fresh 3s dose only once the last one is gone (refreshing it every second would stop it from ever healing)
execute if score #m lb_tmp matches 0 as @a[distance=..5] unless predicate kandy:hearthstone_has_regen run effect give @s minecraft:regeneration 3 1
execute if score #m lb_tmp matches 0 run effect give @e[type=#kandy:monsters,distance=..5] minecraft:slowness 2 0
execute if score #m lb_tmp matches 0 run particle minecraft:spore_blossom_air ~ ~0.5 ~ 2.5 0.2 2.5 0 30
particle minecraft:cherry_leaves ^ ^0.2 ^5 0 0 0 0 1
execute rotated ~90 0 run particle minecraft:cherry_leaves ^ ^0.2 ^5 0 0 0 0 1
execute rotated ~180 0 run particle minecraft:cherry_leaves ^ ^0.2 ^5 0 0 0 0 1
execute rotated ~270 0 run particle minecraft:cherry_leaves ^ ^0.2 ^5 0 0 0 0 1
tp @s ~ ~ ~ ~9 0
execute if score @s lb_life matches ..0 run kill @s
