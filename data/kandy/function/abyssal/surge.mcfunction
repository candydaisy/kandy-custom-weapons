# Tidal Surge: spend all Pressure in a ~90 degree wave reaching 7 blocks ahead
tag @s add kandy.bulw_src
scoreboard players set @s bulw_scd 160
execute rotated ~ 0 positioned ^ ^ ^1 run tag @e[distance=..1.2,type=!#kandy:unpullable,tag=!kandy.bulw_src,tag=!kandy.immune] add kandy.bulw_wave
execute rotated ~ 0 positioned ^ ^ ^2 run tag @e[distance=..1.6,type=!#kandy:unpullable,tag=!kandy.bulw_src,tag=!kandy.immune] add kandy.bulw_wave
execute rotated ~ 0 positioned ^ ^ ^3 run tag @e[distance=..2.0,type=!#kandy:unpullable,tag=!kandy.bulw_src,tag=!kandy.immune] add kandy.bulw_wave
execute rotated ~ 0 positioned ^ ^ ^4 run tag @e[distance=..2.4,type=!#kandy:unpullable,tag=!kandy.bulw_src,tag=!kandy.immune] add kandy.bulw_wave
execute rotated ~ 0 positioned ^ ^ ^5 run tag @e[distance=..2.8,type=!#kandy:unpullable,tag=!kandy.bulw_src,tag=!kandy.immune] add kandy.bulw_wave
execute rotated ~ 0 positioned ^ ^ ^6 run tag @e[distance=..3.2,type=!#kandy:unpullable,tag=!kandy.bulw_src,tag=!kandy.immune] add kandy.bulw_wave
execute rotated ~ 0 positioned ^ ^ ^7 run tag @e[distance=..3.4,type=!#kandy:unpullable,tag=!kandy.bulw_src,tag=!kandy.immune] add kandy.bulw_wave
execute rotated ~ 0 positioned ^ ^0.6 ^1 run particle minecraft:splash ~ ~ ~ 0.6 0.3 0.6 0.2 12
execute rotated ~ 0 positioned ^ ^0.6 ^2 run particle minecraft:splash ~ ~ ~ 0.8 0.3 0.8 0.2 16
execute rotated ~ 0 positioned ^ ^0.6 ^3 run particle minecraft:splash ~ ~ ~ 1.0 0.3 1.0 0.2 20
execute rotated ~ 0 positioned ^ ^0.6 ^4 run particle minecraft:splash ~ ~ ~ 1.2 0.3 1.2 0.2 24
execute rotated ~ 0 positioned ^ ^0.6 ^5 run particle minecraft:splash ~ ~ ~ 1.4 0.3 1.4 0.2 28
execute rotated ~ 0 positioned ^ ^0.6 ^6 run particle minecraft:splash ~ ~ ~ 1.6 0.3 1.6 0.2 32
execute rotated ~ 0 positioned ^ ^0.6 ^7 run particle minecraft:splash ~ ~ ~ 1.7 0.3 1.7 0.2 36
execute rotated ~ 0 positioned ^ ^0.4 ^1 run particle minecraft:bubble_pop ~ ~ ~ 0.6 0.3 0.6 0.05 6
execute rotated ~ 0 positioned ^ ^0.4 ^2 run particle minecraft:bubble_pop ~ ~ ~ 0.8 0.3 0.8 0.05 8
execute rotated ~ 0 positioned ^ ^0.4 ^3 run particle minecraft:bubble_pop ~ ~ ~ 1.0 0.3 1.0 0.05 10
execute rotated ~ 0 positioned ^ ^0.4 ^4 run particle minecraft:bubble_pop ~ ~ ~ 1.2 0.3 1.2 0.05 12
execute rotated ~ 0 positioned ^ ^0.4 ^5 run particle minecraft:bubble_pop ~ ~ ~ 1.4 0.3 1.4 0.05 14
execute rotated ~ 0 positioned ^ ^0.4 ^6 run particle minecraft:bubble_pop ~ ~ ~ 1.6 0.3 1.6 0.05 16
execute rotated ~ 0 positioned ^ ^0.4 ^7 run particle minecraft:bubble_pop ~ ~ ~ 1.7 0.3 1.7 0.05 18
playsound minecraft:entity.player.splash.high_speed player @a[distance=..16] ~ ~ ~ 1.5 0.8
playsound minecraft:item.trident.riptide_3 player @a[distance=..16] ~ ~ ~ 1 1.2

# Push direction: a unit vector along your facing, flattened
execute rotated ~ 0 positioned ^ ^ ^1 summon minecraft:marker run tag @s add kandy.bulw_dir
execute store result score #dx bulw_tmp run data get entity @e[type=minecraft:marker,tag=kandy.bulw_dir,limit=1] Pos[0] 1000
execute store result score #dz bulw_tmp run data get entity @e[type=minecraft:marker,tag=kandy.bulw_dir,limit=1] Pos[2] 1000
execute store result score #px bulw_tmp run data get entity @s Pos[0] 1000
execute store result score #pz bulw_tmp run data get entity @s Pos[2] 1000
scoreboard players operation #dx bulw_tmp -= #px bulw_tmp
scoreboard players operation #dz bulw_tmp -= #pz bulw_tmp
kill @e[type=minecraft:marker,tag=kandy.bulw_dir]

# 1-2 charges: 4 damage, 3-4: 7, 5: 10 plus Slowness II, Mining Fatigue II and a launch
execute if score @s bulw_chg matches 1..2 as @e[tag=kandy.bulw_wave] run damage @s 4 kandy:abyssal_surge by @p[tag=kandy.bulw_src]
execute if score @s bulw_chg matches 3..4 as @e[tag=kandy.bulw_wave] run damage @s 7 kandy:abyssal_surge by @p[tag=kandy.bulw_src]
execute if score @s bulw_chg matches 5.. as @e[tag=kandy.bulw_wave] run damage @s 10 kandy:abyssal_surge by @p[tag=kandy.bulw_src]
execute if score @s bulw_chg matches 5.. run effect give @e[tag=kandy.bulw_wave] minecraft:slowness 4 1
execute if score @s bulw_chg matches 5.. run effect give @e[tag=kandy.bulw_wave] minecraft:mining_fatigue 4 1

# Extra push for mobs (players only get the damage knockback, their motion can't be set)
execute if score @s bulw_chg matches 1..2 as @e[tag=kandy.bulw_wave,type=!minecraft:player] run function kandy:abyssal/push {scale:0.0008,up:0.3}
execute if score @s bulw_chg matches 3..4 as @e[tag=kandy.bulw_wave,type=!minecraft:player] run function kandy:abyssal/push {scale:0.0014,up:0.35}
execute if score @s bulw_chg matches 5.. as @e[tag=kandy.bulw_wave,type=!minecraft:player] run function kandy:abyssal/push {scale:0.0012,up:0.7}
execute if score @s bulw_chg matches 5.. run effect give @e[tag=kandy.bulw_wave,type=minecraft:player] minecraft:levitation 1 1 true

scoreboard players set @s bulw_chg 0
scoreboard players set @s bulw_decay 0
tag @e[tag=kandy.bulw_wave] remove kandy.bulw_wave
tag @s remove kandy.bulw_src
