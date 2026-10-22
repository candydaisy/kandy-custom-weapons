scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.vanity.c] if score @s prm_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_prm_facet visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/prm_facet with storage kandy:hud
