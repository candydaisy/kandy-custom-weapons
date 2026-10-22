# Run as and at a player starting a right-click with the dagger
execute if score @s kandy.cd.gluttony matches 1.. run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.5
function kandy:sin/active {sin:"gluttony"}
