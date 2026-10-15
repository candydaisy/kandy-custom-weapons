# Run as and at an entity that stepped into a field (the placer is tagged calt.owner)
scoreboard players set @s calt_hit 30
execute if entity @a[tag=calt.owner] run damage @s 2 kandy:caltrops_puncture by @a[tag=calt.owner,limit=1]
execute unless entity @a[tag=calt.owner] run damage @s 2 kandy:caltrops_puncture
attribute @s minecraft:movement_speed modifier add kandy:caltrops_cripple -0.35 add_multiplied_total
scoreboard players set @s calt_crip 80
particle minecraft:crit ~ ~0.3 ~ 0.3 0.1 0.3 0.1 8
playsound minecraft:block.chain.step player @a[distance=..12] ~ ~ ~ 1 1.2
playsound minecraft:entity.player.hurt_sweet_berry_bush player @a[distance=..12] ~ ~ ~ 0.8 1
