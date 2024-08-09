extends Node2D

func _ready() -> void:
	#_on_file_dialog_dir_selected(Global.get_value("dir"))
	pass
var output = [""]
var count = 0
var v_scroll = 0
var output_tmp
func _process(delta: float) -> void:
	if output[count] != output_tmp:
		$Console.text = output[count]
	v_scroll = $Console.get_v_scroll_bar()
	if v_scroll && v_scroll.value+v_scroll.page == v_scroll.max_value:
		#print("Console out")
		v_scroll.value = v_scroll.max_value
	pass
	output_tmp = output[count]
#func read_output():
	#var result = OS.get_process_id()
	#if result != "":
		#output += result
		#print(output)
#
	#if !OS.is_process_running(result):
		#print("Process finished.")
		#get_tree().remove_timer(get_tree().get_timers()[0]) # 移除定时器
		#OS.kill(result)

func _on_deploy_button_pressed() -> void:
	#var pid = OS.execute("CMD.exe", ["/C", "tree D:"], output)
	print(OS.execute("CMD.exe", ["/C", "hexo g"], output))
	print(output[1])
	count += 1
	pass # Replace with function body.


func _on_markdown_label_focus_entered() -> void:
	print("focus")
	pass # Replace with function body.
