scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.frostveil] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.frostveil] if score @s frost_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_frost_nova visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/frost_nova with storage kandy:hud
