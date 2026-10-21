# Advancement reward: the player killed something. Carrying the Coin: spoils from every mob, sometimes its loot twice.
# The kill can't be selected any more, so it is reached through the rider mark gave it
advancement revoke @s only kandy:sin/greed/plunder
execute unless entity @s[tag=kandy.greed.c] run return 0
tag @s add kandy.attacker
tag @s add kandy.plc_greedy
scoreboard players operation #gid plc_tmp = @s ecl_pid
execute as @e[distance=..64,type=minecraft:item_display,tag=kandy.plc_eye] on vehicle if entity @s[tag=!kandy.plc_paid,nbt={Health:0.0f}] if function kandy:util/hurt_by_attacker at @s run function kandy:sin/greed/charm/plunder
tag @s remove kandy.attacker
tag @s remove kandy.plc_greedy
