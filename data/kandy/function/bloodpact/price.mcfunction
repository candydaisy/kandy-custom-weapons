# The pact's reward for a charged hit: brief Absorption, only once the last dose is gone
execute as @a[scores={blood_hit=1..}] unless predicate kandy:has_absorption run effect give @s minecraft:absorption 3 0 true
scoreboard players set @a[scores={blood_hit=1..}] blood_hit 0
