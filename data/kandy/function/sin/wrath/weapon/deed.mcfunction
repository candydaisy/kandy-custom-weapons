# Run as a player holding the cleaver, after sin/tier. The sin deepens with use, counted on the cleaver itself:
# tier 1 -> 2 after 10 Overdrives, tier 2 -> 3 after 30 kills made during Overdrive
execute store result score @s pyro_tmp run data get entity @s SelectedItem.components."minecraft:custom_data".deeds
scoreboard players add @s pyro_tmp 1
execute if score @s kandy.wt matches 1 if score @s pyro_tmp matches 10.. run return run function kandy:sin/wrath/weapon/retier {tier:2}
execute if score @s kandy.wt matches 2 if score @s pyro_tmp matches 30.. run return run function kandy:sin/wrath/weapon/retier {tier:3}
execute store result storage kandy:sin deeds int 1 run scoreboard players get @s pyro_tmp
function kandy:sin/wrath/weapon/set_deeds with storage kandy:sin
execute if score @s kandy.wt matches 1 run title @s actionbar [{text:"Wrath deepens: ",color:"#e3261b"},{score:{name:"@s",objective:"pyro_tmp"},color:"white"},{text:"/10 Overdrives",color:"white"}]
execute if score @s kandy.wt matches 2 run title @s actionbar [{text:"Wrath deepens: ",color:"#e3261b"},{score:{name:"@s",objective:"pyro_tmp"},color:"white"},{text:"/30 Overdrive kills",color:"white"}]
