# Advancement reward: the player took a hit. Carrying Swiftwind, that knocks 250 off Momentum
advancement revoke @s only kandy:swiftwind/hurt
execute if entity @s[tag=kandy.inv.swiftwind] run scoreboard players remove @s sprint 250
scoreboard players set @s[scores={sprint=..-1}] sprint 0
