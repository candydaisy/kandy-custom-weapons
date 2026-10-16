scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.abyssal] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.off.abyssal] run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bulw_pressure visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bulw_pressure with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.abyssal] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.off.abyssal] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.abyssal] if score @s bulw_scd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bulw_surge visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bulw_surge with storage kandy:hud
