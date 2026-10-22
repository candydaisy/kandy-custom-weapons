# function kandy:sin/sloth/weapon/retier {tier:2,slot:"weapon.offhand"}: raise the held shield's tier, reset its progress, rewrite its lore
$item modify entity @s $(slot) [{type:"minecraft:set_custom_data",tag:'{sin:"sloth",type:"weapon",tier:$(tier),deeds:0}'},{type:"minecraft:set_lore",mode:"replace_all",lore:[{text:"Blocking stores Abyssal Pressure (max 5) and brief Resistance.",color:"gray",italic:false},{text:"Parry: tap Sneak just before a blocked melee hit to stagger the attacker.",color:"gray",italic:false},{text:"Sneak + Jump: Tidal Surge spends all Pressure in a crushing wave (8s cooldown).",color:"aqua",italic:false},{text:"Heavy: -10% speed while held. Tidal Surge's recoil slows you.",color:"red",italic:false},{text:"Sin of Sloth · Tier $(tier)",color:"#7a9bb5",italic:false},{text:"Indulge it: Parries, then full-Pressure Surges, deepen the sin.",color:"dark_gray",italic:false}]}]
$title @s actionbar {text:"Your Sloth deepens: Tier $(tier)",color:"#7a9bb5",bold:true}
playsound minecraft:block.conduit.ambient player @a[distance=..16] ~ ~ ~ 1 0.6
playsound minecraft:block.anvil.use player @s ~ ~ ~ 0.6 0.6
particle minecraft:nautilus ~ ~1 ~ 0.5 0.8 0.5 0.5 40
