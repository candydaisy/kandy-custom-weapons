# Active: Falcon Volley, 3 spectral arrows fan out above you and dive at the locked target
scoreboard players set @s kandy.cd.envy 280
scoreboard players set @s kandy.cdmax.envy 280
data modify storage kandy:falconer me set from entity @s UUID
summon minecraft:spectral_arrow ~-1 ~2.5 ~ {Tags:["kandy.fl_checked","kandy.fl_homing","kandy.fl_new"],Motion:[-0.3,0.7,0.0],damage:1.2d,pickup:0b}
summon minecraft:spectral_arrow ~ ~3 ~ {Tags:["kandy.fl_checked","kandy.fl_homing","kandy.fl_new"],Motion:[0.0,0.9,0.0],damage:1.2d,pickup:0b}
summon minecraft:spectral_arrow ~1 ~2.5 ~ {Tags:["kandy.fl_checked","kandy.fl_homing","kandy.fl_new"],Motion:[0.3,0.7,0.0],damage:1.2d,pickup:0b}
execute as @e[type=minecraft:spectral_arrow,tag=kandy.fl_new] run data modify entity @s Owner set from storage kandy:falconer me
scoreboard players operation @e[type=minecraft:spectral_arrow,tag=kandy.fl_new] fl_tgt = @s fl_lock
tag @e[tag=kandy.fl_new] remove kandy.fl_new
playsound minecraft:entity.parrot.imitate.phantom player @a[distance=..16] ~ ~ ~ 1 1.2
particle minecraft:cloud ~ ~2.5 ~ 0.6 0.3 0.6 0.05 12
