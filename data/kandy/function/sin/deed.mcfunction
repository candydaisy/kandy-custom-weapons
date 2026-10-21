# Run as a player holding a sin weapon, after sin/tier. The sin deepens with use, counted on the weapon itself:
# function kandy:sin/deed {sin:"wrath",need:10,what:"Overdrives",name:"Wrath",color:"#e3261b"}
# At $(need) deeds the weapon rises one tier through its sin's retier function, which also resets the count
function kandy:util/held
execute store result score @s kandy.deed run data get storage kandy:held item.components."minecraft:custom_data".deeds
scoreboard players add @s kandy.deed 1
scoreboard players operation #up kandy.deed = @s kandy.wt
scoreboard players add #up kandy.deed 1
execute store result storage kandy:sin up.tier int 1 run scoreboard players get #up kandy.deed
$execute if score @s kandy.deed matches $(need).. run return run function kandy:sin/$(sin)/weapon/retier with storage kandy:sin up
# Worlds that ran the first Wrath version hold a plain number here, which would block the write
data modify storage kandy:sin deeds set value {}
execute store result storage kandy:sin deeds.deeds int 1 run scoreboard players get @s kandy.deed
function kandy:sin/set_deeds with storage kandy:sin deeds
$title @s actionbar [{text:"$(name) deepens: ",color:"$(color)"},{score:{name:"@s",objective:"kandy.deed"},color:"white"},{text:"/$(need) $(what)",color:"white"}]
