# Run as and at an Idle carrier: one heal (a 3s Regeneration I heals exactly once)
scoreboard players set @s ver_t 0
effect give @s minecraft:regeneration 3 0 true
particle minecraft:happy_villager ~ ~0.6 ~ 0.4 0.4 0.4 0 4
particle minecraft:spore_blossom_air ~ ~1 ~ 0.4 0.5 0.4 0 6
playsound minecraft:block.conduit.ambient player @s ~ ~ ~ 0.3 1.2
