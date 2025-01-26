extends HBoxContainer

const mode_list = [0,1,2,6,33,34,35,37,38,39];

var mode_idx = 0;

func _ready() -> void:
	change_mode_text()

func _on_plus_button_pressed() -> void:
	mode_idx += 1
	if mode_idx >= mode_list.size():
		mode_idx = 0
	change_mode_text()

func _on_minus_button_pressed() -> void:
	mode_idx -= 1
	if mode_idx <0:
		mode_idx = mode_list.size() - 1
	change_mode_text()

func change_mode_text():
	$ModeLabel.text = str(get_mode())

func get_mode():
	return mode_list[mode_idx]
