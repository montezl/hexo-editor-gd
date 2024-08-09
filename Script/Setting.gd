extends Node2D

func _on_command_apply_pressed() -> void:
	$CommandApply.visible = false
	Global.data["command"] = $CommandEdit.text
	print("Command change to " +Global.data["command"])
	pass # Replace with function body.
func _ready() -> void:
	$CommandEdit.text = Global.data["command"]
	pass # Replace with function body.

func _on_command_edit_text_changed() -> void:
	$CommandApply.visible = true
	pass # Replace with function body.
func _on_start_button_pressed() -> void:
	%Setting.visible = false
	%Start.visible = true
	pass # Replace with function body.
