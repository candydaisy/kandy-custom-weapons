execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"BloodPact"}] at @s run execute as @e[type=!#minecraft:arrows,type=minecraft:wind_charge,nbt={HurtTime:10s},distance=..5] run scoreboard players set @n blood_hit 1
execute as @a[scores={blood_hit=1..}] run damage @s 2 minecraft:generic
execute as @a[scores={blood_hit=1..}] run effect give @s minecraft:absorption 3 0 true
execute as @a[scores={blood_hit=1..}] run scoreboard players set @s blood_hit 0
