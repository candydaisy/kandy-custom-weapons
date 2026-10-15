# Run this, then disable the pack with /datapack disable
execute as @a run attribute @s minecraft:attack_speed modifier remove kandy:momentum
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove kandy:momentum
execute as @a run attribute @s minecraft:attack_damage modifier remove minecraft:blood_dmg
execute as @a run attribute @s minecraft:attack_speed modifier remove minecraft:momentum
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove minecraft:momentum

scoreboard objectives remove sprint
scoreboard objectives remove echo_timer
scoreboard objectives remove echo_stacks
scoreboard objectives remove blood_hit
scoreboard objectives remove blood_bleed
scoreboard objectives remove hp
scoreboard objectives remove grav_pull
scoreboard objectives remove grav_hit
scoreboard objectives remove sneak

advancement revoke @a only kandy:hit/lingering_soul
advancement revoke @a only kandy:hit/worldbreaker
advancement revoke @a only kandy:hit/bloodpact

tellraw @a "Kandy uninstalled. Now run /datapack disable on this pack."
