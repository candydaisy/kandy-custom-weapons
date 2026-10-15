# Right-click: calt_use is set by the using_item advancement; only the first tick of a press counts
execute as @a[tag=kandy.main.caltrops,scores={calt_use=1}] unless score @s calt_held matches 1 at @s run function kandy:caltrops/press
scoreboard players add @a calt_use 0
execute as @a run scoreboard players operation @s calt_held = @s calt_use
scoreboard players set @a[scores={calt_use=1..}] calt_use 0

scoreboard players add @a[tag=kandy.inv.caltrops] calt_cd 0
execute as @a[tag=kandy.inv.caltrops,scores={calt_cd=1}] at @s run playsound minecraft:block.chain.place player @s ~ ~ ~ 0.6 1.6
scoreboard players remove @a[scores={calt_cd=1..}] calt_cd 1

# Caltrop fields
execute as @e[type=marker,tag=calt.field] at @s run function kandy:caltrops/field

# Cripple timers, re-puncture timers and bleeding
scoreboard players remove @e[scores={calt_hit=1..}] calt_hit 1
scoreboard players remove @e[scores={calt_crip=1..}] calt_crip 1
execute as @e[scores={calt_crip=0}] run function kandy:caltrops/uncripple
execute as @e[scores={calt_crip=1..}] if predicate kandy:caltrops_sprinting run scoreboard players add @s calt_bleed 1
execute as @e[scores={calt_bleed=20..}] at @s run function kandy:caltrops/bleed

execute as @a[tag=kandy.main.caltrops] run function kandy:caltrops/bar
