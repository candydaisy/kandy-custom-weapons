tag @s add kandy.void_cloaked
effect give @s minecraft:invisibility 1 0 true
# One big burst as you vanish, nothing while you stay hidden
playsound minecraft:block.sculk.spread player @a[distance=..16] ~ ~ ~ 1 0.6
playsound minecraft:entity.warden.sonic_charge player @s ~ ~ ~ 0.4 1.6
particle minecraft:sculk_soul ~ ~1 ~ 0.5 0.8 0.5 0.06 40
particle minecraft:reverse_portal ~ ~1 ~ 0.4 0.9 0.4 0.08 60
particle minecraft:large_smoke ~ ~0.6 ~ 0.4 0.5 0.4 0.02 20
