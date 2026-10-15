# Run as and at a dome marker: for 2.5s, projectiles flying in from others are sent back the way they came
scoreboard players remove @s rep_life 1
execute if score @s rep_life matches ..0 run return run kill @s
scoreboard players operation #t rep_tmp = @s rep_life
scoreboard players operation #t rep_tmp %= #10 rep_tmp
execute if score #t rep_tmp matches 0 run particle minecraft:end_rod ~ ~1 ~ 1.8 1.2 1.8 0 8

data remove storage kandy:repulsor me
data modify storage kandy:repulsor me set from entity @s data.owner
execute as @e[type=#minecraft:impact_projectiles,distance=..4,tag=!kandy.rep_reflected] unless data entity @s {inGround:1b} unless function kandy:repulsor/owned_by_mine at @s run function kandy:repulsor/reflect
