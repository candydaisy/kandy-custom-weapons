scoreboard players add @s hare_cd 0
scoreboard players set @s hare_jump 0
execute if predicate kandy:hares_foot_jump run scoreboard players set @s hare_jump 1
execute if score @s hare_jump matches 1 unless score @s hare_prev matches 1 if score @s hare_cd matches 0 if predicate kandy:hares_foot_sprinting at @s run function kandy:hares_foot/burst
scoreboard players operation @s hare_prev = @s hare_jump
