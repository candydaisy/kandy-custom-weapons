# Show this kind's tally on the slayer's boss bar, then strike for damage x notches x 2%
scoreboard players operation @p[tag=kandy.tly_slayer] tly_kind = #k tly_tmp
scoreboard players set @p[tag=kandy.tly_slayer] tly_show 60
$scoreboard players operation #n tly_tmp = @p[tag=kandy.tly_slayer] tly_$(k)
execute unless score #n tly_tmp matches 1.. run return 0
scoreboard players operation #b tly_tmp = #d tly_tmp
# #d is in tenths, so tenths x notches x 0.002 = damage x notches x 2%
execute store result storage kandy:tally b.d float 0.002 run scoreboard players operation #b tly_tmp *= #n tly_tmp
function kandy:slayers_tally/strike with storage kandy:tally b
