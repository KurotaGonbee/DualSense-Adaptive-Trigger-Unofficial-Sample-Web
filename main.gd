extends Node

var window
func _ready() -> void:
	window = JavaScriptBridge.get_interface("window")

func _process(delta: float) -> void:
	pass

func _on_request_open_dualsense_button_pressed() -> void:
	window.request_open_dualsense()
