# Advancement reward: a melee hit landed on this player. Brittle: +1 damage
advancement revoke @s only kandy:prism_mirror/melee
execute unless entity @s[tag=kandy.charm.prism_mirror] run return 0
damage @s 1 kandy:prism_mirror_brittle
