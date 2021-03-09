extends Node

onready var bgm = get_node("BGM")
onready var menutheme = get_node("MenuTheme")
onready var hitsfx = get_node("Hitsfx")
onready var shoot = get_node("Shoot")
onready var aim = get_node("Aim")
onready var click = get_node("Click")
onready var point =  get_node("Point")


func _ready():
	pass 

func play_bgm():
	bgm.playing = true

func stop_bgm():
	bgm.playing = false

func play_menutheme():
	menutheme.playing = true

func stop_menutheme():
	menutheme.playing = false
	
func volume_on_bgm():
	bgm.volume_db = -5
	

func volume_off_bgm():
	bgm.volume_db = -1000

func volume_on_menutheme():
	menutheme.volume_db = -13

func volume_off_menutheme():
	menutheme.volume_db = -1000

func play_hitsfx():
	hitsfx.playing = true

func play_shoot():
	shoot.playing = true

func play_aim():
	aim.playing = true

func play_click():
	click.playing = true

func volume_on_click():
	click.volume_db = 0

func volume_off_click():
	click.volume_db = -1000

func volume_on_hitsfx():
	hitsfx.volume_db = 0
	
func volume_off_hitsfx():
	hitsfx.volume_db = -1000

func volume_on_shoot():
	shoot.volume_db = -3

func volume_off_shoot():
	shoot.volume_db = -1000

func volume_on_aim():
	aim.volume_db = 10

func volume_off_aim():
	aim.volume_db = -1000

func volume_on_point():
	point.volume_db = 3

func volume_off_point():
	point.volume_db = -1000

func play_point():
	point.playing = true


