# Run as and at a diving player: heavy gravity pulls you down; slam once you touch ground
execute if predicate kandy:tempest_grounded run return run function kandy:sin/pride/weapon/land
execute unless block ~ ~-0.1 ~ #kandy:passable run return run function kandy:sin/pride/weapon/land
particle minecraft:dragon_breath ~ ~1 ~ 0.2 0.4 0.2 0 2
