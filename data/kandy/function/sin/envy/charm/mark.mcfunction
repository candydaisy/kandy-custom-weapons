# Run as and at a player who has scoped the lens for 1s: mark the first creature along their view (48 blocks)
tag @s add kandy.wat_self
scoreboard players set #hit wat_t 0
scoreboard players operation #me wat_t = @s ecl_pid
scoreboard players set #steps wat_t 96
execute anchored eyes positioned ^ ^ ^ run function kandy:sin/envy/charm/ray
execute if score #hit wat_t matches 1 run function kandy:sin/envy/charm/marked
tag @s remove kandy.wat_self
