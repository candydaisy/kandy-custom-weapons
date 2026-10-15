# Leave the carrier's own flaming arrows alone
execute on origin if entity @s[tag=kandy.molt_self] run return 0
data merge entity @s {Fire:0s,HasVisualFire:0b}
particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0.01 4
playsound minecraft:block.fire.extinguish hostile @a[distance=..16] ~ ~ ~ 0.3 1.6
