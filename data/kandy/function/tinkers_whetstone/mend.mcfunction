# Run as a carrier holding a damaged, breakable item: take exactly 1 point off its damage
function kandy:util/held
execute store result score #d tnk_tmp run data get storage kandy:held item.components."minecraft:damage"
scoreboard players remove #d tnk_tmp 1
execute store result storage kandy:tinker d int 1 run scoreboard players get #d tnk_tmp
function kandy:tinkers_whetstone/mend_apply with storage kandy:tinker
