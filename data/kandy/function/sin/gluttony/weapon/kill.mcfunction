# Advancement reward: an echo or Devour killed something. Deepens a tier 2 dagger in the main hand (tier 3 after 25)
advancement revoke @s only kandy:sin/gluttony/kill
execute unless entity @s[tag=kandy.gluttony.w] run return 0
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/deed {sin:"gluttony",need:25,what:"echo kills",name:"Gluttony",color:"#ff8c1a"}
