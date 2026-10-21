# Run as a player: copy the main-hand item's NBT into storage kandy:held item
# (26.3 doesn't save SelectedItem for players, so find it in Inventory by the selected hotbar slot)
data remove storage kandy:held item
execute store result storage kandy:held slot.s int 1 run data get entity @s SelectedItemSlot
function kandy:util/held_copy with storage kandy:held slot
