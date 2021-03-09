extends CanvasLayer

onready var camera = get_parent().get_node("Camera2D")
onready var scoretext = get_node("Control").get_node("ScoreText")

func _process(delta):
	#scoretext.position = camera.position
	pass
	



func _ready():
	pass


