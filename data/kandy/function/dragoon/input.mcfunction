# Rising edges of Jump (while sneaking, on the ground) and of Sneak (midair after a Leap)
scoreboard players add @s dg_dive 0
scoreboard players set #j dg_tmp 0
execute if predicate kandy:abyssal_bulwark_jump run scoreboard players set #j dg_tmp 1
execute if score #j dg_tmp matches 1 unless score @s dg_jmp matches 1 if score @s dg_cd matches 0 if score @s dg_st matches 0 if predicate kandy:sneaking if predicate kandy:tempest_grounded at @s run function kandy:dragoon/leap
scoreboard players operation @s dg_jmp = #j dg_tmp

scoreboard players set #s dg_tmp 0
execute if predicate kandy:sneaking run scoreboard players set #s dg_tmp 1
execute if score #s dg_tmp matches 1 unless score @s dg_snk matches 1 if score @s dg_st matches 1.. if score @s dg_dive matches 0 unless predicate kandy:tempest_grounded at @s run function kandy:dragoon/dive_start
scoreboard players operation @s dg_snk = #s dg_tmp
