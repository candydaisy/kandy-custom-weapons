scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.sloth.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.sloth.w] run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bulw_pressure visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bulw_pressure with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.sloth.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.sloth.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.sloth.wi] if score @s kandy.cd.sloth matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bulw_surge visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bulw_surge with storage kandy:hud
