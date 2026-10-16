$bossbar set kandy:hud_$(id) color purple
$bossbar set kandy:hud_$(id) max 1
$bossbar set kandy:hud_$(id) value 1
$execute unless predicate kandy:sneaking run bossbar set kandy:hud_$(id) name [{"text":"World Breaker","color":"#7b7bec"},{"text":" - Sneak to pull nearby","color":"white"}]
$execute if predicate kandy:sneaking run bossbar set kandy:hud_$(id) name [{"text":"World Breaker","color":"#7b7bec"},{"text":" - Pulling","color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
