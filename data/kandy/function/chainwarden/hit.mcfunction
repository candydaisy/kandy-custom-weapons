# Advancement reward: an Arbalest bolt hit something. Shackle it, and Tether the nearest if ready
advancement revoke @s only kandy:hit/chainwarden
tag @s add kandy.attacker
execute as @e[distance=..64,tag=!kandy.attacker,nbt={HurtTime:10s}] if function kandy:util/hurt_by_attacker run tag @s add kandy.cw_hit
tag @s remove kandy.attacker
effect give @e[tag=kandy.cw_hit] minecraft:slowness 2 0
execute if score @s cw_cd matches 0 if score @s cw_tt matches 0 if entity @e[tag=kandy.cw_hit] run function kandy:chainwarden/tether
tag @e[tag=kandy.cw_hit] remove kandy.cw_hit
