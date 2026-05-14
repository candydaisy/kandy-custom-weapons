execute as @e[nbt={HurtTime:10s}] at @s if entity @a[distance=..5,scores={sneak=1..},nbt={OnGround:0b}] if items entity @a[distance=..5,scores={sneak=1..},nbt={OnGround:0b},sort=nearest] weapon.mainhand *[custom_data~{ability:"Gravity"}] run scoreboard players set @s grav_hit 1
execute as @e[scores={grav_hit=1}] at @s run tp @s ~ ~-1 ~
execute as @e[scores={grav_hit=1}] run effect give @s minecraft:slowness 1 0 true
execute as @e[scores={grav_hit=1}] run scoreboard players set @s grav_hit 0
execute as @a[scores={sneak=1..}] if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run effect give @s minecraft:slowness 2 5 true
execute as @a[scores={sneak=1..}] if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] at @s as @e[distance=2..10,type=!#minecraft:arrows,type=!minecraft:wind_charge] at @s facing entity @a[distance=..7] feet rotated ~ 0 run tp @s ^ ^ ^0.1
scoreboard players set @a sneak 0