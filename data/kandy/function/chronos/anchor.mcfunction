# Mark this spot and health for 6s
execute unless score @s chr_id matches 1.. run function kandy:chronos/assign_id
function kandy:chronos/clear_anchor
summon minecraft:marker ~ ~ ~ {Tags:["kandy.chr_anchor","kandy.chr_new"]}
scoreboard players operation @e[type=minecraft:marker,tag=kandy.chr_new] chr_id = @s chr_id
# The marker cleans itself up even if its owner logs off
scoreboard players set @e[type=minecraft:marker,tag=kandy.chr_new] chr_anc 130
tag @e[type=minecraft:marker,tag=kandy.chr_new] remove kandy.chr_new
scoreboard players operation @s chr_ahp = @s chr_hp
scoreboard players set @s chr_anc 120
particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.2} ~ ~1 ~ 0.3 0.6 0.3 0 20
playsound minecraft:block.amethyst_block.resonate player @a[distance=..12] ~ ~ ~ 1 1.4
