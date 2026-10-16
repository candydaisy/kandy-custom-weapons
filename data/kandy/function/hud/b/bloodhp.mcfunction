$bossbar add kandy:hud_$(id)_bloodhp ""
scoreboard players add @s hp 0
$bossbar set kandy:hud_$(id)_bloodhp color red
$bossbar set kandy:hud_$(id)_bloodhp max 20
$execute store result bossbar kandy:hud_$(id)_bloodhp value run scoreboard players get @s hp
$execute if score @s hp matches 9.. run bossbar set kandy:hud_$(id)_bloodhp name [{"text":"Blood Pact","color":"#c00000"},{"text":" - HP ","color":"white"},{"score":{"name":"@s","objective":"hp"},"color":"white"}]
$execute if score @s hp matches 5..8 run bossbar set kandy:hud_$(id)_bloodhp name [{"text":"Blood Pact","color":"#c00000"},{"text":" - HP ","color":"white"},{"score":{"name":"@s","objective":"hp"},"color":"white"},{"text":" | Strength","color":"gold"}]
$execute if score @s hp matches ..4 run bossbar set kandy:hud_$(id)_bloodhp name [{"text":"Blood Pact","color":"#c00000"},{"text":" - HP ","color":"white"},{"score":{"name":"@s","objective":"hp"},"color":"white"},{"text":" | Strength","color":"gold"},{"text":" | Bleeding","color":"red"}]
$bossbar set kandy:hud_$(id)_bloodhp players @s
$bossbar set kandy:hud_$(id)_bloodhp visible true
