# Run as the marked creature
effect give @s minecraft:glowing 10 0 true
scoreboard players set @s wat_mt 200
scoreboard players operation @s wat_by = #me wat_t
scoreboard players set #hit wat_t 1
return 1
