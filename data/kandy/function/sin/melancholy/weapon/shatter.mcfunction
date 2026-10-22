# Run as and at a Frozen Solid victim hit by the wielder: break the ice for true damage and a cold splash
tag @s add kandy.frost_shattered
scoreboard players add #shat frost_tmp 1
execute if score #night frost_tmp matches 1 run function kandy:sin/melancholy/weapon/long_night
function kandy:sin/melancholy/weapon/unfreeze
function kandy:sin/melancholy/weapon/thaw
damage @s 6 kandy:frostveil_shatter by @p[tag=kandy.frost_wielder]
tag @e[distance=..4,type=!#kandy:unpullable,tag=!kandy.frost_wielder,tag=!kandy.immune,tag=!kandy.frost_shattered] add kandy.frost_splash
execute as @e[tag=kandy.frost_splash] run damage @s 3 kandy:frostveil_frost by @p[tag=kandy.frost_wielder]
tag @e[tag=kandy.frost_splash] remove kandy.frost_splash
particle minecraft:block{block_state:{id:"minecraft:packed_ice"}} ~ ~1 ~ 0.6 0.8 0.6 0 60
particle minecraft:item_snowball ~ ~1 ~ 0.3 0.5 0.3 0.4 30
playsound minecraft:block.amethyst_block.shatter hostile @a[distance=..16] ~ ~ ~ 1.2 0.6
playsound minecraft:block.glass.break hostile @a[distance=..16] ~ ~ ~ 1 0.8
