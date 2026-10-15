execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=..49}] run title @s actionbar [{"text":"✦ Smoldering ✦ ","color":"gold","bold":true},{"text":"HEAT ","color":"gold"},{"score":{"name":"@s","objective":"pyro_heat"},"color":"red"},{"text":"%","color":"dark_red"},{"text":" — Feed the flame","color":"gold","italic":true}]
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=50..}] run title @s actionbar [{"text":"✦ Searing ✦ ","color":"red","bold":true},{"text":"HEAT ","color":"gold"},{"score":{"name":"@s","objective":"pyro_heat"},"color":"red"},{"text":"%","color":"dark_red"},{"text":" — The blade glows red","color":"red","italic":true}]
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=1..}] run title @s actionbar [{"text":"✦ OVERDRIVE ✦ ","color":"white","bold":true},{"text":"— The blade runs molten","color":"yellow","italic":true}]

execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=1..49}] at @s run particle minecraft:small_flame ~ ~1 ~ 0.3 0.4 0.3 0.01 1
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=50..}] at @s run particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0.02 2
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=50..}] at @s run particle minecraft:large_smoke ~ ~1.2 ~ 0.3 0.4 0.3 0.01 1
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=50..}] at @s run particle minecraft:lava ~ ~1 ~ 0.3 0.4 0.3 0 1
execute as @a[scores={pyro_od=1..}] at @s run particle minecraft:end_rod ~ ~1 ~ 0.4 0.6 0.4 0.02 2
execute as @a[scores={pyro_od=1..}] at @s run particle minecraft:flame ~ ~1 ~ 0.4 0.6 0.4 0.03 4
execute as @a[scores={pyro_od=1..}] at @s run particle minecraft:white_ash ~ ~1 ~ 0.6 0.8 0.6 0 6

execute as @e[scores={pyro_melt=1..}] at @s run particle minecraft:dripping_lava ~ ~1 ~ 0.3 0.4 0.3 0 1
