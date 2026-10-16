scoreboard objectives add hud_id dummy
scoreboard objectives add hud_v dummy
scoreboard players set #20 hud_v 20
scoreboard players set #10 hud_v 10
scoreboard players set #6 hud_v 6
scoreboard players set #5 hud_v 5
scoreboard players set #4 hud_v 4
scoreboard players set #3 hud_v 3
# Clear out the single boss bar each player had in the previous HUD version
scoreboard players operation #i hud_v = #next hud_id
function kandy:hud/remove_old_loop
