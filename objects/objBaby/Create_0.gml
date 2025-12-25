// Inherit the parent event
event_inherited();

positions = [ { x: 0, y: 0 }, { x: -10, y: 4 }, { x: 5, y: 2 }, { x: 7, y: 4 }, { x: -12, y: 6 }, {x: 12, y: 6 } ]
mother = 1

ds_list_add(owner.children, self)
index = ds_list_size(owner.children) - 1
objPlayer.DJA = index + 1