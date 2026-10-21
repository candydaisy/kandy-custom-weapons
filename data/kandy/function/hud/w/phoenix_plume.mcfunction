scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.pride.c] if score @s kandy.ccd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_phx_rebirth visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/phx_rebirth with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if score @s phx_ash matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_phx_ash visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/phx_ash with storage kandy:hud
