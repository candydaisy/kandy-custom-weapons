# Advancement reward: the player killed something. Kills on creatures they Tethered deepen a tier 2 arbalest (tier 3 after 25)
advancement revoke @s only kandy:sin/greed/kill
execute unless entity @s[tag=kandy.greed.w] run return 0
function kandy:sin/tier
execute unless score @s kandy.wt matches 2 run return 0
function kandy:util/tag_kills
scoreboard players operation #id cw_tmp = @s ecl_pid
tag @s add kandy.cw_killer
execute as @e[tag=kandy.killed,tag=kandy.cw_tethered] if score @s cw_by = #id cw_tmp as @p[tag=kandy.cw_killer] run function kandy:sin/deed {sin:"greed",need:25,what:"Tethered kills",name:"Greed",color:"#ffcc00"}
tag @s remove kandy.cw_killer
tag @e[tag=kandy.killed] remove kandy.killed
