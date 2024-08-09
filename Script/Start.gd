extends Node2D

var buttons = {}
var project_name = ProjectSettings.get_setting("application/config/name")
func _ready() -> void:
	for recent in Global.data["recent"]:
		create_button(recent,$Recent,_on_file_dialog_dir_selected,recent)
	pass
func _on_file_button_pressed() -> void:
	$FileDialog.popup()
	pass
func _on_tab_clicked(tab: int) -> void:
	print("Clicked tab ",tab)
	if tab == 0:
		_on_file_button_pressed()
	pass
func _on_setting_pressed() -> void:
	%Start.visible = false
	%Setting.visible = true
	pass
func _on_file_dialog_dir_selected(dir: String) -> void:
	DisplayServer.window_set_title(project_name+" - "+dir)
	print("Open dir " + dir)
	Global.data["dir"] = dir
	Global.data["recent"].append(dir)
	print("Now,we have ",Global.data["recent"].size())
	while true:
		if Global.data["recent"].size() > 10:
			print("so delete to 10")
			Global.data["recent"].remove_at(0)
			print(Global.data["recent"])
			print(Global.data["recent"].size())
		else:
			break
	%Start.visible = false
	%Edit.visible = true
	var files = dir_contents(dir+Global.data["post_dir"])
	for file in files:
		create_button(file,%Edit/PostContainer,_on_post_button_pressed,file)
	pass
func create_button(bind,child,connect,text):
	var button = Button.new()
	button.text = text
	button.pressed.connect(connect.bind(bind))
	child.add_child(button)
	var position = Vector2(0, len(buttons) * 30)
	button.clip_text = true
	print(button.size)
	button.position = position
	buttons[bind] = button
func _on_post_button_pressed(file):
	print("Button pressed for file: " + file)
	var open = Global.data["dir"]+Global.data["post_dir"]+"/"+file
	print("Open "+open)
	var post = FileAccess.open(open, FileAccess.READ)
	%Edit/MarkdownLabel.markdown_text = post.get_as_text()
func dir_contents(path):
	var dir = DirAccess.open(path)
	var files = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				break
			else:
				files.append(file_name)
			file_name = dir.get_next()
	else:
		print("Error。")
	return files
