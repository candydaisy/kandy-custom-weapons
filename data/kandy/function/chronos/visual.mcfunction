execute as @a[tag=kandy.main.chronos,scores={chr_anc=1..}] run title @s actionbar [{"text":"✦ Anchored ✦ ","color":"gold","bold":true},{"text":"— Sneak + right-click to rewind","color":"yellow","italic":true}]
execute as @a[tag=kandy.main.chronos,scores={chr_cd=1..}] unless score @s chr_anc matches 1.. run title @s actionbar [{"text":"✦ Timeline Mending ✦ ","color":"dark_aqua","bold":true},{"text":"— Rewind recharging","color":"gray","italic":true}]
execute as @a[tag=kandy.main.chronos] unless score @s chr_anc matches 1.. unless score @s chr_cd matches 1.. run title @s actionbar [{"text":"✦ Chronos ✦ ","color":"aqua","bold":true},{"text":"— Right-click to set an anchor","color":"gray","italic":true}]

# Ghost of the anchor, and a golden mark over wounds waiting to reopen
execute as @e[type=minecraft:marker,tag=kandy.chr_anchor] at @s run particle minecraft:end_rod ~ ~1 ~ 0.15 0.5 0.15 0 1
execute as @e[type=minecraft:marker,tag=kandy.chr_anchor] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:0.8} ~ ~0.1 ~ 0.3 0 0.3 0 2
execute as @e[scores={chr_ps=1..}] at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:0.7} ~ ~2.3 ~ 0.1 0.05 0.1 0 1
execute as @e[tag=kandy.chr_frozen] at @s run particle minecraft:dust{color:[0.45,0.73,1.0],scale:1.0} ~ ~1 ~ 0.3 0.5 0.3 0 2
