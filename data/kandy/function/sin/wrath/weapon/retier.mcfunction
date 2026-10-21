# function kandy:sin/wrath/weapon/retier {tier:2}: raise the held cleaver's tier, reset its progress, rewrite its lore
# Pre-revamp cleavers pick up the new sin keys here too (their old ability key is left alongside, harmlessly)
$item modify entity @s weapon.mainhand [{type:"minecraft:set_custom_data",tag:'{sin:"wrath",type:"weapon",tier:$(tier),deeds:0}'},{type:"minecraft:set_lore",mode:"replace_all",lore:[{text:"Hits build Heat (0–100%) and burn for +1 fire damage, +2 at 50%+.",color:"gray",italic:false},{text:"At 100%: Overdrive — Speed, and every swing erupts.",color:"gray",italic:false},{text:"Sneak + jump-attack: Magma Fissure tears the ground ahead.",color:"gold",italic:false},{text:"Overdrive ends in Overheat: slowed, no Fire Resistance for 4s.",color:"red",italic:false},{text:"Sin of Wrath · Tier $(tier)",color:"#e3261b",italic:false},{text:"Indulge it: Overdrives, then Overdrive kills, deepen the sin.",color:"dark_gray",italic:false}]}]
$title @s actionbar {text:"Your Wrath deepens: Tier $(tier)",color:"#e3261b",bold:true}
playsound minecraft:entity.blaze.death player @a[distance=..16] ~ ~ ~ 1 0.5
playsound minecraft:block.anvil.use player @s ~ ~ ~ 0.6 0.6
particle minecraft:lava ~ ~1 ~ 0.5 0.6 0.5 0 30
