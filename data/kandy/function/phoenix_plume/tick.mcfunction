scoreboard players add @a[tag=kandy.charm.phoenix_plume] phx_cd 0
scoreboard players remove @a[scores={phx_cd=1..}] phx_cd 1
execute as @a[tag=kandy.charm.phoenix_plume,scores={phx_cd=1},tag=!kandy.immune] at @s run playsound minecraft:block.fire.ambient player @s ~ ~ ~ 1 1.4

# Rebirth: at 2 hearts or less (alive), once per 5 minutes
execute as @a[tag=kandy.charm.phoenix_plume,tag=!kandy.immune,scores={phx_cd=0,phx_hp=1..4}] at @s run function kandy:phoenix_plume/rebirth

# Ash Body wears off after 60s
execute as @a[scores={phx_ash=1}] run attribute @s minecraft:max_health modifier remove kandy:phoenix_ash
scoreboard players remove @a[scores={phx_ash=1..}] phx_ash 1
execute as @a[scores={phx_ash=1..}] at @s run particle minecraft:white_ash ~ ~0.2 ~ 0.4 0.1 0.4 0 2
