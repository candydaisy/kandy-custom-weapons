tag @e[tag=kandy.cw_hit,sort=nearest,limit=1] add kandy.cw_new
scoreboard players operation @e[tag=kandy.cw_new] cw_by = @s ecl_pid
tag @e[tag=kandy.cw_new] add kandy.cw_tethered
execute at @e[tag=kandy.cw_new] run playsound minecraft:block.chain.place player @a[distance=..16] ~ ~ ~ 1 0.6
tag @e[tag=kandy.cw_new] remove kandy.cw_new
scoreboard players set @s cw_tt 80
scoreboard players set @s cw_reel 0
attribute @s minecraft:movement_speed modifier add kandy:chainwarden_drag -0.15 add_multiplied_total
