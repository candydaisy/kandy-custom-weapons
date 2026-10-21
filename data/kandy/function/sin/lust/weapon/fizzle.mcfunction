# Embrace failed: not enough Desire, or nobody in reach. No cooldown is spent
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.5
execute unless score @s sprint matches 500.. run title @s actionbar {text:"Not enough Desire: sprint to build it.",color:"#ff4fa3"}
