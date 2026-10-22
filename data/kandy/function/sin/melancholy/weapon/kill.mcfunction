# Advancement reward: the player killed something. Kills made alone (Solitude) deepen a tier 2 scythe (tier 3 after 15)
advancement revoke @s only kandy:sin/melancholy/kill
execute unless entity @s[tag=kandy.melancholy.w] run return 0
execute at @s if entity @a[distance=0.01..16,gamemode=!spectator] run return 0
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/deed {sin:"melancholy",need:15,what:"kills alone",name:"Melancholy",color:"#afc4e8"}
