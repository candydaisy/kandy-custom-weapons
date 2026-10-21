# function kandy:sin/set_deeds {deeds:N}: store a deed count on the held sin weapon
$item modify entity @s weapon.mainhand {type:"minecraft:set_custom_data",tag:'{deeds:$(deeds)}'}
