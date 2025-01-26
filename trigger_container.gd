extends MarginContainer

@export var trigger_label: String = ""

func _ready() -> void:
	$VBoxContainer/Label.text = trigger_label
	var idx = 1
	for child in $VBoxContainer.get_children():
		if child.is_in_group("ForceParameter"):
			child.get_node("Label").text = "ForceParam" + str(idx)
			idx +=1
func get_parameters():
	var mode = get_mode()
	var buf = PackedByteArray([mode])
	for child in $VBoxContainer.get_children():
		if child.is_in_group("ForceParameter"):
			buf.append(child.value)
	return buf

func get_mode():
	var mode = $VBoxContainer/ModeContainer.get_mode()
	return mode
