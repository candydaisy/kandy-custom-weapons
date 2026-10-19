execute as @a[scores={kandy_team=1..}] run function kandy:team/join
execute as @a[scores={kandy_team=..-1}] run function kandy:team/leave
scoreboard players enable @a kandy_team
