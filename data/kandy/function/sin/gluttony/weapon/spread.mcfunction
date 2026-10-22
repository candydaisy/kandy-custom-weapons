# Run as and at a dying creature that still carries echoes
tag @s add kandy.soul_dead
scoreboard players operation #owner soul_pid = @s echo_owner
scoreboard players operation #stacks soul_pid = @s echo_stacks
scoreboard players operation #tier soul_pid = @s echo_tier
execute as @a if score @s soul_pid = #owner soul_pid run tag @s add kandy.soul_owner
# Up to 5 blocks (8 at tier 3)
execute unless score @s echo_tier matches 3.. as @e[distance=..5,type=!#kandy:unpullable,tag=!kandy.immune,tag=!kandy.soul_dead,tag=!kandy.soul_owner,sort=nearest,limit=1] run function kandy:sin/gluttony/weapon/inherit
execute if score @s echo_tier matches 3.. as @e[distance=..8,type=!#kandy:unpullable,tag=!kandy.immune,tag=!kandy.soul_dead,tag=!kandy.soul_owner,sort=nearest,limit=1] run function kandy:sin/gluttony/weapon/inherit
scoreboard players set @s echo_stacks 0
tag @a remove kandy.soul_owner
tag @s remove kandy.soul_dead
