# Advancement reward: the player killed something. Kills made while Flawless deepen a tier 2 stiletto (tier 3 after 25)
advancement revoke @s only kandy:sin/vanity/kill
execute unless entity @s[tag=kandy.vanity.w,tag=kandy.vain_on] run return 0
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/deed {sin:"vanity",need:25,what:"Flawless kills",name:"Vanity",color:"#f2c6de"}
