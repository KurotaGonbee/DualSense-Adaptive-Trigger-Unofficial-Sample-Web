extends Node

var window
var has_connection = false
func _ready() -> void:
	window = JavaScriptBridge.get_interface("window")
	switch_appearance()

func _process(_delta: float) -> void:
	if window == null:
		has_connection = false
		return
	has_connection = window.is_opened()
	switch_appearance()

func _on_request_open_dualsense_button_pressed() -> void:
	window.request_open_dualsense()

func send():
	var packet = JavaScriptBridge.create_object("Uint8Array", 47)
	packet[0] = 0xff
	var l_trigger = $UserInterface/MarginContainer/VBoxContainer/ControllerContainer/TriggerContainer/LTriggerForceContainer.get_parameters()
	var r_trigger = $UserInterface/MarginContainer/VBoxContainer/ControllerContainer/TriggerContainer/RTriggerForceContainer.get_parameters()
	for i in r_trigger.size():
		packet[i + 10] = r_trigger[i]
	for i in l_trigger.size():
		packet[i + 21] = l_trigger[i]
	window.send(packet)

func _on_button_pressed() -> void:
	send()
	
func switch_appearance():
	if has_connection:
		$UserInterface/MarginContainer/VBoxContainer/ControllerContainer.show()
		$UserInterface/MarginContainer/VBoxContainer/RequestOpenDualsenseButton.hide()
	else:
		$UserInterface/MarginContainer/VBoxContainer/ControllerContainer.hide()
		$UserInterface/MarginContainer/VBoxContainer/RequestOpenDualsenseButton.show()
