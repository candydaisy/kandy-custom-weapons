# Run as and at a grappling player: zip toward the bolt, 2 blocks a tick
scoreboard players operation #id cw_tmp = @s ecl_pid
execute as @e[tag=kandy.cw_anchor] if score @s cw_by = #id cw_tmp run tag @s add kandy.cw_mine
execute unless entity @e[tag=kandy.cw_mine,distance=..32] run return run function kandy:chainwarden/grapple_end
scoreboard players set #steps cw_tmp 4
function kandy:chainwarden/pull_self
scoreboard players remove @s cw_grp 1
execute if score @s cw_grp matches 0 run function kandy:chainwarden/grapple_end
execute if score #steps cw_tmp matches -1 run function kandy:chainwarden/grapple_end
tag @e[tag=kandy.cw_mine] remove kandy.cw_mine
