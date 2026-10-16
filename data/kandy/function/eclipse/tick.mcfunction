scoreboard players add @a ecl_cd 0
scoreboard players add @a ecl_warp 0
execute as @a[scores={ecl_cd=1},tag=kandy.inv.eclipse] at @s run playsound minecraft:block.respawn_anchor.charge player @s ~ ~ ~ 0.5 1.6
scoreboard players remove @a[scores={ecl_cd=1..}] ecl_cd 1
scoreboard players remove @a[scores={ecl_warp=1..}] ecl_warp 1

# Every player gets a stable id so a vortex remembers who fired it
execute as @a unless score @s ecl_pid matches 1.. run function kandy:eclipse/assign_pid

# New arrows: pick out the ones fired from an Eclipse Longbow
execute as @e[type=#minecraft:arrows,tag=!ecl.checked] run function kandy:eclipse/check_arrow

# Void trail while flying; landed arrows stay warp targets for 3s, then drop out
execute as @e[type=#minecraft:arrows,tag=ecl.arrow,nbt={inGround:1b}] if data entity @s {life:60s} run tag @s remove ecl.arrow
execute as @e[type=#minecraft:arrows,tag=ecl.arrow,nbt={inGround:0b}] at @s run particle minecraft:portal ~ ~ ~ 0.05 0.05 0.05 0.2 3
execute as @e[type=#minecraft:arrows,tag=ecl.arrow,nbt={inGround:0b}] at @s run particle minecraft:witch ~ ~ ~ 0 0 0 0 1
execute as @e[type=#minecraft:arrows,tag=ecl.singular] at @s run particle minecraft:reverse_portal ~ ~ ~ 0.1 0.1 0.1 0.02 6

execute as @e[type=marker,tag=ecl.tracker] at @s run function kandy:eclipse/track
execute as @e[type=marker,tag=ecl.vortex] at @s run function kandy:eclipse/vortex

execute as @a[tag=kandy.inv.eclipse] run function kandy:eclipse/warp_input
execute as @a[tag=kandy.inv.eclipse] at @s run function kandy:eclipse/status

tag @e[tag=ecl.recent] remove ecl.recent
