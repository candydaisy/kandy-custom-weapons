# Advancement reward (as the shooter): a Decay Dart hit something. Afflict everything it just hurt with Necrosis
advancement revoke @s only kandy:decay_dart/hit
tag @s add kandy.attacker
execute as @e[distance=..128,tag=!kandy.attacker,nbt={HurtTime:10s}] if function kandy:util/hurt_by_attacker run function kandy:decay_dart/afflict
tag @s remove kandy.attacker
