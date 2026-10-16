scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.stormcaller_coil] if score @s stc_static matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_stc_static visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/stc_static with storage kandy:hud
