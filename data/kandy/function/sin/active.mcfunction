# Every sin weapon's active ability goes through here: function kandy:sin/active {sin:"wrath"}
# Each sin weapon has its own cooldown (kandy.cd.<sin>); the active sets it
$execute if score @s kandy.cd.$(sin) matches 1.. run return fail
$return run function kandy:sin/$(sin)/weapon/active
