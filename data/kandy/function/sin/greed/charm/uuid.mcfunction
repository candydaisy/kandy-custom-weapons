# Run as an entity: storage kandy:plunder u.s = its UUID as a hyphenated string
data modify storage kandy:plunder u.i set from entity @s UUID
function kandy:sin/greed/charm/uuid_int {i:0}
function kandy:sin/greed/charm/uuid_int {i:1}
function kandy:sin/greed/charm/uuid_int {i:2}
function kandy:sin/greed/charm/uuid_int {i:3}
function kandy:sin/greed/charm/uuid_join with storage kandy:plunder u.h
