# The pact's reward for a charged hit: brief Absorption, only once the last dose is gone
# While bleeding it also drinks: a charged hit heals 2 hearts (plus a burst of Regeneration from tier 2)
execute as @a[scores={blood_hit=1..},tag=kandy.lust_bleed] at @s run function kandy:sin/lust/weapon/lifesteal
execute as @a[scores={blood_hit=1..}] unless predicate kandy:has_absorption run effect give @s minecraft:absorption 3 0 true
scoreboard players set @a[scores={blood_hit=1..}] blood_hit 0
