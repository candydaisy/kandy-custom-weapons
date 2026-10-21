effect give @e[tag=kandy.cw_mine,type=!#kandy:heavy] minecraft:slowness 1 1
# Compound Interest (Plunderer's Coin carried): a reeled player pays one more level
tag @s add kandy.cw_thief
execute if entity @s[tag=kandy.greed.set] as @e[tag=kandy.cw_mine,type=player] run function kandy:sin/greed/weapon/pilfer
tag @s remove kandy.cw_thief
# The sin deepens (arbalest in main hand): tier 2 after 15 Reels
execute if entity @s[tag=kandy.greed.w] run function kandy:sin/tier
execute if entity @s[tag=kandy.greed.w] if score @s kandy.wt matches 1 run function kandy:sin/deed {sin:"greed",need:15,what:"Reels",name:"Greed",color:"#ffcc00"}
function kandy:sin/greed/weapon/release
