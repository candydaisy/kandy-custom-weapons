$bossbar add kandy:hud_$(id)_tnk_sharp ""
scoreboard players add @s tnk_act 0
scoreboard players add @s tnk_cd 0
scoreboard players operation #s hud_v = @s tnk_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #a hud_v = @s tnk_act
scoreboard players add #a hud_v 19
scoreboard players operation #a hud_v /= #20 hud_v
scoreboard players set #bar hud_v 1200
scoreboard players operation #bar hud_v -= @s tnk_cd
execute if score @s tnk_act matches 1.. run scoreboard players operation #bar hud_v = @s tnk_act
execute if score @s tnk_act matches 1.. run scoreboard players operation #bar hud_v *= #3 hud_v
$bossbar set kandy:hud_$(id)_tnk_sharp color red
$bossbar set kandy:hud_$(id)_tnk_sharp max 1200
$execute store result bossbar kandy:hud_$(id)_tnk_sharp value run scoreboard players get #bar hud_v
$execute if score @s tnk_act matches 1.. run bossbar set kandy:hud_$(id)_tnk_sharp name [{"text":"Tinker's Whetstone","color":"#e76f51"},{"text":" - Sharpened ","color":"white"},{"score":{"name":"#a","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$execute unless score @s tnk_act matches 1.. run bossbar set kandy:hud_$(id)_tnk_sharp name [{"text":"Tinker's Whetstone","color":"#e76f51"},{"text":" - Sharpen ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_tnk_sharp players @s
$bossbar set kandy:hud_$(id)_tnk_sharp visible true
