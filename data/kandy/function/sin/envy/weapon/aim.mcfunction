# Run as a drawing player, positioned at their eyes: find the first creature along the view (48 blocks)
tag @s add kandy.fl_self
scoreboard players set #steps fl_tmp 96
function kandy:sin/envy/weapon/ray
tag @s remove kandy.fl_self
execute unless entity @e[tag=kandy.fl_ray] run return run scoreboard players set @s fl_ct 0

execute as @e[tag=kandy.fl_ray] unless score @s fl_eid matches 1.. store result score @s fl_eid run scoreboard players add #next fl_eid 1
tag @e[tag=kandy.fl_ray] add kandy.fl_marked
scoreboard players operation #e fl_tmp = @e[tag=kandy.fl_ray,limit=1] fl_eid
tag @e[tag=kandy.fl_ray] remove kandy.fl_ray

# Already locked onto it
execute if score @s fl_lt matches 1.. if score #e fl_tmp = @s fl_lock run return 0
execute unless score #e fl_tmp = @s fl_cand run scoreboard players set @s fl_ct 0
scoreboard players operation @s fl_cand = #e fl_tmp
scoreboard players add @s fl_ct 1
function kandy:sin/tier
scoreboard players set #need fl_tmp 15
execute if score @s kandy.wt matches 2.. run scoreboard players set #need fl_tmp 10
# Spite: a creature you Marked with the Lens locks at once
scoreboard players operation #me fl_tmp = @s ecl_pid
execute if entity @s[tag=kandy.envy.set] as @e[tag=kandy.fl_marked,scores={wat_mt=1..}] if score @s fl_eid = #e fl_tmp if score @s wat_by = #me fl_tmp run scoreboard players set #need fl_tmp 1
execute if score @s fl_ct >= #need fl_tmp at @s run function kandy:sin/envy/weapon/lock
