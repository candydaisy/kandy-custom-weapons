# Advancement reward: the player killed a locked-on creature (the advancement checks the corpse; dead creatures can't be selected)
# Deepens a tier 2 bow in the main hand (tier 3 after 10)
# shortcut: the corpse only says someone was locked onto it, not who; fine unless two Envy players share a target
advancement revoke @s only kandy:sin/envy/kill
execute unless entity @s[tag=kandy.envy.w] run return 0
execute unless score @s fl_lt matches 1.. run return 0
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/deed {sin:"envy",need:10,what:"kills on your lock",name:"Envy",color:"#4caf50"}
