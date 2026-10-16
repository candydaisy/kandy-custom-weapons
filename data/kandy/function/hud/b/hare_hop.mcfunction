$bossbar add kandy:hud_$(id)_hare_hop ""
scoreboard players operation #s hud_v = @s hare_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 80
scoreboard players operation #bar hud_v -= @s hare_cd
$bossbar set kandy:hud_$(id)_hare_hop color green
$bossbar set kandy:hud_$(id)_hare_hop max 80
$execute store result bossbar kandy:hud_$(id)_hare_hop value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_hare_hop name [{"text":"Hare's Foot","color":"#a7c957"},{"text":" - Hop Burst ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_hare_hop players @s
$bossbar set kandy:hud_$(id)_hare_hop visible true
