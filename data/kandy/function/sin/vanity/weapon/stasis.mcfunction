# Run as and at the target of a critical hit
scoreboard players set @s chr_scd 200
# Players get a heavy 1s slow; mobs are frozen solid for 2s
effect give @s[type=player] minecraft:slowness 1 4 true
execute unless entity @s[type=player] unless entity @s[nbt={NoAI:1b}] run function kandy:sin/vanity/weapon/freeze
particle minecraft:reverse_portal ~ ~1 ~ 0.4 0.6 0.4 0.02 40
particle minecraft:dust{color:[0.45,0.73,1.0],scale:1.4} ~ ~1 ~ 0.4 0.6 0.4 0 20
playsound minecraft:block.bell.resonate player @a[distance=..16] ~ ~ ~ 1 1.6
