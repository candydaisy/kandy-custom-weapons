# Mark this spot and health for 6s (8s from tier 2), and whether you were at full health (Unblemished)
function kandy:sin/tier
execute unless score @s chr_id matches 1.. run function kandy:sin/vanity/weapon/assign_id
function kandy:sin/vanity/weapon/clear_anchor
summon minecraft:marker ~ ~ ~ {Tags:["kandy.chr_anchor","kandy.chr_new"]}
scoreboard players operation @e[type=minecraft:marker,tag=kandy.chr_new] chr_id = @s chr_id
# The marker cleans itself up even if its owner logs off
scoreboard players set @e[type=minecraft:marker,tag=kandy.chr_new] chr_anc 130
execute if score @s kandy.wt matches 2.. run scoreboard players set @e[type=minecraft:marker,tag=kandy.chr_new] chr_anc 170
tag @e[type=minecraft:marker,tag=kandy.chr_new] remove kandy.chr_new
scoreboard players operation @s chr_ahp = @s chr_hp
scoreboard players set @s chr_anc 120
execute if score @s kandy.wt matches 2.. run scoreboard players set @s chr_anc 160
scoreboard players operation @s chr_amax = @s chr_anc
scoreboard players set @s chr_afull 0
execute if entity @s[tag=kandy.vain_full] run scoreboard players set @s chr_afull 1
particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.2} ~ ~1 ~ 0.3 0.6 0.3 0 20
playsound minecraft:block.amethyst_block.resonate player @a[distance=..12] ~ ~ ~ 1 1.4
