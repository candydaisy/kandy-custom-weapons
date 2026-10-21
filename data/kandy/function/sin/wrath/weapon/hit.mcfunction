# Advancement reward: burn whatever the wielder hit and feed the cleaver heat
advancement revoke @s only kandy:sin/wrath/hit
# Our own bonus damage counts as a hit too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.pyro_busy] run return 0
tag @s add kandy.pyro_busy
tag @s add kandy.pyro_wielder
function kandy:sin/tier
function kandy:util/tag_victims

# Overdrive: the swing cleaves everything in front of you
execute if score @s pyro_od matches 1.. rotated ~ 0 positioned ^ ^ ^1.5 run tag @e[distance=..2.5,type=!#kandy:unpullable,tag=!kandy.pyro_wielder,tag=!kandy.immune] add kandy.victim

# Bonus fire damage scales with the heat built up before this hit
execute if score @s pyro_od matches 1.. as @e[tag=kandy.victim] run damage @s 3 kandy:magma by @p[tag=kandy.pyro_wielder]
execute if score @s pyro_od matches 0 if score @s pyro_heat matches 50.. as @e[tag=kandy.victim] run damage @s 2 kandy:magma by @p[tag=kandy.pyro_wielder]
execute if score @s pyro_od matches 0 if score @s pyro_heat matches ..49 as @e[tag=kandy.victim] run damage @s 1 kandy:magma by @p[tag=kandy.pyro_wielder]
execute as @e[tag=kandy.victim,type=!player] run data merge entity @s {Fire:80s}

# Overdrive: every victim erupts, burning the floor and blasting anything close by (4 damage, 5 from tier 2)
execute if score @s pyro_od matches 1.. as @e[tag=kandy.victim] at @s run function kandy:sin/wrath/weapon/erupt
# Tier 3: each eruption chains once to the nearest other creature within 4 blocks
execute if score @s pyro_od matches 1.. if score @s kandy.wt matches 3 as @e[tag=kandy.victim] at @s as @e[distance=0.1..4,type=!#kandy:unpullable,tag=!kandy.victim,tag=!kandy.pyro_wielder,tag=!kandy.immune,sort=nearest,limit=1] run tag @s add kandy.pyro_chain
execute as @e[tag=kandy.pyro_chain] at @s run function kandy:sin/wrath/weapon/erupt
tag @e[tag=kandy.pyro_chain] remove kandy.pyro_chain
execute if score @s kandy.wt matches 1 as @e[tag=kandy.pyro_blast] run damage @s 4 kandy:magma by @p[tag=kandy.pyro_wielder]
execute if score @s kandy.wt matches 2.. as @e[tag=kandy.pyro_blast] run damage @s 5 kandy:magma by @p[tag=kandy.pyro_wielder]
tag @e[tag=kandy.pyro_blast] remove kandy.pyro_blast
tag @e[tag=kandy.victim] remove kandy.victim

# +10% heat per hit, Overdrive at 100%
execute if score @s pyro_od matches 0 run scoreboard players add @s pyro_heat 10
execute if score @s pyro_od matches 0 if score @s pyro_heat matches 100.. run function kandy:sin/wrath/weapon/overdrive

# Magma Fissure: sneaking jump-attack
execute if entity @s[nbt={OnGround:0b}] if predicate kandy:sneaking run function kandy:sin/active {sin:"wrath"}

tag @s remove kandy.pyro_wielder
tag @s remove kandy.pyro_busy
