# function kandy:sin/envy/weapon/steal {e:"speed"}: run as the target, move that effect (same level) to kandy.envy_thief
execute if score #n envy_tmp >= #max envy_tmp run return 0
$execute unless data entity @s active_effects[{id:"minecraft:$(e)"}] run return 0
$data modify storage kandy:envy fx.e set value "$(e)"
$execute store result storage kandy:envy fx.amp int 1 run data get entity @s active_effects[{id:"minecraft:$(e)"}].amplifier
$effect clear @s minecraft:$(e)
execute as @p[tag=kandy.envy_thief] run function kandy:sin/envy/weapon/gain with storage kandy:envy fx
scoreboard players add #n envy_tmp 1
