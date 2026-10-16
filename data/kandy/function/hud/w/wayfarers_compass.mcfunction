scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.wayfarers_compass] if score @s way_chg matches 1.. run scoreboard players set #vis hud_v 1
execute if score @s way_wait matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_way_charge visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/way_charge with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.wayfarers_compass] if score @s way_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_way_cd visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/way_cd with storage kandy:hud
