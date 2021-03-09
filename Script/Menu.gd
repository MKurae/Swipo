extends CanvasLayer

signal startgame
signal endgame

var gamestarted = false
onready var startmsg = $Start/Startmsg
onready var tween = $Tween
onready var score_end = $End/VBoxContainer/Score
onready var highscore_end = $End/VBoxContainer/Highscore
onready var gameover_menu = $End

func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_released("click") && !gamestarted:
		emit_signal("startgame")
		gamestarted = true
		tween.interpolate_property(startmsg, "modulate:a", 1, 0, 0.5)
		tween.start()

func _init_gameover_menu(score, highscore):
	score_end.text = "SCORE: " + str(score)
	highscore_end.text = "BEST: " + str(highscore)
	gameover_menu.visible = true

func _on_Restart_pressed():
	MusicController.play_click()
	get_tree().reload_current_scene()


func _on_Home_pressed():
	get_tree().change_scene("res://Scenes/Titlescreen.tscn") 
	MusicController.play_click()
	
