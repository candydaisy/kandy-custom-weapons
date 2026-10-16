scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.pyroclast] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.pyroclast] if score @s pyro_od matches 1.. run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.pyroclast] if score @s pyro_oh matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_pyro_heat visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/pyro_heat with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.pyroclast] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.pyroclast] if score @s pyro_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_pyro_fissure visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/pyro_fissure with storage kandy:hud
