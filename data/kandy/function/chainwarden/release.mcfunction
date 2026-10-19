# Run as the tetherer (#id cw_tmp set): drop the chain and start the cooldown
execute as @e[tag=kandy.cw_tethered] if score @s cw_by = #id cw_tmp run tag @s remove kandy.cw_tethered
scoreboard players set @s cw_tt 0
scoreboard players set @s cw_reel 0
scoreboard players set @s cw_cd 200
attribute @s minecraft:movement_speed modifier remove kandy:chainwarden_drag
execute at @s run playsound minecraft:block.chain.break player @a[distance=..16] ~ ~ ~ 1 0.8
