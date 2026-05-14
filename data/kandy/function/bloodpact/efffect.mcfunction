execute as @a[scores={hp=..8}] if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run effect give @s minecraft:weakness 2 1 true
execute as @a[scores={hp=..10}] if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run effect give @s minecraft:slowness 2 0 true
execute as @a[scores={hp=..4}] if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run damage @s 1 minecraft:generic
execute as @a[scores={hp=..6}] if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run effect give @s minecraft:darkness 3 0 true
execute as @a[scores={hp=11..}] if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run effect clear @s minecraft:weakness
execute as @a[scores={hp=11..}] if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run effect clear @s minecraft:slowness