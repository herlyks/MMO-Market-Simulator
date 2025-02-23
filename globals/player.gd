extends Node

var _inventory = []

func get_inventory():
	_inventory.sort_custom(func(a, b): return a.name < b.name)
	
	return _inventory

func add_item(item: Item):
	var has_item = false
	
	for i in _inventory:
		if i.id == item.id:
			i.count += item.count
			has_item = true
	
	if has_item == false:
		_inventory.append(item)
