extends Node


func load_marketplace_items():
	var items = []
	
	for file_name in DirAccess.get_files_at("res://items/"):
		if file_name.get_extension() == "tres":
			items.append(load("res://items/" + file_name).duplicate())
		
		if file_name.get_extension() == "import":
				file_name = file_name.replace(".import", "")
				items.append(load("res://items/" + file_name).duplicate())
	
	return items


func load_crafting_items():
	var items = []
	
	for file_name in DirAccess.get_files_at("res://items/"):
		var item
		
		if file_name.get_extension() == "tres":
			item = load("res://items/" + file_name).duplicate()
			if _has_recipe(item):
				items.append(item)
		
		if file_name.get_extension() == "import":
				file_name = file_name.replace(".import", "")
				item = load("res://items/" + file_name).duplicate()
				if _has_recipe(item):
					items.append(item)
	
	return items


func _has_recipe(item):
	return item.recipe.size() > 0
