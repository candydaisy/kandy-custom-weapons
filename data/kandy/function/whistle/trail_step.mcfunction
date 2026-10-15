particle minecraft:dust{color:[0.86,0.08,0.24],scale:1.3} ~ ~ ~ 0.05 0.02 0.05 0 2 force @a[tag=whis.viewer]
scoreboard players remove #steps whis_tmp 1
execute if score #steps whis_tmp matches ..0 run return 0
execute if entity @a[tag=whis.prey,distance=..1.5] run return 0
execute positioned ^ ^ ^1.5 run function kandy:whistle/trail_step
