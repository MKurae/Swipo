extends Node2D

const WallSpawner = preload ("res://Scenes/Wall.tscn")
const Wall2Wall = 500
var spawn_position = position
onready var player = get_parent().get_node("Player")

func _ready():
	pass 
	
func _process(delta):
	if spawn_position.distance_to(player.position) < 1000:
		spawn_wall()

func spawn_wall():
	var spawn_wall_instance = WallSpawner.instance()
	add_child(spawn_wall_instance)
	spawn_wall_instance.position.x = spawn_position.x
	spawn_wall_instance.position.y = spawn_position.y
	randomize()
	
	spawn_position.x = spawn_position.x + Wall2Wall
	spawn_position.y = rand_range(250,-250)
