# Run as and at each mine every tick
scoreboard players remove @s rep_life 1
execute if score @s rep_life matches ..0 run return run function kandy:repulsor/expire
execute if score @s rep_arm matches 1.. run return run function kandy:repulsor/arming

# Armed: a faint gust every 0.5s so the mine can be spotted and avoided
scoreboard players operation #t rep_tmp = @s rep_life
scoreboard players operation #t rep_tmp %= #10 rep_tmp
execute if score #t rep_tmp matches 0 run particle minecraft:small_gust ~ ~0.25 ~ 0.1 0.05 0.1 0 1

# Mark the owner (if online) so they never set off their own mine
scoreboard players operation #pid rep_tmp = @s rep_pid
execute as @a if score @s rep_pid = #pid rep_tmp run tag @s add kandy.rep_owner
execute if entity @a[distance=..3,tag=!kandy.rep_owner,tag=!kandy.immune] run function kandy:repulsor/detonate
execute if entity @s[tag=kandy.rep_mine] if entity @e[type=end_crystal,distance=..6,nbt={ShowBottom:0b}] run function kandy:repulsor/detonate
tag @a remove kandy.rep_owner
