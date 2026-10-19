scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.hold.warhorn] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.warhorn] if score @s wh_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_wh_horn visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/wh_horn with storage kandy:hud
