# Active: Tether the nearest creature the bolt hit, 4s (6s from tier 2). Tier 3 chains a second creature within 4 blocks of it
tag @e[tag=kandy.cw_hit,sort=nearest,limit=1] add kandy.cw_new
tag @s add kandy.cw_self
execute if score @s kandy.wt matches 3 at @e[tag=kandy.cw_new] run tag @e[distance=0.1..4,type=!#kandy:unpullable,tag=!kandy.cw_tethered,tag=!kandy.cw_self,tag=!kandy.immune,sort=nearest,limit=1] add kandy.cw_new
tag @s remove kandy.cw_self
scoreboard players operation @e[tag=kandy.cw_new] cw_by = @s ecl_pid
tag @e[tag=kandy.cw_new] add kandy.cw_tethered
execute at @e[tag=kandy.cw_new] run playsound minecraft:block.chain.place player @a[distance=..16] ~ ~ ~ 1 0.6
tag @e[tag=kandy.cw_new] remove kandy.cw_new
scoreboard players set @s cw_tt 80
execute if score @s kandy.wt matches 2.. run scoreboard players set @s cw_tt 120
scoreboard players set @s cw_reel 0
attribute @s minecraft:movement_speed modifier add kandy:chainwarden_drag -0.15 add_multiplied_total
