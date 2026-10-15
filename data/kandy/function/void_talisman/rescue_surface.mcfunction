# spreadplayers lands on the highest safe block (no lava or fire); the Nether needs a ceiling under the bedrock roof
execute if dimension minecraft:the_nether store success score #ok void_dim run spreadplayers ~ ~ 0 16 under 120 false @s
execute unless dimension minecraft:the_nether store success score #ok void_dim run spreadplayers ~ ~ 0 32 false @s
# The End has empty columns everywhere; fall back to the main island
execute if score #ok void_dim matches 0 if dimension minecraft:the_end store success score #ok void_dim run spreadplayers 0 0 0 48 false @s
execute if score #ok void_dim matches 1 run tag @s add kandy.void_moved
