# Advancement reward: an Arbalest bolt hit something. Shackle it, and Tether the nearest if ready
advancement revoke @s only kandy:sin/greed/hit
tag @s add kandy.attacker
execute as @e[distance=..64,tag=!kandy.attacker,nbt={HurtTime:10s}] if function kandy:util/hurt_by_attacker run tag @s add kandy.cw_hit
tag @s remove kandy.attacker
effect give @e[tag=kandy.cw_hit] minecraft:slowness 2 0
function kandy:sin/tier

# Pilfer: players lose a level to you (2 from tier 2), mobs drop an extra orb
tag @s add kandy.cw_thief
execute as @e[tag=kandy.cw_hit,type=player] run function kandy:sin/greed/weapon/pilfer
execute if score @s kandy.wt matches 2.. as @e[tag=kandy.cw_hit,type=player] run function kandy:sin/greed/weapon/pilfer
execute as @e[tag=kandy.cw_hit,type=!player] at @s run summon minecraft:experience_orb ~ ~0.5 ~ {Value:1s}
tag @s remove kandy.cw_thief

# Active: Tether the nearest creature hit
execute if score @s cw_tt matches 0 if entity @e[tag=kandy.cw_hit] run function kandy:sin/active {sin:"greed"}
tag @e[tag=kandy.cw_hit] remove kandy.cw_hit
