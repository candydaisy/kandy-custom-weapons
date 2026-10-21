# Advancement reward: the player took a hit. Carrying the blade, that knocks 250 off Desire
advancement revoke @s only kandy:sin/lust/hurt
execute if entity @s[tag=kandy.lust.wi] run scoreboard players remove @s sprint 250
scoreboard players set @s[scores={sprint=..-1}] sprint 0
