scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.gluttony.w] run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_echoes visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/echoes with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.gluttony.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.gluttony.wi] if score @s kandy.cd.gluttony matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_soul_devour visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/soul_devour with storage kandy:hud
