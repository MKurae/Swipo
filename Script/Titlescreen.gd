extends Control

onready var menutheme = get_node("MenuTheme")
var menuthemestate = true
var sfxstate = true


func _ready():
	MusicController.play_menutheme()
	pass # Replace with function body.



func _on_MuteBGM_toggled(button_pressed):
	if menuthemestate == false:
		menuthemestate = true
		MusicController.volume_on_menutheme()
		MusicController.volume_on_bgm()
	elif menuthemestate == true:
		menuthemestate = false
		MusicController.volume_off_bgm()
		MusicController.volume_off_menutheme()


func _on_MuteSFX_toggled(button_pressed):
	if sfxstate == false:
		sfxstate = true
		MusicController.volume_on_hitsfx()
		MusicController.volume_on_aim()
		MusicController.volume_on_shoot()
		MusicController.volume_on_click()
		MusicController.volume_on_point()
	elif sfxstate == true:
		sfxstate = false
		MusicController.volume_off_hitsfx()
		MusicController.volume_off_aim()
		MusicController.volume_off_shoot()
		MusicController.volume_off_click()
		MusicController.volume_off_point()

