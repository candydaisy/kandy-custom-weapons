# Run as a chained target: 3 lightning damage and a brief stagger
damage @s 3 minecraft:lightning_bolt by @p[tag=kandy.tem_wielder]
effect give @s minecraft:slowness 2 1 true
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.1 10
particle minecraft:glow ~ ~1 ~ 0.3 0.5 0.3 0 3
playsound minecraft:entity.lightning_bolt.impact player @a[distance=..16] ~ ~ ~ 0.4 1.8
scoreboard players set #steps tem_tmp 24
execute at @e[tag=kandy.tem_src,limit=1] positioned ~ ~1 ~ facing entity @s eyes run function kandy:tempest/arc
