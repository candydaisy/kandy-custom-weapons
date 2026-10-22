# Advancement reward: a melee hit landed on this player. Brittle: +1 damage
advancement revoke @s only kandy:sin/vanity/melee
execute unless entity @s[tag=kandy.vanity.c] run return 0
# Unblemished (set bonus): the Mirror also throws back 15% of melee damage (measured like projectile hits)
execute if entity @s[tag=kandy.vanity.set] run function kandy:sin/vanity/charm/melee_reflect
damage @s 1 kandy:prism_mirror_brittle
