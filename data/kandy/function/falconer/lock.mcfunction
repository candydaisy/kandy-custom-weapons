scoreboard players operation @s fl_lock = @s fl_cand
scoreboard players set @s fl_lt 160
scoreboard players set @s fl_ct 0
playsound minecraft:entity.parrot.ambient player @s ~ ~ ~ 1 1.6
# Two-way Sight: locking onto a player reveals you
scoreboard players operation #t fl_tmp = @s fl_lock
execute as @a[tag=kandy.fl_marked] if score @s fl_eid = #t fl_tmp run tag @s add kandy.fl_prey
execute if entity @a[tag=kandy.fl_prey] run effect give @s minecraft:glowing 3 0
tag @a remove kandy.fl_prey
