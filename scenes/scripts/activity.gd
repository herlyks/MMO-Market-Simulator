extends TabBar

var activity = null
@export var activity_btn_group: ButtonGroup


func _on_hunting_button_pressed() -> void:
	if activity != "hunting":
		activity = "hunting"
	elif activity == "hunting":
		activity = null


func _on_mining_button_pressed() -> void:
	if activity != "mining":
		activity = "mining"
	elif activity == "mining":
		activity = null


func clear_btn_group():
	for btn in activity_btn_group.get_buttons():
		btn.button_pressed = false


func _on_main_day_end() -> void:
	if activity == "hunting":
		var leather = load("res://items/leather.tres").duplicate()
		leather.count = randi_range(1, 3)
		Player.add_item(leather)
		print("got ", leather.count, " leathers")
	
	if activity == "mining":
		var iron_ingot = load("res://items/iron_ingot.tres").duplicate()
		iron_ingot.count = randi_range(1, 5)
		Player.add_item(iron_ingot)
		print("got ", iron_ingot.count, " iron ingots")
	
	activity = null
	clear_btn_group()
