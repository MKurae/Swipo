extends RigidBody2D

onready var player = get_parent().get_node("Player")

var vec_start = Vector2.ZERO
var vec_fin = Vector2.ZERO
var dir = Vector2.ZERO
var Wall = preload("res://Scenes/Wall.tscn")
var score = 0
var highscore = 0
var gamestarted = true
var gameover = false
var sound_has_played = false
var aim_has_played = false

const savefile_path = "user://savedata.save"

onready var light = get_node("Light2D")
onready var menu = get_parent().get_node("Menu")
onready var Line = $Line
onready var scoretext = get_parent(). get_node("Camera2D/ScoreText")
onready var music = get_parent().get_node("BGM")
onready var hit_sound = get_node("Hit")
onready var DownWallCol = get_parent().get_node("WallSpawner").get_node("Wall").get_node("Walls").get_node("DownWallCollision")

func _ready():
	_load_highscore()
	

func _unhandled_input(InputEvent):
	if Input.is_action_just_pressed("click"):
		vec_start = get_local_mouse_position()
		MusicController.play_aim()
	if Input.is_action_pressed("click"):
		vec_fin = get_local_mouse_position()
	if Input.is_action_just_released("click"):
		player.dir = ((vec_start - vec_fin))
		MusicController.play_shoot()


func _physics_process(delta):
	get_parent().get_node("Camera2D/ScoreText").text = str(score)
	MusicController.stop_menutheme()
	if gamestarted:
		return
	light.texture_scale = clamp(light.texture_scale, 0.01, 5)
	if light.texture_scale < 0.01:
		player.gravity_scale = 20 + player.gravity_scale
		Line.visible = false
		set_process_unhandled_input(false)
		linear_damp = 1000000
		#player.visible = false
		scoretext.visible = false
		if Input.is_action_just_released("click"):
			player.dir = 1 * ((vec_start - vec_fin))
			
	if Input.is_action_pressed("click"):
		light.texture_scale = light.texture_scale - 0.015
		linear_velocity = dir * 0.2
	else:
		linear_velocity = dir * 5 
		light.texture_scale = light.texture_scale - 0.005

func _on_HItbox_area_entered(area):
	if gameover == false:
		if area.name == "Point":
			light.texture_scale = light.texture_scale + 1.3
			score = score + 1
			MusicController.play_point()
	elif gameover == true:
			score = score + 0

func _on_HItbox_body_entered(body):
	if body.name == "Walls":
		gameover = true
		#DownWallCol.disabled
		if !sound_has_played:
			sound_has_played = true
			MusicController.play_hitsfx()
		light.texture_scale = 0.001
		if score > highscore:
			highscore = score
			_save_highscore()
		menu._init_gameover_menu(score, highscore)
		MusicController.stop_bgm()

func _on_VisibilityNotifier2D_screen_exited():
	light.texture_scale = 0.001
	if score > highscore:
		highscore = score
	menu._init_gameover_menu(score, highscore)
	MusicController.stop_bgm()
	

func _on_Menu_startgame():
	MusicController.play_bgm()
	gamestarted = false

func _save_highscore():
	
	var save_data = File.new()
	save_data.open(savefile_path, File.WRITE)
	save_data.store_var(highscore)
	save_data.close()

func _load_highscore():
	var save_data = File.new()
	if save_data.file_exists(savefile_path):
		save_data.open(savefile_path, File.READ)
		highscore = save_data.get_var()
		save_data.close()
	



#func _on_Hit_finished():
	#hit_sound.volume_db = -100
