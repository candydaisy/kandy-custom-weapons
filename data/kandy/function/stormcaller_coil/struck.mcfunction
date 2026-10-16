# A visual bolt only: no fire and no mob conversions
particle minecraft:electric_spark ~ ~12 ~ 0.1 12 0.1 0 200 force
particle minecraft:end_rod ~ ~12 ~ 0.05 12 0.05 0 60 force
particle minecraft:electric_spark ~ ~0.3 ~ 1 0.2 1 0.3 40 force
playsound minecraft:entity.lightning_bolt.thunder weather @a[distance=..64] ~ ~ ~ 2 1
playsound minecraft:entity.lightning_bolt.impact player @a[distance=..24] ~ ~ ~ 1.5 1
damage @s 3 kandy:tempest_lightning
