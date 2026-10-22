# Run as and at a homing arrow: blend its motion toward the target (new = (2 x old + 2.5 blocks/tick toward target) / 3)
scoreboard players operation #t fl_tmp = @s fl_tgt
execute as @e[tag=kandy.fl_marked,distance=..64] if score @s fl_eid = #t fl_tmp run tag @s add kandy.fl_aim
execute unless entity @e[tag=kandy.fl_aim] run return run tag @s remove kandy.fl_homing

summon minecraft:marker ~ ~ ~ {Tags:["kandy.fl_dir"]}
execute facing entity @e[tag=kandy.fl_aim,limit=1] eyes positioned ^ ^ ^2.5 run tp @e[type=minecraft:marker,tag=kandy.fl_dir] ~ ~ ~
tag @e[tag=kandy.fl_aim] remove kandy.fl_aim

execute store result score #dx fl_tmp run data get entity @e[type=minecraft:marker,tag=kandy.fl_dir,limit=1] Pos[0] 100
execute store result score #dy fl_tmp run data get entity @e[type=minecraft:marker,tag=kandy.fl_dir,limit=1] Pos[1] 100
execute store result score #dz fl_tmp run data get entity @e[type=minecraft:marker,tag=kandy.fl_dir,limit=1] Pos[2] 100
kill @e[type=minecraft:marker,tag=kandy.fl_dir]
execute store result score #ax fl_tmp run data get entity @s Pos[0] 100
execute store result score #ay fl_tmp run data get entity @s Pos[1] 100
execute store result score #az fl_tmp run data get entity @s Pos[2] 100
scoreboard players operation #dx fl_tmp -= #ax fl_tmp
scoreboard players operation #dy fl_tmp -= #ay fl_tmp
scoreboard players operation #dz fl_tmp -= #az fl_tmp

execute store result score #mx fl_tmp run data get entity @s Motion[0] 200
execute store result score #my fl_tmp run data get entity @s Motion[1] 200
execute store result score #mz fl_tmp run data get entity @s Motion[2] 200
scoreboard players operation #mx fl_tmp += #dx fl_tmp
scoreboard players operation #my fl_tmp += #dy fl_tmp
scoreboard players operation #mz fl_tmp += #dz fl_tmp
execute store result entity @s Motion[0] double 0.003333 run scoreboard players get #mx fl_tmp
execute store result entity @s Motion[1] double 0.003333 run scoreboard players get #my fl_tmp
execute store result entity @s Motion[2] double 0.003333 run scoreboard players get #mz fl_tmp
particle minecraft:small_gust ~ ~ ~ 0 0 0 0 1
