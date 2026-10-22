function kandy:sin/holders
scoreboard players add @a kandy.cd.wrath 0
scoreboard players add @a kandy.cd.pride 0
scoreboard players add @a kandy.cd.greed 0
scoreboard players add @a kandy.cd.lust 0
scoreboard players add @a kandy.ccd.wrath 0
scoreboard players add @a kandy.ccd.pride 0

function kandy:sin/wrath/weapon/tick
function kandy:sin/wrath/charm/tick
function kandy:sin/pride/weapon/tick
function kandy:sin/pride/charm/tick
function kandy:sin/greed/weapon/tick
function kandy:sin/greed/charm/tick
function kandy:sin/lust/weapon/tick
function kandy:sin/lust/charm/tick

scoreboard players remove @a[scores={kandy.cd.wrath=1..}] kandy.cd.wrath 1
scoreboard players remove @a[scores={kandy.cd.pride=1..}] kandy.cd.pride 1
scoreboard players remove @a[scores={kandy.cd.greed=1..}] kandy.cd.greed 1
scoreboard players remove @a[scores={kandy.cd.lust=1..}] kandy.cd.lust 1
scoreboard players remove @a[scores={kandy.ccd.wrath=1..}] kandy.ccd.wrath 1
scoreboard players remove @a[scores={kandy.ccd.pride=1..}] kandy.ccd.pride 1
