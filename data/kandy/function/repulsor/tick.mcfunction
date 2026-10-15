# Right-click: rep_use is set by the using_item advancement; only the first tick of a press counts
execute as @a[tag=kandy.main.repulsor,scores={rep_use=1}] unless score @s rep_held matches 1 at @s run function kandy:repulsor/press
scoreboard players add @a rep_use 0
execute as @a run scoreboard players operation @s rep_held = @s rep_use
scoreboard players set @a[scores={rep_use=1..}] rep_use 0
scoreboard players remove @a[scores={rep_cd=1..}] rep_cd 1

# Owner pickup: sneak on your own mine for 1s
scoreboard players set @a rep_tmp 0
execute as @a[scores={rep_pid=1..}] if predicate kandy:sneaking at @s run function kandy:repulsor/pickup_check
scoreboard players set @a[scores={rep_tmp=0}] rep_pick 0

execute as @e[type=marker,tag=kandy.rep_mine] at @s run function kandy:repulsor/mine_tick
execute as @e[type=marker,tag=kandy.rep_dome] at @s run function kandy:repulsor/dome_tick

execute as @a[tag=kandy.main.repulsor] run function kandy:repulsor/status
