$bossbar add kandy:hud_$(id)_cw_tether ""
scoreboard players add @s cw_cd 0
scoreboard players operation #s hud_v = @s cw_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 200
scoreboard players operation #bar hud_v -= @s cw_cd
$bossbar set kandy:hud_$(id)_cw_tether color white
$bossbar set kandy:hud_$(id)_cw_tether max 200
$execute store result bossbar kandy:hud_$(id)_cw_tether value run scoreboard players get #bar hud_v
$execute if score @s cw_cd matches 0 run bossbar set kandy:hud_$(id)_cw_tether name [{"text":"Chainwarden Arbalest","color":"#8d6e63"},{"text":" - Tether ready","color":"white"}]
$execute if score @s cw_cd matches 1.. run bossbar set kandy:hud_$(id)_cw_tether name [{"text":"Chainwarden Arbalest","color":"#8d6e63"},{"text":" - Tether ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$execute if score @s cw_tt matches 1.. run bossbar set kandy:hud_$(id)_cw_tether name [{"text":"Chainwarden Arbalest","color":"#8d6e63"},{"text":" - Tethered: Sneak to Reel","color":"gold"}]
$bossbar set kandy:hud_$(id)_cw_tether players @s
$bossbar set kandy:hud_$(id)_cw_tether visible true
