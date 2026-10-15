execute as @a[tag=kandy.void_cloaked] run effect clear @s minecraft:invisibility
tag @a remove kandy.void_cloaked
tag @a remove kandy.void_moved
scoreboard objectives remove void_cd
scoreboard objectives remove void_x
scoreboard objectives remove void_y
scoreboard objectives remove void_z
scoreboard objectives remove void_dim
scoreboard objectives remove void_saved
scoreboard objectives remove void_dark
scoreboard objectives remove void_cloak
scoreboard objectives remove void_cloak_cd
advancement revoke @a only kandy:void_talisman/attack
advancement revoke @a only kandy:void_talisman/hurt
data remove storage kandy:void_talisman pos
