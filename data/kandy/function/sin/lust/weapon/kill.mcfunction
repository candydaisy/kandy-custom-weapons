# Advancement reward: the player killed something. Kills while bleeding deepen a tier 2 blade (tier 3 after 15)
advancement revoke @s only kandy:sin/lust/kill
execute unless entity @s[tag=kandy.lust_bleed] run return 0
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/deed {sin:"lust",need:15,what:"kills while bleeding",name:"Lust",color:"#ff4fa3"}
