# Rising edge of Jump after at least 4 ticks in the air (not sneaking, gliding, swimming or riding).
# A normal jump's press arrives just after leaving the ground, so it must not count
execute if predicate kandy:tempest_grounded run scoreboard players set @s tem_air 0
execute unless predicate kandy:tempest_grounded run scoreboard players add @s tem_air 1
scoreboard players add @s tem_dcd 0
scoreboard players set @s tem_jump 0
execute if predicate kandy:tempest_jump run scoreboard players set @s tem_jump 1
execute if score @s tem_jump matches 1 if score @s tem_prev matches 0 if score @s tem_dcd matches 0 if score @s tem_air matches 4.. if predicate kandy:tempest_can_surge at @s run function kandy:tempest/surge
scoreboard players operation @s tem_prev = @s tem_jump
