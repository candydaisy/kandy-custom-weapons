# The grenade shatters: open a 5s smoke cloud here
tag @s remove smk.tracker
tag @s add smk.cloud
scoreboard players set @s smk_life 100
particle minecraft:campfire_signal_smoke ~ ~1 ~ 1.5 0.8 1.5 0.02 40
particle minecraft:large_smoke ~ ~1 ~ 1.5 0.8 1.5 0.05 60
particle minecraft:squid_ink ~ ~1 ~ 1.2 0.6 1.2 0.05 30
playsound minecraft:block.fire.extinguish player @a[distance=..24] ~ ~ ~ 1 0.6
playsound minecraft:entity.generic.explode player @a[distance=..24] ~ ~ ~ 0.5 0.5
