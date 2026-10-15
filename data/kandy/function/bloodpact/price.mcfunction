execute as @a[scores={blood_hit=1..}] run damage @s 2 minecraft:generic
# Absorption only comes back once the last dose is gone, otherwise it would pay for every hit
execute as @a[scores={blood_hit=1..}] unless predicate kandy:has_absorption run effect give @s minecraft:absorption 3 0 true
scoreboard players set @a[scores={blood_hit=1..}] blood_hit 0
