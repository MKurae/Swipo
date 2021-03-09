extends Line2D

onready var player := get_parent()
var vec_start := Vector2.ZERO
var vec_fin := Vector2.ZERO



func _unhandled_input(_event: InputEvent)-> void:
	if Input.is_action_just_pressed("click") && InputEventScreenTouch:
		vec_start = get_local_mouse_position()
		points[0] = Vector2.ZERO
	if Input.is_action_pressed("click"):
		vec_fin = get_local_mouse_position()
		points[1] = vec_start - vec_fin
	if Input.is_action_just_released("click"):
		player.dir = (vec_start-vec_fin)
