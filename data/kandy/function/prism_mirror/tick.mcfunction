# Remember each carrier's health (in tenths) so a projectile hit can be measured
execute as @a[tag=kandy.charm.prism_mirror] store result score @s prm_hp run data get entity @s Health 10
scoreboard players remove @a[scores={prm_cd=1..}] prm_cd 1
execute as @a[tag=kandy.charm.prism_mirror,scores={prm_cd=1}] at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 1.6
