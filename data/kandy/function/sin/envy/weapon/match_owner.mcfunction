data modify storage kandy:falconer cmp set from storage kandy:falconer owner
execute store success score #diff fl_tmp run data modify storage kandy:falconer cmp set from entity @s UUID
execute if score #diff fl_tmp matches 0 run tag @s add kandy.fl_shooter
