# Run as and at the creature a bola hit
scoreboard players set @s bola_root 30
scoreboard players set @s bola_imm 110
attribute @s minecraft:movement_speed modifier add kandy:bola_root -0.85 add_multiplied_total
attribute @s minecraft:jump_strength modifier add kandy:bola_root -1 add_multiplied_total

# Fliers: a moment of Levitation ends elytra gliding; Slow Falling brings anyone airborne down safely
# (and resets fall distance, which also spoils a mace dive)
execute if predicate kandy:bola_gliding run effect give @s minecraft:levitation 1 0 true
execute unless predicate kandy:bola_grounded run effect give @s minecraft:slow_falling 3 0 true

execute if entity @s[type=player] run scoreboard players set @s bola_lock 60

particle minecraft:block{block_state:{id:"minecraft:iron_chain"}} ~ ~0.5 ~ 0.4 0.4 0.4 0 25
particle minecraft:crit ~ ~1 ~ 0.4 0.5 0.4 0.2 15
playsound minecraft:block.chain.break player @a[distance=..16] ~ ~ ~ 1 0.8
playsound minecraft:entity.iron_golem.repair player @a[distance=..16] ~ ~ ~ 0.6 1.4
