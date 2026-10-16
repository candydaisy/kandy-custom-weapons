$bossbar add kandy:hud_$(id)_zeph_shock ""
scoreboard players operation #s hud_v = @s zeph_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 60
scoreboard players operation #bar hud_v -= @s zeph_cd
$bossbar set kandy:hud_$(id)_zeph_shock color white
$bossbar set kandy:hud_$(id)_zeph_shock max 60
$execute store result bossbar kandy:hud_$(id)_zeph_shock value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_zeph_shock name [{"text":"Zephyr Charm","color":"#26c6da"},{"text":" - Shockwave ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_zeph_shock players @s
$bossbar set kandy:hud_$(id)_zeph_shock visible true
