# Advancement reward: a projectile hit this player
advancement revoke @s only kandy:prism_mirror/projectile
execute unless entity @s[tag=kandy.charm.prism_mirror] run return 0
scoreboard players add @s prm_cd 0

# Damage taken, in tenths of HP, from the health remembered at the start of the tick
scoreboard players set #now prm_tmp 0
execute store result score #now prm_tmp run data get entity @s Health 10
scoreboard players operation #dmg prm_tmp = @s prm_hp
scoreboard players operation #dmg prm_tmp -= #now prm_tmp
scoreboard players operation @s prm_hp = #now prm_tmp
execute if score #dmg prm_tmp matches ..0 run return 0

# Reflection: the shooter takes 30% of it as magic damage (not your own projectiles)
tag @s add kandy.prm_self
execute store result storage kandy:prism_mirror amt float 0.03 run scoreboard players get #dmg prm_tmp
execute if score #dmg prm_tmp matches 4.. on attacker unless entity @s[tag=kandy.prm_self] run function kandy:prism_mirror/reflect with storage kandy:prism_mirror
tag @s remove kandy.prm_self

# Glancing Facet: when primed, the hit is healed straight back
execute if score @s prm_cd matches 0 run function kandy:prism_mirror/glance
