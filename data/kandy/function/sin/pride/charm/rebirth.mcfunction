# Run as and at a carrier who just fell to 2 hearts or less
scoreboard players set @s kandy.ccd.pride 6000
scoreboard players set @s kandy.ccdmax.pride 6000
scoreboard players set @s phx_ash 1200
effect give @s minecraft:regeneration 4 2
effect give @s minecraft:absorption 8 1
effect give @s minecraft:fire_resistance 8 0

# Ring of fire: 4 fire damage to everything within 4 blocks, mobs catch fire
tag @s add kandy.phx_src
execute as @e[distance=..4,type=!#kandy:unpullable,tag=!kandy.phx_src,tag=!kandy.immune] run damage @s 4 minecraft:in_fire by @p[tag=kandy.phx_src]
execute as @e[distance=..4,type=!minecraft:player,type=!#kandy:unpullable,tag=!kandy.phx_src] run data merge entity @s {Fire:80s}
tag @s remove kandy.phx_src

# Ascendant (Wyrmspear held): rising from the ashes readies the Leap
execute if entity @s[tag=kandy.pride.set] if score @s kandy.cd.pride matches 1.. run playsound minecraft:entity.ender_dragon.flap player @s ~ ~ ~ 1 1.4
scoreboard players set @s[tag=kandy.pride.set] kandy.cd.pride 0

# Ash Body: -2 max hearts for 60s
attribute @s minecraft:max_health modifier add kandy:phoenix_ash -4 add_value

playsound minecraft:item.totem.use player @a[distance=..24] ~ ~ ~ 1 1.4
playsound minecraft:entity.blaze.shoot player @a[distance=..24] ~ ~ ~ 1 0.6
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.8 0.5 0.4 60
particle minecraft:flame ~ ~0.3 ~ 2 0.1 2 0.05 80
particle minecraft:lava ~ ~0.5 ~ 1.5 0.2 1.5 0 20
