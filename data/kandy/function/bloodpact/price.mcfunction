execute as @a[scores={blood_hit=1..}] run damage @s 2 minecraft:generic
execute as @a[scores={blood_hit=1..}] run effect give @s minecraft:absorption 3 0 true
scoreboard players set @a[scores={blood_hit=1..}] blood_hit 0
