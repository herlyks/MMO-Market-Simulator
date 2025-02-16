extends Control

@export var activity_button_group: ButtonGroup 

var activity = null


func _ready() -> void:
	for btn in activity_button_group.get_buttons():
		btn.pressed.connect(func(): set_activity(btn))


func _process(delta: float) -> void:
	pass


func _on_end_day_button_pressed() -> void:
	var new_leathers = randi_range(1, 5)
	var new_meats = randi_range(1, 3)
	var new_ores = randi_range(1, 5)

	if activity != null:
		if activity == "hunting":
			print("Obtained ", new_leathers, " leathers and ", new_meats, " meats.")
		elif activity == "mining":
			print("Obtained ", new_ores, " ores.")

	activity = null


func set_activity(btn):
	if btn == $ActivityVBox/HuntingButton:
		activity = "hunting"
	elif btn == $ActivityVBox/MiningButton:
		activity = "mining"
	elif btn == $ActivityVBox/ExploreDungeon1:
		activity = "dungeon1"
	elif btn == $ActivityVBox/ExploreDungeon2:
		activity = "dungeon2"
