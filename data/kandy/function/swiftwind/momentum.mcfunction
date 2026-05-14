execute as @a[scores={sprint=1..}] run scoreboard players remove @s sprint 11
execute as @a[scores={sprint=..-1}] run scoreboard players set @s sprint 0
execute as @a[scores={sprint=1000..}] run scoreboard players set @s sprint 1000