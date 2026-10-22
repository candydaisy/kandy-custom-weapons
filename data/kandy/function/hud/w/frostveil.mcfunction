scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.melancholy.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.melancholy.wi] if score @s kandy.cd.melancholy matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_frost_nova visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/frost_nova with storage kandy:hud
