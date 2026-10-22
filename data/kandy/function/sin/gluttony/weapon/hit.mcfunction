# Advancement reward: mark every creature the wielder just hurt with an echo that belongs to them
advancement revoke @s only kandy:sin/gluttony/hit
execute unless score @s soul_pid matches 1.. store result score @s soul_pid run scoreboard players add #next soul_pid 1
function kandy:sin/tier
function kandy:util/tag_victims
scoreboard players add @e[tag=kandy.victim] echo_stacks 1
scoreboard players set @e[tag=kandy.victim] echo_timer 20
scoreboard players operation @e[tag=kandy.victim] echo_owner = @s soul_pid
# The echo remembers the dagger's tier, even if you put it away
scoreboard players operation @e[tag=kandy.victim] echo_tier = @s kandy.wt
execute as @e[tag=kandy.victim] run function kandy:sin/gluttony/weapon/cap
tag @e[tag=kandy.victim] remove kandy.victim
