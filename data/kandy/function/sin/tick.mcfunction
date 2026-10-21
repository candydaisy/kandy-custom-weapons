function kandy:sin/holders
scoreboard players add @a kandy.cd 0
scoreboard players add @a kandy.ccd 0

function kandy:sin/wrath/weapon/tick
function kandy:sin/wrath/charm/tick
function kandy:sin/pride/weapon/tick
function kandy:sin/pride/charm/tick

scoreboard players remove @a[scores={kandy.cd=1..}] kandy.cd 1
scoreboard players remove @a[scores={kandy.ccd=1..}] kandy.ccd 1
