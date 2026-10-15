# Watch for a double-tap of Jump (two presses within 7 ticks) while in water
scoreboard players add @s pearl_cd 0
scoreboard players add @s pearl_tap 0
scoreboard players add @s pearl_prev 0
scoreboard players set @s pearl_jump 0
execute if predicate kandy:abyssal_pearl_jump run scoreboard players set @s pearl_jump 1

execute if score @s pearl_jump matches 1 if score @s pearl_prev matches 0 run function kandy:abyssal_pearl/tap
scoreboard players operation @s pearl_prev = @s pearl_jump
