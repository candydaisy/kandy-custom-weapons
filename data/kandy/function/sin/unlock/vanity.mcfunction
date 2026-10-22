# Advancement reward: the player killed a hostile mob. Carrying a Pride charm, 10 in a row without being hurt
# (sin/vanity/weapon/hurt resets the streak): Pride sees its own reflection, and the Vanity recipes unlock
advancement revoke @s only kandy:sin/unlock/vanity
execute unless entity @s[tag=kandy.pride.c] run return 0
execute if entity @s[tag=kandy.vanity_known] run return 0
scoreboard players add @s kandy.vain 1
execute if score @s kandy.vain matches 5..9 run title @s actionbar [{text:"Untouched: ",color:"#f2c6de"},{score:{name:"@s",objective:"kandy.vain"},color:"white"},{text:"/10",color:"white"}]
execute unless score @s kandy.vain matches 10.. run return 0
tag @s add kandy.vanity_known
recipe give @s kandy:chronos_core
recipe give @s kandy:chronos
recipe give @s kandy:prism_mirror_core
recipe give @s kandy:prism_mirror
tellraw @s [{text:"Pride wanted to be greater than everyone. Vanity only wanted everyone to see it. ",color:"#f2c6de",italic:true},{text:"Vanity",color:"#c0c0d8",bold:true,italic:false}]
playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 1 1.4
playsound minecraft:block.glass.break player @s ~ ~ ~ 0.6 1.6
particle minecraft:end_rod ~ ~1 ~ 0.6 0.8 0.6 0.05 40
