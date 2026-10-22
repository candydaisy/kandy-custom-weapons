$bossbar add kandy:hud_$(id)_chr_rewind ""
scoreboard players add @s chr_anc 0
scoreboard players operation #a hud_v = @s chr_anc
scoreboard players add #a hud_v 19
scoreboard players operation #a hud_v /= #20 hud_v
scoreboard players operation #s hud_v = @s kandy.cd.vanity
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
# The bar fills as the cooldown runs out, or drains with the anchor (scaled to 400 either way)
scoreboard players operation #m hud_v = @s kandy.cdmax.vanity
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 400
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.cd.vanity
scoreboard players set #k hud_v 400
scoreboard players operation #bar hud_v *= #k hud_v
scoreboard players operation #bar hud_v /= #m hud_v
execute if score @s chr_anc matches 1.. run scoreboard players operation #bar hud_v = @s chr_anc
execute if score @s chr_anc matches 1.. run scoreboard players operation #bar hud_v *= #k hud_v
execute if score @s chr_anc matches 1.. unless score @s chr_amax matches 1.. run scoreboard players set @s chr_amax 120
execute if score @s chr_anc matches 1.. run scoreboard players operation #bar hud_v /= @s chr_amax
$bossbar set kandy:hud_$(id)_chr_rewind color yellow
$bossbar set kandy:hud_$(id)_chr_rewind max 400
$execute store result bossbar kandy:hud_$(id)_chr_rewind value run scoreboard players get #bar hud_v
$execute if score @s chr_anc matches 1.. run bossbar set kandy:hud_$(id)_chr_rewind name [{"text":"Chronos Stiletto","color":"#fdcb6e"},{"text":" - Anchored ","color":"white"},{"score":{"name":"#a","objective":"hud_v"},"color":"white"},{"text":"s | Sneak + right-click to rewind","color":"white"}]
$execute if score @s chr_anc matches 0 if score @s kandy.cd.vanity matches 0 run bossbar set kandy:hud_$(id)_chr_rewind name [{"text":"Chronos Stiletto","color":"#fdcb6e"},{"text":" - Right-click to anchor","color":"white"}]
$execute if score @s chr_anc matches 0 if score @s kandy.cd.vanity matches 1.. run bossbar set kandy:hud_$(id)_chr_rewind name [{"text":"Chronos Stiletto","color":"#fdcb6e"},{"text":" - Rewind ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_chr_rewind players @s
$bossbar set kandy:hud_$(id)_chr_rewind visible true
