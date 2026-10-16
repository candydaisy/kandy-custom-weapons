scoreboard players set #t mer_t 0
# Guild Favor: a stronger Hero of the Village (from a raid) is kept by vanilla
effect give @a[tag=kandy.charm.merchant_sigil] minecraft:hero_of_the_village 6 0 true
effect give @a[tag=kandy.charm.merchant_sigil] minecraft:luck 6 0 true
# Marked Purse: raiders within 16 blocks move faster
execute at @a[tag=kandy.charm.merchant_sigil,tag=!kandy.immune] run effect give @e[type=#minecraft:raiders,distance=..16] minecraft:speed 3 0
