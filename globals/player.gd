extends Node

signal inventory_changed

var _inventory = []
var money = 0

func get_inventory():
	var inventory = _inventory.filter(func(item): return item.count > 0)
	inventory.sort_custom(func(a, b): return a.name < b.name)
	
	return inventory


func add_item(item: Item):
	var has_item = false
	
	for i in _inventory:
		if i.id == item.id:
			i.count += item.count
			has_item = true
	
	if has_item == false:
		_inventory.append(item)
	
	inventory_changed.emit()


func remove_item(item: Item):
	for i in _inventory:
		if i.id == item.id and i.count >= item.count:
			i.count -= item.count
	
	inventory_changed.emit()
