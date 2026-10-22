# Run as an echoed creature: up to 4 echoes (5 from tier 2)
execute if score @s echo_tier matches ..1 run scoreboard players set @s[scores={echo_stacks=5..}] echo_stacks 4
execute if score @s echo_tier matches 2.. run scoreboard players set @s[scores={echo_stacks=6..}] echo_stacks 5
