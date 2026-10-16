scoreboard players add @s chr_anc 0
scoreboard players add @s chr_cd 0
scoreboard players operation #a hud_v = @s chr_anc
scoreboard players add #a hud_v 19
scoreboard players operation #a hud_v /= #20 hud_v
scoreboard players operation #s hud_v = @s chr_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
execute if score @s chr_anc matches 1.. run return run function kandy:hud/chronos_anchor with storage kandy:hud
scoreboard players set #bar hud_v 400
scoreboard players operation #bar hud_v -= @s chr_cd
$bossbar set kandy:hud_$(id) color yellow
$bossbar set kandy:hud_$(id) max 400
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get #bar hud_v
$execute if score @s chr_cd matches 0 run bossbar set kandy:hud_$(id) name [{"text":"Chronos Stiletto","color":"#fdcb6e"},{"text":" - Right-click to anchor","color":"white"}]
$execute if score @s chr_cd matches 1.. run bossbar set kandy:hud_$(id) name [{"text":"Chronos Stiletto","color":"#fdcb6e"},{"text":" - Rewind ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
