# Run as a player holding a sin weapon, after sin/tier. The sin deepens with use, counted on the weapon itself:
# function kandy:sin/deed {sin:"wrath",need:10,what:"Overdrives",name:"Wrath",color:"#e3261b"}
# At $(need) deeds the weapon rises one tier through its sin's retier function, which also resets the count
# The weapon is read from the main hand, or from the offhand when that's where this sin's weapon is (shields)
data modify storage kandy:sin up.slot set value "weapon.mainhand"
$execute unless items entity @s weapon.mainhand *[custom_data~{sin:"$(sin)"}] if items entity @s weapon.offhand *[custom_data~{sin:"$(sin)"}] run data modify storage kandy:sin up.slot set value "weapon.offhand"
function kandy:util/held
execute if data storage kandy:sin up{slot:"weapon.offhand"} run data modify storage kandy:held item set from entity @s equipment.offhand
execute store result score @s kandy.deed run data get storage kandy:held item.components."minecraft:custom_data".deeds
scoreboard players add @s kandy.deed 1
scoreboard players operation #up kandy.deed = @s kandy.wt
scoreboard players add #up kandy.deed 1
execute store result storage kandy:sin up.tier int 1 run scoreboard players get #up kandy.deed
$execute if score @s kandy.deed matches $(need).. run return run function kandy:sin/$(sin)/weapon/retier with storage kandy:sin up
# Worlds that ran the first Wrath version hold a plain number here, which would block the write
data modify storage kandy:sin deeds set value {}
execute store result storage kandy:sin deeds.deeds int 1 run scoreboard players get @s kandy.deed
data modify storage kandy:sin deeds.slot set from storage kandy:sin up.slot
function kandy:sin/set_deeds with storage kandy:sin deeds
$title @s actionbar [{text:"$(name) deepens: ",color:"$(color)"},{score:{name:"@s",objective:"kandy.deed"},color:"white"},{text:"/$(need) $(what)",color:"white"}]
