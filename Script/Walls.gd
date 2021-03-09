extends StaticBody2D
onready var player = get_parent().get_parent().get_parent().get_node("Player")
onready var downwallcol = get_node("DownWallCollision")

func _ready():
	pass 

func  _physics_process(delta):
	if global_position.distance_squared_to(player.global_position) > 1000000 and player.global_position.x > global_position.x:
		queue_free()


#func _on_Point_body_entered(body):
	#if body.name == "Player":
		#downwallcol.disabled
		
		#queue_free()
