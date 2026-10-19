# Lucky Waters and Patience: while a fishing rod is in either hand
execute as @a[tag=kandy.charm.anglers_lure,tag=!kandy.alr_rod] if items entity @s weapon.* minecraft:fishing_rod run function kandy:anglers_lure/rod_on
execute as @a[tag=kandy.alr_rod,tag=!kandy.charm.anglers_lure] run function kandy:anglers_lure/rod_off
execute as @a[tag=kandy.alr_rod] unless items entity @s weapon.* minecraft:fishing_rod run function kandy:anglers_lure/rod_off
