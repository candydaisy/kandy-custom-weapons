# Advancement reward: a Recurve arrow hit something. Covet: a hit on your locked target takes what it has
advancement revoke @s only kandy:sin/envy/hit
execute unless score @s fl_lt matches 1.. run return 0
tag @s add kandy.attacker
scoreboard players operation #t fl_tmp = @s fl_lock
execute as @e[distance=..64,tag=kandy.fl_marked,nbt={HurtTime:10s}] if score @s fl_eid = #t fl_tmp if function kandy:util/hurt_by_attacker run tag @s add kandy.envy_prey
tag @s remove kandy.attacker
execute unless entity @e[tag=kandy.envy_prey] run return 0
function kandy:sin/tier

# Players give up one buff (two with Spite) for 5s (8s from tier 2). From tier 3 mobs too, and they lose 1 HP to you
scoreboard players set #max envy_tmp 1
execute if entity @s[tag=kandy.envy.set] run scoreboard players set #max envy_tmp 2
data modify storage kandy:envy fx.t set value 5
execute if score @s kandy.wt matches 2.. run data modify storage kandy:envy fx.t set value 8
tag @s add kandy.envy_thief
execute if score @s kandy.wt matches ..2 as @e[tag=kandy.envy_prey,type=minecraft:player] at @s run function kandy:sin/envy/weapon/covet
execute if score @s kandy.wt matches 3 as @e[tag=kandy.envy_prey] at @s run function kandy:sin/envy/weapon/covet
execute if score @s kandy.wt matches 3 as @e[tag=kandy.envy_prey,type=!minecraft:player] run function kandy:sin/envy/weapon/drain
tag @s remove kandy.envy_thief
tag @e[tag=kandy.envy_prey] remove kandy.envy_prey

# Hits on your lock deepen a tier 1 bow in the main hand (tier 2 after 20)
execute if entity @s[tag=kandy.envy.w] if score @s kandy.wt matches 1 run function kandy:sin/deed {sin:"envy",need:20,what:"hits on your lock",name:"Envy",color:"#4caf50"}
