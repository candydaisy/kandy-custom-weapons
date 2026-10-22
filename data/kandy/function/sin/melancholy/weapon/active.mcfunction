# Active: Frost Nova, run as the wielder at the hit. A ring of frost (5 blocks, 8 with Long Night) that chills and stacks Hypothermia
scoreboard players set @s kandy.cd.melancholy 160
scoreboard players set @s kandy.cdmax.melancholy 160
execute unless entity @s[tag=kandy.melancholy.set] at @s run tag @e[distance=..5,type=!#kandy:unpullable,tag=!kandy.frost_wielder,tag=!kandy.immune] add kandy.frost_nova
execute if entity @s[tag=kandy.melancholy.set] at @s run tag @e[distance=..8,type=!#kandy:unpullable,tag=!kandy.frost_wielder,tag=!kandy.immune] add kandy.frost_nova
execute as @e[tag=kandy.frost_nova] run damage @s 4 kandy:frostveil_frost by @p[tag=kandy.frost_wielder]
execute as @e[tag=kandy.frost_nova] at @s run function kandy:sin/melancholy/weapon/add_stack
execute as @e[tag=kandy.frost_nova] at @s run function kandy:sin/melancholy/weapon/add_stack
# Tier 3: the Nova freezes for 1s (unless just thawed)
scoreboard players set #freeze frost_tmp 20
execute if score #wt frost_tmp matches 3.. as @e[tag=kandy.frost_nova] unless score @s frost_frozen matches 1.. unless score @s frost_imm matches 1.. at @s run function kandy:sin/melancholy/weapon/freeze
scoreboard players set #freeze frost_tmp 0
tag @e[tag=kandy.frost_nova] remove kandy.frost_nova

# Still water nearby freezes over for 4s, then turns back into water
scoreboard players set #n frost_tmp 0
execute at @s store result score #n frost_tmp run fill ~-4 ~-1 ~-4 ~4 ~ ~4 minecraft:frosted_ice replace minecraft:water[level=0]
execute if score #n frost_tmp matches 1.. at @s run summon minecraft:marker ~ ~ ~ {Tags:["kandy.frost_ice","kandy.frost_new"]}
scoreboard players set @e[type=minecraft:marker,tag=kandy.frost_new] frost_ice 80
tag @e[type=minecraft:marker,tag=kandy.frost_new] remove kandy.frost_new

execute at @s run function kandy:sin/melancholy/weapon/nova_ring
execute at @s run playsound minecraft:entity.player.hurt_freeze player @a[distance=..16] ~ ~ ~ 1 0.7
execute at @s run playsound minecraft:ambient.cave player @a[distance=..16] ~ ~ ~ 0.6 0.8
execute at @s run playsound minecraft:block.glass.break player @a[distance=..16] ~ ~ ~ 0.8 1.4
