# Run as the lander: one deed per Dive kill (#kills dg_tmp), stopping if the spear reaches tier 3 partway
execute if score #kills dg_tmp matches ..0 run return 0
function kandy:sin/deed {sin:"pride",need:10,what:"Dive kills",name:"Pride",color:"#9b59ff"}
scoreboard players remove #kills dg_tmp 1
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/pride/weapon/kill_deeds
