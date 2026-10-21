# Active: tear a 10-block Magma Fissure along the ground in the facing direction (10s cooldown)
scoreboard players set @s kandy.cd 200
scoreboard players set @s kandy.cdmax 200

# Spend 50% heat (if there is that much) for double damage; Overdrive always doubles for free
execute if score @s pyro_od matches 1.. run tag @s add kandy.pyro_double
execute if score @s pyro_od matches 0 if score @s pyro_heat matches 50.. run tag @s add kandy.pyro_double
execute if score @s pyro_od matches 0 if score @s pyro_heat matches 50.. run scoreboard players remove @s pyro_heat 50

playsound minecraft:entity.generic.explode player @a[distance=..16] ~ ~ ~ 1 0.7
scoreboard players set #steps pyro_tmp 10
# Start on the ground even when the hit lands mid-jump
execute rotated ~ 0 align y if block ~ ~-1 ~ #kandy:passable positioned ~ ~-1 ~ positioned ^ ^ ^1 run function kandy:sin/wrath/weapon/fissure_step
execute rotated ~ 0 align y unless block ~ ~-1 ~ #kandy:passable positioned ^ ^ ^1 run function kandy:sin/wrath/weapon/fissure_step

execute as @e[tag=kandy.fissure_hit] at @s run function kandy:sin/wrath/weapon/fissure_hit
tag @e[tag=kandy.fissure_hit] remove kandy.fissure_hit
tag @s remove kandy.pyro_double
playsound minecraft:block.lava.extinguish player @a[distance=..16] ~ ~ ~ 1 0.8
