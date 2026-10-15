# Run as a vortex marker every tick
tag @s add ecl.active
scoreboard players operation #owner ecl_tmp = @s ecl_pid
execute as @a if score @s ecl_pid = #owner ecl_tmp run tag @s add ecl.owner

particle minecraft:reverse_portal ~ ~0.5 ~ 2 1 2 0.15 15
particle minecraft:dragon_breath ~ ~0.5 ~ 1.2 0.6 1.2 0.01 4
particle minecraft:squid_ink ~ ~0.5 ~ 0.3 0.3 0.3 0.02 2

# Pull toward the core: mobs fast, players gently, never the shooter
execute as @e[distance=0.8..5,type=!player,type=!#kandy:unpullable] at @s facing entity @e[type=marker,tag=ecl.active,limit=1] feet rotated ~ 0 if block ^ ^ ^0.5 #kandy:passable if block ^ ^1 ^0.5 #kandy:passable run tp @s ^ ^ ^0.2
execute as @a[distance=0.8..5,tag=!ecl.owner,tag=!kandy.immune] at @s facing entity @e[type=marker,tag=ecl.active,limit=1] feet rotated ~ 0 if block ^ ^ ^0.5 #kandy:passable if block ^ ^1 ^0.5 #kandy:passable run tp @s ^ ^ ^0.08

# 1 armor-piercing damage every 0.5s to everything inside
scoreboard players operation #m ecl_tmp = @s ecl_life
scoreboard players operation #m ecl_tmp %= #10 ecl_tmp
execute if score #m ecl_tmp matches 0 run function kandy:eclipse/vortex_pulse

scoreboard players remove @s ecl_life 1
execute if score @s ecl_life matches ..0 run function kandy:eclipse/implode
tag @a[tag=ecl.owner] remove ecl.owner
tag @s remove ecl.active
