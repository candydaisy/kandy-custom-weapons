# UUID int i -> its 4 bytes, high first (scoreboard / and % floor, so negative ints come out as two's complement)
$execute store result score #u1 plc_tmp run data get storage kandy:plunder u.i[$(i)]
scoreboard players operation #u3 plc_tmp = #u1 plc_tmp
scoreboard players operation #u3 plc_tmp %= #65536 plc_tmp
scoreboard players operation #u1 plc_tmp /= #65536 plc_tmp
scoreboard players operation #u1 plc_tmp %= #65536 plc_tmp
scoreboard players operation #u2 plc_tmp = #u1 plc_tmp
scoreboard players operation #u2 plc_tmp %= #256 plc_tmp
scoreboard players operation #u1 plc_tmp /= #256 plc_tmp
scoreboard players operation #u4 plc_tmp = #u3 plc_tmp
scoreboard players operation #u4 plc_tmp %= #256 plc_tmp
scoreboard players operation #u3 plc_tmp /= #256 plc_tmp
$data modify storage kandy:plunder u.b.i set value $(i)
execute store result storage kandy:plunder u.b.a int 1 run scoreboard players get #u1 plc_tmp
execute store result storage kandy:plunder u.b.b int 1 run scoreboard players get #u2 plc_tmp
execute store result storage kandy:plunder u.b.c int 1 run scoreboard players get #u3 plc_tmp
execute store result storage kandy:plunder u.b.d int 1 run scoreboard players get #u4 plc_tmp
function kandy:sin/greed/charm/uuid_hex with storage kandy:plunder u.b
