# Run as and at the embracer, next to kandy.lust_target
damage @n[tag=kandy.lust_target] 4 minecraft:player_attack by @s
execute if score @s kandy.wt matches 3 run effect give @e[tag=kandy.lust_target] minecraft:weakness 3 0
execute at @e[tag=kandy.lust_target] run particle minecraft:heart ~ ~1.5 ~ 0.3 0.3 0.3 0 4
playsound minecraft:entity.player.attack.strong player @a[distance=..16] ~ ~ ~ 1 0.8
# The sin deepens (blade in hand): tier 2 after 10 Embraces that land
execute if entity @s[tag=kandy.lust.w] if score @s kandy.wt matches 1 run function kandy:sin/deed {sin:"lust",need:10,what:"Embraces",name:"Lust",color:"#ff4fa3"}
