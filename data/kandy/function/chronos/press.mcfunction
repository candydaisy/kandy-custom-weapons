# Run as and at a player on the first tick of a right-click with the stiletto
execute if score @s chr_anc matches 1.. if predicate kandy:sneaking run return run function kandy:chronos/rewind
execute if score @s chr_anc matches 1.. run return 0
execute if score @s chr_cd matches 1.. run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.5
function kandy:chronos/anchor
