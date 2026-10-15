tag @e[distance=..5,type=!#kandy:unpullable,tag=!ecl.owner,tag=!kandy.immune] add ecl.hit
execute if entity @a[tag=ecl.owner] as @e[tag=ecl.hit] run damage @s 1 minecraft:indirect_magic by @a[tag=ecl.owner,limit=1]
execute unless entity @a[tag=ecl.owner] as @e[tag=ecl.hit] run damage @s 1 minecraft:magic
tag @e[tag=ecl.hit] remove ecl.hit
playsound minecraft:block.respawn_anchor.ambient player @a[distance=..16] ~ ~ ~ 0.6 1.5
