# Run as a fresh full-draw arrow. It stops at the first thing it hits, and a marker
# follows it so the vortex can open where it landed even after the arrow is gone
tag @s add ecl.singular
data merge entity @s {PierceLevel:0b}
scoreboard players add #next ecl_tmp 1
scoreboard players operation @s ecl_id = #next ecl_tmp
scoreboard players set @a[tag=ecl.shooter] ecl_cd 240
summon minecraft:marker ~ ~ ~ {Tags:["ecl.tracker","ecl.new"]}
scoreboard players operation @e[type=marker,tag=ecl.new] ecl_id = #next ecl_tmp
scoreboard players operation @e[type=marker,tag=ecl.new] ecl_pid = @a[tag=ecl.shooter,limit=1] ecl_pid
scoreboard players set @e[type=marker,tag=ecl.new] ecl_life 200
tag @e[type=marker,tag=ecl.new] remove ecl.new
execute at @a[tag=ecl.shooter] run playsound minecraft:entity.enderman.teleport player @a[distance=..16] ~ ~ ~ 0.8 0.5
