# One shared clock: the hearth scan runs once a second, the hunger drain every 20 seconds
scoreboard players add #t hth_tmp 1
execute if score #t hth_tmp matches 400.. run scoreboard players set #t hth_tmp 0
scoreboard players operation #m hth_tmp = #t hth_tmp
scoreboard players operation #m hth_tmp %= #20 hth_tmp

# Hearthside: Regeneration I near a lit campfire, furnace, blast furnace or smoker (only topped up once it runs out,
# since refreshing Regeneration every second would make it heal far faster than level I)
execute if score #m hth_tmp matches 0 run tag @a remove kandy.hth_warm
execute if score #m hth_tmp matches 0 as @a[tag=kandy.charm.hearthstone] at @s run function kandy:hearthstone/scan
execute as @a[tag=kandy.hth_warm,tag=kandy.charm.hearthstone] unless predicate kandy:hearthstone_has_regen run effect give @s minecraft:regeneration 3 0 true
execute if score #m hth_tmp matches 0 as @a[tag=kandy.hth_warm,tag=kandy.charm.hearthstone] at @s run particle minecraft:small_flame ~ ~0.1 ~ 0.3 0.05 0.3 0.01 3

# Downside: a warm belly empties fast (a short Hunger IV pulse every 20s, about 20% faster hunger loss)
execute if score #t hth_tmp matches 0 run effect give @a[tag=kandy.charm.hearthstone] minecraft:hunger 1 3 true
