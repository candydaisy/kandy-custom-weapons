# Old shared weapon/charm cooldowns, replaced by one per sin
scoreboard objectives remove kandy.cd
scoreboard objectives remove kandy.cdmax
scoreboard objectives remove kandy.ccd
scoreboard objectives remove kandy.ccdmax
scoreboard objectives add kandy.cd.wrath dummy "Wrath Weapon Cooldown"
scoreboard objectives add kandy.cdmax.wrath dummy "Wrath Weapon Cooldown Length"
scoreboard objectives add kandy.cd.pride dummy "Pride Weapon Cooldown"
scoreboard objectives add kandy.cdmax.pride dummy "Pride Weapon Cooldown Length"
scoreboard objectives add kandy.cd.greed dummy "Greed Weapon Cooldown"
scoreboard objectives add kandy.cdmax.greed dummy "Greed Weapon Cooldown Length"
scoreboard objectives add kandy.cd.lust dummy "Lust Weapon Cooldown"
scoreboard objectives add kandy.cdmax.lust dummy "Lust Weapon Cooldown Length"
scoreboard objectives add kandy.ccd.wrath dummy "Wrath Charm Cooldown"
scoreboard objectives add kandy.ccdmax.wrath dummy "Wrath Charm Cooldown Length"
scoreboard objectives add kandy.ccd.pride dummy "Pride Charm Cooldown"
scoreboard objectives add kandy.ccdmax.pride dummy "Pride Charm Cooldown Length"
scoreboard objectives add kandy.wt dummy "Sin Weapon Tier"
scoreboard objectives add kandy.deed dummy "Sin Deeds"
scoreboard objectives add kandy.n dummy "Sin Charms Carried"
function kandy:sin/wrath/weapon/setup
function kandy:sin/wrath/charm/setup
function kandy:sin/pride/weapon/setup
function kandy:sin/pride/charm/setup
function kandy:sin/greed/weapon/setup
function kandy:sin/greed/charm/setup
function kandy:sin/lust/weapon/setup
function kandy:sin/lust/charm/setup
