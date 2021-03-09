extends Camera2D

onready var player = get_parent().get_node("Player")
#onready var gameactive = true

func _process(delta):
	if player.visible:
		position.x = player.position.x
	else:
		position.x = position.x
		

#func _on_Menu_endgame():
	#gameactive = false
	

