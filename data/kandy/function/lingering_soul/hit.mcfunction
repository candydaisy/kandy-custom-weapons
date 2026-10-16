# Advancement reward: mark every entity the wielder just hurt with an echo that belongs to them
advancement revoke @s only kandy:hit/lingering_soul
execute unless score @s soul_pid matches 1.. store result score @s soul_pid run scoreboard players add #next soul_pid 1
function kandy:util/tag_victims
scoreboard players add @e[tag=kandy.victim] echo_stacks 1
scoreboard players set @e[tag=kandy.victim,scores={echo_stacks=5..}] echo_stacks 4
scoreboard players set @e[tag=kandy.victim] echo_timer 20
scoreboard players operation @e[tag=kandy.victim] echo_owner = @s soul_pid
tag @e[tag=kandy.victim] remove kandy.victim
