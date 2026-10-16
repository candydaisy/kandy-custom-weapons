scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.worldbreaker] run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_gravity visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/gravity with storage kandy:hud
