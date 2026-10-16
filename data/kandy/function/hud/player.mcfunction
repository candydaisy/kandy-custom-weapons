execute store result storage kandy:hud id int 1 run scoreboard players get @s hud_id
execute unless score @s hud_made matches 1 run function kandy:hud/create with storage kandy:hud
execute if entity @s[tag=kandy.main.swiftwind] run return run function kandy:hud/swiftwind with storage kandy:hud
execute if entity @s[tag=kandy.main.lingering_soul] run return run function kandy:hud/lingering_soul with storage kandy:hud
execute if entity @s[tag=kandy.main.bloodpact] run return run function kandy:hud/bloodpact with storage kandy:hud
execute if entity @s[tag=kandy.main.worldbreaker] run return run function kandy:hud/worldbreaker with storage kandy:hud
execute if entity @s[tag=kandy.main.pyroclast] run return run function kandy:hud/pyroclast with storage kandy:hud
execute if entity @s[tag=kandy.main.tempest] run return run function kandy:hud/tempest with storage kandy:hud
execute if entity @s[tag=kandy.main.frostveil] run return run function kandy:hud/frostveil with storage kandy:hud
execute if entity @s[tag=kandy.main.eclipse] run return run function kandy:hud/eclipse with storage kandy:hud
execute if entity @s[tag=kandy.main.chronos] run return run function kandy:hud/chronos with storage kandy:hud
execute if entity @s[tag=kandy.main.abyssal] run return run function kandy:hud/abyssal with storage kandy:hud
execute if entity @s[tag=kandy.off.abyssal] run return run function kandy:hud/abyssal with storage kandy:hud
function kandy:hud/hide with storage kandy:hud
