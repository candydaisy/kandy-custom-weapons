scoreboard players set #n hud_v 0
scoreboard players set #me soul_pid -1
scoreboard players operation #me soul_pid = @s soul_pid
execute as @e[scores={echo_stacks=1..}] if score @s echo_owner = #me soul_pid run scoreboard players add #n hud_v 1
scoreboard players set #bar hud_v 0
scoreboard players operation #bar hud_v = #n hud_v
execute if score #bar hud_v matches 6.. run scoreboard players set #bar hud_v 5
$bossbar set kandy:hud_$(id) color purple
$bossbar set kandy:hud_$(id) max 5
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get #bar hud_v
$execute if score #n hud_v matches 0 run bossbar set kandy:hud_$(id) name [{"text":"Lingering Souls","color":"#d724ff"},{"text":" - No echoes","color":"white"}]
$execute if score #n hud_v matches 1.. run bossbar set kandy:hud_$(id) name [{"text":"Lingering Souls","color":"#d724ff"},{"text":" - Echoes on ","color":"white"},{"score":{"name":"#n","objective":"hud_v"},"color":"white"},{"text":" targets","color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
