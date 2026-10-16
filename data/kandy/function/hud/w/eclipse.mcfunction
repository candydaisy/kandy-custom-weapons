scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.eclipse] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.eclipse] if score @s ecl_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_ecl_sing visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/ecl_sing with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.eclipse] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.eclipse] if score @s ecl_warp matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_ecl_warp visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/ecl_warp with storage kandy:hud
