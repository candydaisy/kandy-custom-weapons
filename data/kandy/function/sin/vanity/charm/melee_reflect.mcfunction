# Run as a Vanity set holder hit in melee: the attacker takes 15% of the damage as magic damage
execute store result score #now prm_tmp run data get entity @s Health 10
scoreboard players operation #dmg prm_tmp = @s prm_hp
scoreboard players operation #dmg prm_tmp -= #now prm_tmp
scoreboard players operation @s prm_hp = #now prm_tmp
execute if score #dmg prm_tmp matches ..6 run return 0
tag @s add kandy.prm_self
execute store result storage kandy:prism_mirror amt float 0.015 run scoreboard players get #dmg prm_tmp
execute on attacker unless entity @s[tag=kandy.prm_self] run function kandy:sin/vanity/charm/reflect with storage kandy:prism_mirror
tag @s remove kandy.prm_self
