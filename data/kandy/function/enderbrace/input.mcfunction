# Rising edge of Sneak; two presses within 7 ticks blink
scoreboard players add @s ebr_cd 0
scoreboard players add @s ebr_tap 0
scoreboard players set @s ebr_snk 0
execute if predicate kandy:sneaking run scoreboard players set @s ebr_snk 1
execute if score @s ebr_snk matches 1 unless score @s ebr_prev matches 1 run function kandy:enderbrace/tap
scoreboard players operation @s ebr_prev = @s ebr_snk
