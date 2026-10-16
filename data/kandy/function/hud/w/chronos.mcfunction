scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.chronos] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.chronos] if score @s chr_anc matches 1.. run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.chronos] if score @s chr_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_chr_rewind visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/chr_rewind with storage kandy:hud
