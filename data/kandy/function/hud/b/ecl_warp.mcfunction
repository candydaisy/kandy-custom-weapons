$bossbar add kandy:hud_$(id)_ecl_warp ""
scoreboard players add @s ecl_warp 0
scoreboard players operation #s hud_v = @s ecl_warp
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 200
scoreboard players operation #bar hud_v -= @s ecl_warp
scoreboard players add @s ecl_n 0
$bossbar set kandy:hud_$(id)_ecl_warp color pink
$bossbar set kandy:hud_$(id)_ecl_warp max 200
$execute store result bossbar kandy:hud_$(id)_ecl_warp value run scoreboard players get #bar hud_v
$execute if score @s ecl_warp matches 1.. run bossbar set kandy:hud_$(id)_ecl_warp name [{"text":"Eclipse Longbow","color":"#a855f7"},{"text":" - Shadow Warp ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$execute if score @s ecl_warp matches 0 if score @s ecl_n matches 0 run bossbar set kandy:hud_$(id)_ecl_warp name [{"text":"Eclipse Longbow","color":"#a855f7"},{"text":" - Shadow Warp: no arrow","color":"gray"}]
$execute if score @s ecl_warp matches 0 if score @s ecl_n matches 1.. run bossbar set kandy:hud_$(id)_ecl_warp name [{"text":"Eclipse Longbow","color":"#a855f7"},{"text":" - Shadow Warp ready (","color":"white"},{"score":{"name":"@s","objective":"ecl_n"},"color":"white"},{"text":" in range)","color":"white"}]
$bossbar set kandy:hud_$(id)_ecl_warp players @s
$bossbar set kandy:hud_$(id)_ecl_warp visible true
