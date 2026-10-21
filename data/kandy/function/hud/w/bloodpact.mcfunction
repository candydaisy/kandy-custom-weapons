scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.lust.w] run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bloodhp visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bloodhp with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.lust.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.lust.wi] if score @s kandy.cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_lust_embrace visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/lust_embrace with storage kandy:hud
