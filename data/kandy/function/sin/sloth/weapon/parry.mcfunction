# Advancement reward: a blocked melee hit. It's a Parry if Sneak was tapped just before it landed
advancement revoke @s only kandy:sin/sloth/parry
execute unless score @s bulw_brace matches 1.. run return 0
scoreboard players set @s bulw_brace 0
scoreboard players set @s bulw_pcd 80
# +2 here and +1 from the block itself = 3 charges
scoreboard players add @s bulw_chg 2
function kandy:sin/sloth/weapon/cap
scoreboard players operation #wt bulw_tmp = @s bulw_t
scoreboard players set @s bulw_decay 200
execute on attacker at @s run function kandy:sin/sloth/weapon/stagger
particle minecraft:splash ~ ~1.2 ~ 0.6 0.6 0.6 0.2 40
particle minecraft:nautilus ~ ~1.2 ~ 0.6 0.6 0.6 0.5 30
playsound minecraft:block.anvil.land player @a[distance=..16] ~ ~ ~ 0.7 2
playsound minecraft:item.shield.block player @a[distance=..16] ~ ~ ~ 1 0.5
# Parries deepen a tier 1 shield (tier 2 after 15)
scoreboard players operation @s kandy.wt = @s bulw_t
execute if score @s bulw_t matches 1 run function kandy:sin/deed {sin:"sloth",need:15,what:"Parries",name:"Sloth",color:"#7a9bb5"}
