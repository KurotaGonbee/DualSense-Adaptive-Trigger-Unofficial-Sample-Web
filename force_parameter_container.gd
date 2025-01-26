extends HBoxContainer

var value = 0
signal value_changed()

func _on_h_slider_value_changed(new_value: float) -> void:
	value = new_value
	value_changed.emit()
