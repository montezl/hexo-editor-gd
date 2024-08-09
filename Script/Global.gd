 #      #                                    ########        ##   ##   #                   
 #     ##                                   #### ###          #   ##   ##                  
 #     #     #####   #    ##   #####         ##          ######   ##   #   #  #####   #####
 ##    #    ##   ##  ##  ##   ##   ##        ##   #     ##   ##   ## ####### ##   ##  #####
#########  ## #####   ####    #     #        ######     #     #   ##   #     #     #  ##   
 #     #   ########    ##    ##     #        ##        ##     #   ##   #    ##     #  ##   
 #     #    #     #   ## #    #    ##        ##         #     #   ##   #     #    ##  ##   
 ##     ##   ##  ###  ##  ###  ### ##        ##########  ### ###   ##   ## ## ### ##   ##   
 ##     #     #####  ##    ##   ####         #########    #### #   ##    ###   ####    ##   
extends Node

var data = {
	"dir": "D:/Code/hexo",
	"command": "hexo",
	"post_dir": "/source/_posts",
	"recent": ["D:/Code/hexo","D:/"]
}
func _ready() -> void:
	if FileAccess.file_exists("res://data.cfg"):
		print("find cfg")
		init_data()
	print("data load")
	print(data)
	#init_data()
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_data(data)
		get_tree().quit() # default behavior
func save_data(data):
	var config = ConfigFile.new()
	config.set_value("Data", "data", data)
	config.save("res://data.cfg")
func load_data():
	var config = ConfigFile.new()
	config.load("res://data.cfg")
	var data = config.get_value("Data", "data", {})
	return data
func init_data():
	data = load_data()
