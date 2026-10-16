scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.tempest] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.tempest] if score @s tem_dcd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_tem_surge visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/tem_surge with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.tempest] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.tempest] if score @s tem_scd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_tem_wrath visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/tem_wrath with storage kandy:hud
