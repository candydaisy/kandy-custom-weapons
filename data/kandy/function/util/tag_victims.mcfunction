# Run as a player from a hit advancement reward.
# Tags every entity this player just hurt with kandy.victim.
tag @s add kandy.attacker
execute as @e[distance=..12,tag=!kandy.attacker,nbt={HurtTime:10s}] if function kandy:util/hurt_by_attacker run tag @s add kandy.victim
tag @s remove kandy.attacker
