scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.deepdelver_lamp] if score @s dlv_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_dlv_ping visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/dlv_ping with storage kandy:hud
