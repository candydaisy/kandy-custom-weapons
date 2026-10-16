# Remove every player's boss bars, then the HUD scoreboards
scoreboard players operation #i hud_v = #next hud_id
function kandy:hud/remove_loop
scoreboard players operation #i hud_v = #next hud_id
function kandy:hud/remove_old_loop
scoreboard objectives remove hud_id
scoreboard objectives remove hud_made
scoreboard objectives remove hud_v
data remove storage kandy:hud id
data remove storage kandy:hud rid
