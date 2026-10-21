# Advancement reward: the player killed a Tethered creature (the advancement checks the corpse; dead creatures can't be selected)
# Deepens a tier 2 arbalest in the main hand (tier 3 after 25)
advancement revoke @s only kandy:sin/greed/kill
execute unless entity @s[tag=kandy.greed.w] run return 0
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/deed {sin:"greed",need:25,what:"Tethered kills",name:"Greed",color:"#ffcc00"}
