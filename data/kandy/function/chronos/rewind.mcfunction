# Run as and at a player with an active anchor who sneak-right-clicked
scoreboard players operation #id chr_id = @s chr_id
# Only an anchor in this dimension whose spot is still clear counts
execute as @e[type=minecraft:marker,tag=kandy.chr_anchor,distance=0..] if score @s chr_id = #id chr_id at @s if block ~ ~ ~ #kandy:passable if block ~ ~1 ~ #kandy:passable run tag @s add kandy.chr_target
execute unless entity @e[type=minecraft:marker,tag=kandy.chr_target] run return run function kandy:chronos/fail

# Temporal shockwave where you left: chasers are slowed
particle minecraft:reverse_portal ~ ~1 ~ 0.5 0.8 0.5 0.1 60
particle minecraft:dust{color:[0.45,0.73,1.0],scale:1.4} ~ ~1 ~ 1.5 0.5 1.5 0 30
playsound minecraft:block.beacon.deactivate player @a[distance=..16] ~ ~ ~ 1 1.6
effect give @e[distance=0.1..3,type=!#kandy:unpullable,tag=!kandy.immune] minecraft:slowness 1 3 true

execute at @e[type=minecraft:marker,tag=kandy.chr_target,limit=1] run tp @s ~ ~ ~

# Recover some of the health lost since the anchor (Instant Health heals 4, otherwise a short Regeneration)
scoreboard players operation #diff chr_tmp = @s chr_ahp
scoreboard players operation #diff chr_tmp -= @s chr_hp
execute if score #diff chr_tmp matches 4.. run effect give @s minecraft:instant_health 1 0 true
execute if score #diff chr_tmp matches 1..3 run effect give @s minecraft:regeneration 2 1 true
effect clear @s minecraft:poison
effect clear @s minecraft:wither
effect clear @s minecraft:slowness
effect clear @s minecraft:weakness
effect clear @s minecraft:blindness
effect clear @s minecraft:darkness
effect clear @s minecraft:nausea
effect clear @s minecraft:mining_fatigue
effect clear @s minecraft:hunger

execute at @s run particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.4} ~ ~1 ~ 0.4 0.8 0.4 0 30
execute at @s run playsound minecraft:block.amethyst_block.chime player @a[distance=..16] ~ ~ ~ 1.5 0.5
kill @e[type=minecraft:marker,tag=kandy.chr_target]
scoreboard players set @s chr_anc 0
scoreboard players set @s chr_cd 400
