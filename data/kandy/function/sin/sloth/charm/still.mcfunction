# Run as and at a Sprig carrier. Standing still = your position hasn't changed since last tick (turning doesn't count)
execute store result score #x ver_t run data get entity @s Pos[0] 20
execute store result score #y ver_t run data get entity @s Pos[1] 20
execute store result score #z ver_t run data get entity @s Pos[2] 20
scoreboard players set #moved ver_t 0
execute unless score #x ver_t = @s ver_x run scoreboard players set #moved ver_t 1
execute unless score #y ver_t = @s ver_y run scoreboard players set #moved ver_t 1
execute unless score #z ver_t = @s ver_z run scoreboard players set #moved ver_t 1
scoreboard players operation @s ver_x = #x ver_t
scoreboard players operation @s ver_y = #y ver_t
scoreboard players operation @s ver_z = #z ver_t

# Inertia: after 5s+ of stillness, getting up is hard (Slowness II for 2s)
execute if score #moved ver_t matches 1 if score @s ver_idle matches 100.. run effect give @s minecraft:slowness 2 1 true
execute if score #moved ver_t matches 1 run scoreboard players set @s ver_t 0
execute if score #moved ver_t matches 1 run scoreboard players set @s ver_dw 0
execute if score #moved ver_t matches 1 run return run scoreboard players set @s ver_idle 0
scoreboard players add @s ver_idle 1

# Dead Weight (set bonus): sneaking still with the Bulwark builds 1 Pressure every 2s
execute if entity @s[tag=kandy.sloth.set] if predicate kandy:sneaking run function kandy:sin/sloth/charm/dead_weight

# Idle: after 2s still, Resistance I and 1 HP every 3s (every 2s on natural ground under open sky). Dead Weight doubles the healing
execute if score @s ver_idle matches ..39 run return 0
effect give @s minecraft:resistance 1 0 true
scoreboard players add @s ver_t 1
scoreboard players set #iv ver_t 60
execute if entity @s[tag=kandy.ver_ground,predicate=kandy:verdant_sprig_sky] run scoreboard players set #iv ver_t 40
execute if entity @s[tag=kandy.sloth.set] run scoreboard players operation #iv ver_t /= #2 ver_t
execute if score @s ver_t >= #iv ver_t run function kandy:sin/sloth/charm/bloom
