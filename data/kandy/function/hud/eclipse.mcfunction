scoreboard players add @s ecl_cd 0
scoreboard players add @s ecl_warp 0
scoreboard players add @s ecl_n 0
scoreboard players operation #s hud_v = @s ecl_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #w hud_v = @s ecl_warp
scoreboard players add #w hud_v 19
scoreboard players operation #w hud_v /= #20 hud_v
scoreboard players set #bar hud_v 240
scoreboard players operation #bar hud_v -= @s ecl_cd
$bossbar set kandy:hud_$(id) color purple
$bossbar set kandy:hud_$(id) max 240
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get #bar hud_v
execute if score @s ecl_cd matches 0 run function kandy:hud/eclipse_ready with storage kandy:hud
execute if score @s ecl_cd matches 1.. run function kandy:hud/eclipse_charging with storage kandy:hud
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
