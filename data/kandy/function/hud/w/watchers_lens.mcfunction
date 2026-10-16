scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.watchers_lens] if score @s wat_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_wat_mark visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/wat_mark with storage kandy:hud
