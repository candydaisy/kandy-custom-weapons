# Run as a creature near a carrier: give it an invisible rider (mounts aren't marked, so riders never take a saddle)
tag @s add kandy.plc_marked
execute unless data entity @s Health run return 0
summon minecraft:item_display ~ ~ ~ {Tags:["kandy.plc_eye","kandy.plc_new"]}
ride @n[type=minecraft:item_display,tag=kandy.plc_new] mount @s
tag @e[type=minecraft:item_display,tag=kandy.plc_new] remove kandy.plc_new
