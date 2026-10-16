# Clear, with solid ground to stand on
execute if block ~ ~-1 ~ #kandy:passable run return fail
execute if block ~ ~-1 ~ minecraft:lava run return fail
execute if function kandy:wayfarers_compass/clear run return 1
return fail
