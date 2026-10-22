# Advancement reward: a music disc went into a jukebox. "11", at night, in the snow, alone, carrying a Sloth charm:
# Sloth remembers its sister, and the Melancholy recipes unlock
advancement revoke @s only kandy:sin/unlock/melancholy
execute unless entity @s[tag=kandy.sloth.c] run return 0
execute unless predicate kandy:moonlit_pendant_night run return 0
execute at @s unless biome ~ ~ ~ #kandy:snowy run return 0
execute at @s if entity @a[distance=0.01..32] run return 0
execute if entity @s[tag=kandy.melancholy_known] run return 0
tag @s add kandy.melancholy_known
recipe give @s kandy:frostveil_core
recipe give @s kandy:frostveil
recipe give @s kandy:moonlit_pendant_core
recipe give @s kandy:moonlit_pendant
tellraw @s [{text:"Before there were seven there were eight. ",color:"#afc4e8",italic:true},{text:"Sloth remembers its sister: ",color:"#afc4e8",italic:true},{text:"Melancholy",color:"#3d5a99",bold:true,italic:false}]
playsound minecraft:ambient.cave player @s ~ ~ ~ 1 0.6
playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 1 0.5
particle minecraft:snowflake ~ ~1 ~ 1 1 1 0.02 60
