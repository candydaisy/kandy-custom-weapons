scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.pride.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.pride.wi] if score @s kandy.cd.pride matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_dg_leap visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/dg_leap with storage kandy:hud
