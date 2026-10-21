# While the blade is carried anywhere (these wear off on their own above the thresholds):
# low health empowers you, but slows and blinds you as it gets worse
effect give @a[tag=kandy.lust.wi,scores={hp=..8}] minecraft:strength 2 0 true
effect give @a[tag=kandy.lust.wi,scores={hp=..10}] minecraft:slowness 2 0 true
effect give @a[tag=kandy.lust.wi,scores={hp=..6}] minecraft:darkness 3 0 true

# Obsession: with the blade in hand you bleed 1 HP a second at 2 hearts or less (3 hearts at tier 3)
tag @a remove kandy.lust_bleed
execute as @a[tag=kandy.lust.w] run function kandy:sin/tier
tag @a[tag=kandy.lust.w,scores={hp=..4}] add kandy.lust_bleed
tag @a[tag=kandy.lust.w,scores={hp=..6,kandy.wt=3}] add kandy.lust_bleed
scoreboard players add @a[tag=kandy.lust_bleed] blood_bleed 1
scoreboard players set @a[tag=!kandy.lust_bleed] blood_bleed 0
execute as @a[scores={blood_bleed=20..}] run damage @s 1 minecraft:generic
scoreboard players set @a[scores={blood_bleed=20..}] blood_bleed 0

# Desire, blade in hand: +1 reach at 500+, Speed I at 1000
execute as @a unless entity @s[tag=kandy.lust.w,scores={sprint=500..}] run attribute @s minecraft:entity_interaction_range modifier remove kandy:momentum
execute as @a[tag=kandy.lust.w,scores={sprint=500..}] run attribute @s minecraft:entity_interaction_range modifier add kandy:momentum 1 add_value
effect give @a[tag=kandy.lust.w,scores={sprint=1000..}] minecraft:speed 2 0 true
# shortcut: clears the retired Swiftwind's attack speed bonus every tick; drop once old worlds have moved on
execute as @a run attribute @s minecraft:attack_speed modifier remove kandy:momentum
