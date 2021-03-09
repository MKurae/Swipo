extends Button

export var reference_path = ""
export var start_focus = false
onready var popup = get_parent().get_node("PopupMenu")
var click_has_played = false

func _ready():
	if(start_focus):
		grab_focus()
	connect("pressed",self,"_input")
	set_process_input(true)
	
func _input(event):
	if Input.is_action_pressed("click"):
			connect("pressed",self,"Button_pressed")
			#if !click_has_played:
				#click_has_played = true
			#MusicController.play_click()


func Button_pressed():
	MusicController.play_click()
	if(reference_path != ""):
		get_tree().change_scene(reference_path)
	else:
		get_tree().quit()
	

func _on_Options_pressed():
		popup.show()



func _on_CloseButton_pressed():
		popup.hide()
	



#func _on_Start_pressed():
	#if Input.is_action_pressed("click"):
		#get_tree().change_scene("res://Scenes/Game.tscn")
