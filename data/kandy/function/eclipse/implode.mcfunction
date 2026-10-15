# End of the vortex: a void boom for 6 damage at the core
tag @e[distance=..3,type=!#kandy:unpullable,tag=!ecl.owner,tag=!kandy.immune] add ecl.hit
execute if entity @a[tag=ecl.owner] as @e[tag=ecl.hit] run damage @s 6 minecraft:player_explosion by @a[tag=ecl.owner,limit=1]
execute unless entity @a[tag=ecl.owner] as @e[tag=ecl.hit] run damage @s 6 minecraft:explosion
tag @e[tag=ecl.hit] remove ecl.hit
particle minecraft:sonic_boom ~ ~0.5 ~ 0 0 0 0 1
particle minecraft:reverse_portal ~ ~0.5 ~ 0.3 0.3 0.3 1 120
playsound minecraft:entity.warden.sonic_boom player @a[distance=..32] ~ ~ ~ 1 0.8
kill @s
