# Run as and at a player with a Tether up
scoreboard players operation #id cw_tmp = @s ecl_pid
execute as @e[tag=kandy.cw_tethered,distance=..24] if score @s cw_by = #id cw_tmp run tag @s add kandy.cw_mine
# Out of range, dead or in another dimension: the chain snaps
execute unless entity @e[tag=kandy.cw_mine] run return run function kandy:sin/greed/weapon/release
# Can't Let Go: putting the arbalest away snaps the chain and doubles the cooldown
scoreboard players set #held cw_tmp 0
execute if items entity @s weapon.* *[custom_data~{sin:"greed",type:"weapon"}] run scoreboard players set #held cw_tmp 1
execute if items entity @s weapon.* *[custom_data~{ability:"Chainwarden"}] run scoreboard players set #held cw_tmp 1
execute if score #held cw_tmp matches 0 run tag @s add kandy.cw_snap
execute if score #held cw_tmp matches 0 run return run function kandy:sin/greed/weapon/release

tag @s add kandy.cw_holder
execute as @e[tag=kandy.cw_mine] run function kandy:sin/greed/weapon/draw_to
tag @s remove kandy.cw_holder

execute if score @s cw_reel matches 1.. run function kandy:sin/greed/weapon/reel_step
# Last tick of the Tether (a finished reel has already released it)
execute if score @s cw_tt matches 1 run function kandy:sin/greed/weapon/release
scoreboard players remove @s[scores={cw_tt=1..}] cw_tt 1
tag @e[tag=kandy.cw_mine] remove kandy.cw_mine
