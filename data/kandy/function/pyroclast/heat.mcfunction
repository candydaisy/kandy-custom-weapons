# Give every player scores to compare against
scoreboard players add @a pyro_heat 0
scoreboard players add @a pyro_od 0
scoreboard players add @a pyro_cd 0

# Heat never cools down on its own; it's only spent when Overdrive ends
scoreboard players set @a[scores={pyro_heat=..-1}] pyro_heat 0

# Overdrive burns out after 6s and the heat is spent
execute as @a[scores={pyro_od=1}] at @s run playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 1 0.8
scoreboard players set @a[scores={pyro_od=1}] pyro_heat 0
# Overheat: 4s of Slowness and Mining Fatigue, and the cleaver's Fire Resistance stops
effect give @a[scores={pyro_od=1}] minecraft:slowness 4 0 true
effect give @a[scores={pyro_od=1}] minecraft:mining_fatigue 4 0 true
scoreboard players set @a[scores={pyro_od=1}] pyro_oh 80
scoreboard players add @a pyro_oh 0
scoreboard players remove @a[scores={pyro_oh=1..}] pyro_oh 1
scoreboard players remove @a[scores={pyro_od=1..}] pyro_od 1

# Fissure cooldown, with a crackle when it's ready again
execute as @a[scores={pyro_cd=1},tag=kandy.main.pyroclast] at @s run playsound minecraft:block.fire.ambient player @s ~ ~ ~ 1 1.5
scoreboard players remove @a[scores={pyro_cd=1..}] pyro_cd 1

# Melt Armor wears off
scoreboard players remove @e[scores={pyro_melt=1..}] pyro_melt 1
execute as @e[scores={pyro_melt=0}] run attribute @s minecraft:armor modifier remove kandy:melt
scoreboard players reset @e[scores={pyro_melt=0}] pyro_melt
