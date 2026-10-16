# Run as a Singularity tracker marker: follow its arrow, open the vortex when the arrow lands or is gone
tag @e[type=#minecraft:arrows,tag=ecl.match] remove ecl.match
scoreboard players operation #id ecl_tmp = @s ecl_id
execute as @e[type=#minecraft:arrows,tag=ecl.singular] if score @s ecl_id = #id ecl_tmp run tag @s add ecl.match
scoreboard players remove @s ecl_life 1

# Arrow hit an entity (and was removed), or it flew too long
execute unless entity @e[type=#minecraft:arrows,tag=ecl.match] run return run function kandy:eclipse/lost_arrow
execute if score @s ecl_life matches ..0 run kill @e[type=#minecraft:arrows,tag=ecl.match]
execute if score @s ecl_life matches ..0 run return run function kandy:eclipse/collapse

tp @s @e[type=#minecraft:arrows,tag=ecl.match,limit=1]
execute as @e[type=#minecraft:arrows,tag=ecl.match,nbt={inGround:1b}] run tag @s add ecl.landed
execute unless entity @e[type=#minecraft:arrows,tag=ecl.landed] run return run tag @e[type=#minecraft:arrows,tag=ecl.match] remove ecl.match
kill @e[type=#minecraft:arrows,tag=ecl.landed]
execute at @s run function kandy:eclipse/collapse
