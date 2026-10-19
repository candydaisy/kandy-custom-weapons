# Leap: a Jump press while sneaking. No on-ground check: the server often sees the jump after you've left the ground
scoreboard players add @s dg_dive 0
scoreboard players set #j dg_tmp 0
execute if predicate kandy:abyssal_bulwark_jump run scoreboard players set #j dg_tmp 1
execute if score #j dg_tmp matches 1 unless score @s dg_jmp matches 1 if score @s dg_cd matches 0 if score @s dg_st matches 0 if predicate kandy:sneaking at @s run function kandy:dragoon/leap
scoreboard players operation @s dg_jmp = #j dg_tmp

# Dive: Sneak held once the rise is over, so holding it dives at the top and pressing it again works too
execute if score @s dg_st matches 1.. if score @s dg_dive matches 0 if score @s dg_lev matches 0 if predicate kandy:sneaking unless predicate kandy:tempest_grounded at @s run function kandy:dragoon/dive_start
