# Macro, run as and at a player: tag teammates within $(r) blocks as kandy.ally (never yourself; no team means no allies)
scoreboard players operation #team kt_tmp = @s kt_id
execute unless score #team kt_tmp matches 1.. run return 0
tag @s add kandy.team_self
$execute as @a[distance=..$(r),tag=!kandy.team_self] if score @s kt_id = #team kt_tmp run tag @s add kandy.ally
tag @s remove kandy.team_self
