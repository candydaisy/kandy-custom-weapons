scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.beastmasters_whistle] if score @s bst_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bst_recall visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bst_recall with storage kandy:hud
