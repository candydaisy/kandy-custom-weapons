# Run as a Bulwark holder: Pressure holds 5 charges (6 from tier 2)
execute if score @s bulw_t matches ..1 run scoreboard players set @s[scores={bulw_chg=6..}] bulw_chg 5
execute if score @s bulw_t matches 2.. run scoreboard players set @s[scores={bulw_chg=7..}] bulw_chg 6
