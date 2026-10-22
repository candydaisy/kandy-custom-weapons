$bossbar add kandy:hud_$(id)_bulw_pressure ""
scoreboard players add @s bulw_chg 0
# 5 charges, 6 from tier 2
scoreboard players set #m hud_v 5
execute if score @s bulw_t matches 2.. run scoreboard players set #m hud_v 6
$bossbar set kandy:hud_$(id)_bulw_pressure color blue
$execute store result bossbar kandy:hud_$(id)_bulw_pressure max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_bulw_pressure value run scoreboard players get @s bulw_chg
$bossbar set kandy:hud_$(id)_bulw_pressure name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Pressure ","color":"white"},{"score":{"name":"@s","objective":"bulw_chg"},"color":"white"},{"text":"/","color":"white"},{"score":{"name":"#m","objective":"hud_v"},"color":"white"}]
$bossbar set kandy:hud_$(id)_bulw_pressure players @s
$bossbar set kandy:hud_$(id)_bulw_pressure visible true
