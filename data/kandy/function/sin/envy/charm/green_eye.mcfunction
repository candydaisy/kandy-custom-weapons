# Run as a player whose Green Eye count changed: swap the armor modifier for the new count
execute if score @s wat_ge > @s wat_gep at @s run playsound minecraft:entity.elder_guardian.curse player @s ~ ~ ~ 0.15 1.8
scoreboard players operation @s wat_gep = @s wat_ge
attribute @s minecraft:armor modifier remove kandy:green_eye
execute if score @s wat_ge matches 0 run return 0
execute store result storage kandy:envy ge.amt double -1 run scoreboard players get @s wat_ge
function kandy:sin/envy/charm/green_eye_apply with storage kandy:envy ge
