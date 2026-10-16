scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.zephyr] if score @s zeph_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_zeph_shock visible false
$execute if score #vis hud_v matches 1 run function kandy:hud/b/zeph_shock with storage kandy:hud
