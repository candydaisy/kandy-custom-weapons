$bossbar add kandy:hud_$(id)_bulw_pressure ""
scoreboard players add @s bulw_chg 0
$bossbar set kandy:hud_$(id)_bulw_pressure color blue
$bossbar set kandy:hud_$(id)_bulw_pressure max 5
$execute store result bossbar kandy:hud_$(id)_bulw_pressure value run scoreboard players get @s bulw_chg
$bossbar set kandy:hud_$(id)_bulw_pressure name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Pressure ","color":"white"},{"score":{"name":"@s","objective":"bulw_chg"},"color":"white"},{"text":"/5","color":"white"}]
$bossbar set kandy:hud_$(id)_bulw_pressure players @s
$bossbar set kandy:hud_$(id)_bulw_pressure visible true
