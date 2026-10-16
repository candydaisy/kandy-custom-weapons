$bossbar add kandy:hud_$(id)_ecl_sing ""
scoreboard players add @s ecl_cd 0
scoreboard players operation #s hud_v = @s ecl_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 240
scoreboard players operation #bar hud_v -= @s ecl_cd
$bossbar set kandy:hud_$(id)_ecl_sing color purple
$bossbar set kandy:hud_$(id)_ecl_sing max 240
$execute store result bossbar kandy:hud_$(id)_ecl_sing value run scoreboard players get #bar hud_v
$execute if score @s ecl_cd matches 0 run bossbar set kandy:hud_$(id)_ecl_sing name [{"text":"Eclipse Longbow","color":"#a855f7"},{"text":" - Singularity ready","color":"white"}]
$execute if score @s ecl_cd matches 1.. run bossbar set kandy:hud_$(id)_ecl_sing name [{"text":"Eclipse Longbow","color":"#a855f7"},{"text":" - Singularity ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_ecl_sing players @s
$bossbar set kandy:hud_$(id)_ecl_sing visible true
