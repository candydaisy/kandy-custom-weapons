function kandy:sin/holders
scoreboard players add @a kandy.cd.wrath 0
scoreboard players add @a kandy.cd.pride 0
scoreboard players add @a kandy.cd.greed 0
scoreboard players add @a kandy.cd.lust 0
scoreboard players add @a kandy.cd.envy 0
scoreboard players add @a kandy.cd.gluttony 0
scoreboard players add @a kandy.cd.sloth 0
scoreboard players add @a kandy.cd.melancholy 0
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
function kandy:sin/envy/weapon/tick
function kandy:sin/envy/charm/tick
function kandy:sin/gluttony/weapon/tick
function kandy:sin/gluttony/charm/tick
function kandy:sin/sloth/weapon/tick
function kandy:sin/sloth/charm/tick
function kandy:sin/melancholy/weapon/tick
function kandy:sin/melancholy/charm/tick

scoreboard players remove @a[scores={kandy.cd.wrath=1..}] kandy.cd.wrath 1
scoreboard players remove @a[scores={kandy.cd.pride=1..}] kandy.cd.pride 1
scoreboard players remove @a[scores={kandy.cd.greed=1..}] kandy.cd.greed 1
scoreboard players remove @a[scores={kandy.cd.lust=1..}] kandy.cd.lust 1
scoreboard players remove @a[scores={kandy.cd.envy=1..}] kandy.cd.envy 1
scoreboard players remove @a[scores={kandy.cd.gluttony=1..}] kandy.cd.gluttony 1
scoreboard players remove @a[scores={kandy.cd.sloth=1..}] kandy.cd.sloth 1
scoreboard players remove @a[scores={kandy.cd.melancholy=1..}] kandy.cd.melancholy 1
scoreboard players remove @a[scores={kandy.ccd.wrath=1..}] kandy.ccd.wrath 1
scoreboard players remove @a[scores={kandy.ccd.pride=1..}] kandy.ccd.pride 1
