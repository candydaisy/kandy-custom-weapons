$bossbar add kandy:hud_$(id)_mer_haggle ""
scoreboard players operation #s hud_v = @s mer_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 100
scoreboard players operation #bar hud_v -= @s mer_cd
$bossbar set kandy:hud_$(id)_mer_haggle color green
$bossbar set kandy:hud_$(id)_mer_haggle max 100
$execute store result bossbar kandy:hud_$(id)_mer_haggle value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_mer_haggle name [{"text":"Merchant's Sigil","color":"#2ecc71"},{"text":" - Haggle ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_mer_haggle players @s
$bossbar set kandy:hud_$(id)_mer_haggle visible true
