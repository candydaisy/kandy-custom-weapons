$bossbar add kandy:hud_$(id)_gravity ""
scoreboard players set #bar hud_v 1
$bossbar set kandy:hud_$(id)_gravity color purple
$bossbar set kandy:hud_$(id)_gravity max 1
$execute store result bossbar kandy:hud_$(id)_gravity value run scoreboard players get #bar hud_v
$execute unless predicate kandy:sneaking run bossbar set kandy:hud_$(id)_gravity name [{"text":"World Breaker","color":"#7b7bec"},{"text":" - Sneak to pull nearby","color":"white"}]
$execute if predicate kandy:sneaking run bossbar set kandy:hud_$(id)_gravity name [{"text":"World Breaker","color":"#7b7bec"},{"text":" - Pulling","color":"white"}]
$bossbar set kandy:hud_$(id)_gravity players @s
$bossbar set kandy:hud_$(id)_gravity visible true
