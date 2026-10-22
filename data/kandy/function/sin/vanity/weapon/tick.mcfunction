# Right-click: chr_use is set by the using_item advancement; only the first tick of a press counts
execute as @a[tag=kandy.vanity.w,scores={chr_use=1}] unless score @s chr_held matches 1 at @s run function kandy:sin/vanity/weapon/press
scoreboard players add @a chr_use 0
execute as @a run scoreboard players operation @s chr_held = @s chr_use
scoreboard players set @a[scores={chr_use=1..}] chr_use 0

# Dying drops the anchor
execute as @a[scores={chr_death=1..}] run function kandy:sin/vanity/weapon/clear_anchor
scoreboard players set @a[scores={chr_death=1..}] chr_anc 0
scoreboard players set @a[scores={chr_death=1..}] chr_death 0

# Anchor window and rewind cooldown
execute as @a[scores={chr_anc=1}] at @s run function kandy:sin/vanity/weapon/expire
scoreboard players remove @a[scores={chr_anc=1..}] chr_anc 1
# Rewind ready again (kandy.cd.vanity counts down in sin/tick, right after this)
execute as @a[scores={kandy.cd.vanity=1},tag=kandy.vanity.w] at @s run playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 1 1.8
scoreboard players remove @e[type=minecraft:marker,tag=kandy.chr_anchor] chr_anc 1
kill @e[type=minecraft:marker,tag=kandy.chr_anchor,scores={chr_anc=..0}]

# Paradox wounds open when their 3s window closes
scoreboard players remove @e[scores={chr_pt=1..}] chr_pt 1
execute as @e[scores={chr_pt=0,chr_ps=1..}] at @s run function kandy:sin/vanity/weapon/paradox
scoreboard players reset @e[scores={chr_pt=0}] chr_pt

# Chrono Stasis
scoreboard players remove @e[scores={chr_st=1..}] chr_st 1
execute as @e[tag=kandy.chr_frozen,scores={chr_st=0}] at @s run function kandy:sin/vanity/weapon/unfreeze
scoreboard players remove @e[scores={chr_scd=1..}] chr_scd 1

function kandy:sin/vanity/weapon/visual

# Flawless: holding the stiletto at full health, +2 damage (+3 from tier 2) and +10% speed in all.
# Blemished (vain_bl) turns it off for a while after you're hurt from full health
scoreboard players remove @a[scores={vain_bl=1..}] vain_bl 1
execute as @a[scores={vain_bl=1},tag=kandy.vanity.w] at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1 1.6
tag @a remove kandy.vain_full
execute as @a[tag=kandy.vanity.wi] store result score @s vain_max run attribute @s minecraft:max_health get
execute as @a[tag=kandy.vanity.wi] if score @s chr_hp >= @s vain_max run tag @s add kandy.vain_full
execute as @a[tag=kandy.vanity.w,tag=kandy.vain_full,tag=!kandy.vain_on] unless score @s vain_bl matches 1.. at @s run function kandy:sin/vanity/weapon/flawless
execute as @a[tag=kandy.vain_on] unless entity @s[tag=kandy.vanity.w,tag=kandy.vain_full] run function kandy:sin/vanity/weapon/unflawless
execute as @a[tag=kandy.vain_on,scores={vain_bl=1..}] run function kandy:sin/vanity/weapon/unflawless
execute as @a[tag=kandy.vain_on] at @s run particle minecraft:dust{color:[1.0,0.85,0.95],scale:0.8} ~ ~1.2 ~ 0.3 0.5 0.3 0 1
