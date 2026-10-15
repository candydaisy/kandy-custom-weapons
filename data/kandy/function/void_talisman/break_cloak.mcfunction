# Advancement reward: attacking or getting hurt while invisible breaks the cloak for 5s
advancement revoke @s only kandy:void_talisman/attack
advancement revoke @s only kandy:void_talisman/hurt
execute unless entity @s[tag=kandy.void_cloaked] run return 0
function kandy:void_talisman/uncloak
scoreboard players set @s void_cloak_cd 100
playsound minecraft:block.sculk_shrieker.break player @s ~ ~ ~ 0.8 1.2
