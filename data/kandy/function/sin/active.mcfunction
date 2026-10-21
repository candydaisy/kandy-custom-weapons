# Every sin weapon's active ability goes through here: function kandy:sin/active {sin:"wrath"}
# kandy.cd is shared, so swapping to another sin weapon doesn't dodge a cooldown; the active sets it
execute if score @s kandy.cd matches 1.. run return fail
$return run function kandy:sin/$(sin)/weapon/active
