# Run as the tetherer (#id cw_tmp set): drop the chain and start the cooldown (doubled if they let go of the arbalest)
execute as @e[tag=kandy.cw_tethered] if score @s cw_by = #id cw_tmp run tag @s remove kandy.cw_tethered
scoreboard players set @s cw_tt 0
scoreboard players set @s cw_reel 0
scoreboard players set @s kandy.cd.greed 200
scoreboard players set @s kandy.cdmax.greed 200
execute if entity @s[tag=kandy.cw_snap] run scoreboard players set @s kandy.cd.greed 400
execute if entity @s[tag=kandy.cw_snap] run scoreboard players set @s kandy.cdmax.greed 400
tag @s remove kandy.cw_snap
attribute @s minecraft:movement_speed modifier remove kandy:chainwarden_drag
execute at @s run playsound minecraft:block.chain.break player @a[distance=..16] ~ ~ ~ 1 0.8
