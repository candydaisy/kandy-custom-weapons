# Run as a creature the hunter just hit: below 30% of max health after the hit means Execution
scoreboard players set @s fang_hp 0
scoreboard players set @s fang_max 0
execute store result score @s fang_hp run data get entity @s Health 10
execute store result score @s fang_max run attribute @s minecraft:max_health get 3
execute if score @s fang_hp matches ..0 run return 0
execute if score @s fang_hp > @s fang_max run return 0
damage @s 3 kandy:predators_fang_execute by @p[tag=kandy.fang_hunter]
execute at @s run particle minecraft:damage_indicator ~ ~1 ~ 0.3 0.4 0.3 0.1 6
execute at @s run particle minecraft:crit ~ ~1 ~ 0.3 0.4 0.3 0.3 12
execute at @s run playsound minecraft:entity.player.attack.crit player @a[distance=..16] ~ ~ ~ 1 0.6
# Bloodscent: the execute killed it
execute store result score @s fang_hp run data get entity @s Health 10
execute if score @s fang_hp matches ..0 run effect give @p[tag=kandy.fang_hunter] minecraft:speed 3 0 true
