# Pre-revamp blades get the new item data (and with it, right-click) the first time they're held
execute as @a[tag=kandy.lust.w] if items entity @s weapon.mainhand *[custom_data~{ability:"BloodPact"}] unless items entity @s weapon.mainhand *[custom_data~{sin:"lust"}] run function kandy:sin/lust/weapon/migrate

function kandy:sin/lust/weapon/desire
function kandy:sin/lust/weapon/effect
function kandy:sin/lust/weapon/price
function kandy:sin/lust/weapon/visual

# Right-click: Embrace. lust_use is set by the using_item advancement; only the first tick of a press counts
execute as @a[tag=kandy.lust.w,scores={lust_use=1}] unless score @s lust_held matches 1 at @s run function kandy:sin/lust/weapon/press
scoreboard players add @a lust_use 0
execute as @a run scoreboard players operation @s lust_held = @s lust_use
scoreboard players set @a[scores={lust_use=1..}] lust_use 0
