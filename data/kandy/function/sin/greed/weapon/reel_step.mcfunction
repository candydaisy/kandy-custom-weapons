# Run as and at the tetherer, with their target tagged kandy.cw_mine
scoreboard players remove @s cw_reel 1
tag @s add kandy.cw_reeler
# Heavy targets don't move: you're pulled to them instead
execute if entity @e[tag=kandy.cw_mine,type=#kandy:heavy] run function kandy:sin/greed/weapon/reel_self
execute unless entity @e[tag=kandy.cw_mine,type=#kandy:heavy] as @e[tag=kandy.cw_mine] run function kandy:sin/greed/weapon/reel_mob
tag @s remove kandy.cw_reeler
execute at @s if entity @e[tag=kandy.cw_mine,distance=..2.5] run return run function kandy:sin/greed/weapon/reel_done
execute if score @s cw_reel matches 0 run function kandy:sin/greed/weapon/reel_done
