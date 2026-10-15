# Gale Surge: dash up to 6 blocks where you look; anything you pass through takes 3 damage and knockback
scoreboard players set @s tem_dcd 80
tag @s add kandy.tem_wielder
tag @s add kandy.tem_busy
particle minecraft:gust ~ ~1 ~ 0 0 0 0 1
particle minecraft:cloud ~ ~1 ~ 0.3 0.3 0.3 0.05 10
playsound minecraft:entity.breeze.wind_burst player @a[distance=..16] ~ ~ ~ 1 1.2
scoreboard players set #steps tem_tmp 12
function kandy:tempest/surge_step
execute as @e[tag=kandy.tem_gust] run damage @s 3 minecraft:mob_attack by @p[tag=kandy.tem_wielder]
tag @e[tag=kandy.tem_gust] remove kandy.tem_gust

# No fall damage until you land
attribute @s minecraft:fall_damage_multiplier modifier add kandy:tempest_surge -1 add_multiplied_total
tag @s add kandy.tem_nofall
scoreboard players set @s tem_fall 5
tag @s remove kandy.tem_busy
tag @s remove kandy.tem_wielder
