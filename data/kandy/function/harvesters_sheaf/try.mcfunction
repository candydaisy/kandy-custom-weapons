# Run at a carrier: a random spot up to 5 blocks across, from a block below your feet to a block above
execute store result storage kandy:sheaf p.x int 1 run random value -5..5
execute store result storage kandy:sheaf p.y int 1 run random value -1..1
execute store result storage kandy:sheaf p.z int 1 run random value -5..5
function kandy:harvesters_sheaf/try_at with storage kandy:sheaf p
