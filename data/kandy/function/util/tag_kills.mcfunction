# Run as a player from a kill advancement reward.
# Tags every creature this player just killed (still there on its death tick) with kandy.killed.
tag @s add kandy.attacker
execute as @e[distance=..64,type=!player,tag=!kandy.attacker,nbt={Health:0.0f,DeathTime:0s}] if function kandy:util/hurt_by_attacker run tag @s add kandy.killed
tag @s remove kandy.attacker
