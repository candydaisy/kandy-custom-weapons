scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.void_talisman] if score @s void_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_void_rescue visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/void_rescue with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.void_talisman] if score @s void_cloak_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_void_cloak visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/void_cloak with storage kandy:hud
