# The 6s anchor window ran out without a rewind
function kandy:sin/vanity/weapon/clear_anchor
scoreboard players set @s kandy.cd.vanity 400
scoreboard players set @s kandy.cdmax.vanity 400
playsound minecraft:block.amethyst_block.break player @s ~ ~ ~ 0.8 1.2
