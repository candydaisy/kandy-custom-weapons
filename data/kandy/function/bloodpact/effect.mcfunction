# While the blade is carried anywhere (these wear off on their own above the thresholds):
# low health empowers you, but slows and blinds you as it gets worse
effect give @a[tag=kandy.inv.bloodpact,scores={hp=..8}] minecraft:strength 2 0 true
effect give @a[tag=kandy.inv.bloodpact,scores={hp=..10}] minecraft:slowness 2 0 true
effect give @a[tag=kandy.inv.bloodpact,scores={hp=..6}] minecraft:darkness 3 0 true

# Bleed: 1 damage per second at 4 HP or less, only while the blade is in hand
scoreboard players add @a[tag=kandy.main.bloodpact,scores={hp=..4}] blood_bleed 1
scoreboard players set @a[tag=!kandy.main.bloodpact] blood_bleed 0
scoreboard players set @a[scores={hp=5..}] blood_bleed 0
execute as @a[scores={blood_bleed=20..}] run damage @s 1 minecraft:generic
scoreboard players set @a[scores={blood_bleed=20..}] blood_bleed 0
