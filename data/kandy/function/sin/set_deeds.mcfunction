# function kandy:sin/set_deeds {deeds:N,slot:"weapon.mainhand"}: store a deed count on the held sin weapon
$item modify entity @s $(slot) {type:"minecraft:set_custom_data",tag:'{deeds:$(deeds)}'}
