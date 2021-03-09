extends Area2D
onready var player = get_parent().get_parent().get_parent().get_node("Player")




func _ready():
	pass 




func _on_Point_body_entered(body):
	if body.name == "Player":
		queue_free()
