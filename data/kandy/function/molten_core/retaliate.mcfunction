# Advancement reward: something hit this player in melee
advancement revoke @s only kandy:molten_core/retaliate
execute unless entity @s[tag=kandy.charm.molten_core] run return 0
execute if score @s molt_cd matches 1.. run return 0
# Another carrier's retaliation counts as a melee hit too; don't bounce it back
execute on attacker if entity @s[tag=kandy.molt_busy] run return 0

scoreboard players set @s molt_cd 20
tag @s add kandy.molt_busy
execute on attacker at @s run function kandy:molten_core/burn
tag @s remove kandy.molt_busy
playsound minecraft:block.fire.extinguish player @a[distance=..16] ~ ~ ~ 0.8 0.9
particle minecraft:large_smoke ~ ~1 ~ 0.3 0.4 0.3 0.02 6
