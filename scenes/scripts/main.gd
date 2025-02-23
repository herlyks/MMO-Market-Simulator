extends Control

signal day_end


func _on_end_day_button_pressed() -> void:
	day_end.emit()
