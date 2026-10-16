# The pact's reward for a charged hit: brief Absorption, only once the last dose is gone
# While bleeding (4 HP or less, blade in hand) it also drinks: a charged hit heals 2 hearts
execute as @a[scores={blood_hit=1..,hp=..4},tag=kandy.main.bloodpact] at @s run function kandy:bloodpact/lifesteal
execute as @a[scores={blood_hit=1..}] unless predicate kandy:has_absorption run effect give @s minecraft:absorption 3 0 true
scoreboard players set @a[scores={blood_hit=1..}] blood_hit 0
