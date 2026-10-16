scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.alchemist] if score @s alch_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_alch_cleanse visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/alch_cleanse with storage kandy:hud
