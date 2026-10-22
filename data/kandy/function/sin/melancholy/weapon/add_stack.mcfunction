# Run as and at a target: +1 Hypothermia stack, Frozen Solid at 5
execute if score @s frost_frozen matches 1.. run return 0
scoreboard players add @s frost_stacks 1
scoreboard players set @s frost_timer 120
# Just thawed targets can't be frozen again for 5s
execute if score @s frost_imm matches 1.. if score @s frost_stacks matches 5.. run scoreboard players set @s frost_stacks 4
execute if score @s frost_stacks matches 5.. run return run function kandy:sin/melancholy/weapon/freeze
function kandy:sin/melancholy/weapon/apply_slow
particle minecraft:snowflake ~ ~1 ~ 0.3 0.5 0.3 0.02 6
playsound minecraft:block.powder_snow.step hostile @a[distance=..16] ~ ~ ~ 1 1.2
