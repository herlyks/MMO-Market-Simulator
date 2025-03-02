extends TabBar

@onready var list = %RecipeItemList
@onready var ingredient_vbox = %IngredientVBoxContainer
@onready var craft_btn = %CraftButton

var items = ItemLoader.load_crafting_items()
var ingredients = []


func _ready() -> void:
	list.clear()
	clear_ingredients()
	
	for item in items:
		list.add_item(item.name)
		list.set_item_metadata(list.get_item_count() - 1, item)


func _process(delta: float) -> void:
	set_craft_btn()


func _on_recipe_item_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	clear_ingredients()
	
	var metadata = list.get_item_metadata(index)
	
	if metadata.recipe.size() != 0:
		for item in metadata.recipe:
			var has_item = false
			
			for i in ingredients:
				if i.id == item.id:
					i.count += item.count
					has_item = true
			
			if has_item == false:
				ingredients.append(item.duplicate())
	
	for item in ingredients:
		var label = Label.new()
		label.text = str(item.name, " x", item.count)
		ingredient_vbox.add_child(label)


func clear_ingredients():
	ingredients = []
	
	for node in ingredient_vbox.get_children():
		node.queue_free()


func player_has_ingredients():
	var item_in_inventory = []
	var player_inventory = Player.get_inventory()
	
	if ingredients.size() == 0:
		return false
	
	for item in ingredients:
		var filtered_inventory = player_inventory.filter(func(a): return item.id == a.id)
		
		if filtered_inventory.size() == 0:
			return false
		
		for player_item in filtered_inventory:
			if item.count <= player_item.count:
				item_in_inventory.append(true)
			else:
				item_in_inventory.append(false)
	
	for i in item_in_inventory:
		if i == false:
			return false
	
	return true


func _on_craft_button_pressed() -> void:
	var index = list.get_selected_items()[0]
	var crafted_item = list.get_item_metadata(index)
	
	for item in ingredients:
		Player.remove_item(item)
		Player.add_item(crafted_item)


func set_craft_btn():
	if player_has_ingredients():
		craft_btn.disabled = false
	else:
		craft_btn.disabled = true
