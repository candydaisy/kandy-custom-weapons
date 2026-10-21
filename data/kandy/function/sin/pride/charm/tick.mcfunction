# Rebirth ready again (the shared kandy.ccd counts down in sin/tick, right after this)
execute as @a[tag=kandy.pride.c,scores={kandy.ccd=1},tag=!kandy.immune] at @s run playsound minecraft:block.fire.ambient player @s ~ ~ ~ 1 1.4

# Rebirth: at 2 hearts or less (alive), once per 5 minutes
execute as @a[tag=kandy.pride.c,tag=!kandy.immune,scores={kandy.ccd=0,phx_hp=1..4}] at @s run function kandy:sin/pride/charm/rebirth

# Never Retreat: below half health, Pride won't run
execute as @a[tag=kandy.pride.c] store result score @s phx_half run attribute @s minecraft:max_health get 0.5
execute as @a[tag=kandy.pride.c] if score @s phx_hp < @s phx_half run effect give @s minecraft:slowness 1 0 true

# Ash Body wears off after 60s
execute as @a[scores={phx_ash=1}] run attribute @s minecraft:max_health modifier remove kandy:phoenix_ash
scoreboard players remove @a[scores={phx_ash=1..}] phx_ash 1
execute as @a[scores={phx_ash=1..}] at @s run particle minecraft:white_ash ~ ~0.2 ~ 0.4 0.1 0.4 0 2
