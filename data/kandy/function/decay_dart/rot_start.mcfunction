# Health went up by #d tenths: take it back (absorption soaks this first, like any damage).
# dart_last stays put, so health is held at the pre-heal level
execute store result storage kandy:decay_dart amt.v double 0.1 run scoreboard players get #d dart_tmp
function kandy:decay_dart/rot with storage kandy:decay_dart amt
