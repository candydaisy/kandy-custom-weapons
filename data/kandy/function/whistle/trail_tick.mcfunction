# Run as and at a player with an active Blood Trail: every 4 ticks draw a crimson scent line to the prey,
# visible only to this player
scoreboard players operation #id whis_tmp = @s whis_prey
execute as @a if score @s whis_pid = #id whis_tmp run tag @s add whis.prey
tag @s add whis.viewer
scoreboard players operation #m whis_tmp = @s whis_trail
scoreboard players operation #m whis_tmp %= #4 whis_tmp
scoreboard players set #steps whis_tmp 32
execute if score #m whis_tmp matches 0 if entity @a[tag=whis.prey,distance=1.5..48] positioned ~ ~0.2 ~ facing entity @a[tag=whis.prey,limit=1] feet run function kandy:whistle/trail_step
tag @a remove whis.prey
tag @s remove whis.viewer
