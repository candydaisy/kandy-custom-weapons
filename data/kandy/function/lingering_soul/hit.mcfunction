# Advancement reward: mark every entity the wielder just hurt with an echo
advancement revoke @s only kandy:hit/lingering_soul
function kandy:util/tag_victims
scoreboard players add @e[tag=kandy.victim] echo_stacks 1
scoreboard players set @e[tag=kandy.victim,scores={echo_stacks=4..}] echo_stacks 3
scoreboard players set @e[tag=kandy.victim] echo_timer 20
tag @e[tag=kandy.victim] remove kandy.victim
