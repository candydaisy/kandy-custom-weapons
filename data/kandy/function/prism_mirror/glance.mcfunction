# Heal back what the projectile took (Instant Health I = 4 HP, II = 8, III = 16)
execute if score #dmg prm_tmp matches 1..40 run effect give @s minecraft:instant_health 1 0 true
execute if score #dmg prm_tmp matches 41..80 run effect give @s minecraft:instant_health 1 1 true
execute if score #dmg prm_tmp matches 81.. run effect give @s minecraft:instant_health 1 2 true
scoreboard players set @s prm_cd 300
particle minecraft:end_rod ~ ~1.2 ~ 0.4 0.6 0.4 0.08 20
particle minecraft:glow ~ ~1.2 ~ 0.4 0.6 0.4 0 10
playsound minecraft:block.glass.break player @a[distance=..16] ~ ~ ~ 0.8 1.6
playsound minecraft:block.amethyst_block.chime player @a[distance=..16] ~ ~ ~ 1 1.2
