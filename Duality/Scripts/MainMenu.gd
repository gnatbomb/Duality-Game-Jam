extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	LevelController.go_to_level(1)
	MusicController.play_SE(0, "open")

func _on_LevelsButton_pressed():
	get_tree().change_scene("res://Scenes/UI/LevelSelect.tscn")
	MusicController.play_SE(0, "open")

func _on_SettingButton_pressed():
	get_tree().change_scene("res://Scenes/UI/SettingsPage.tscn")
	MusicController.play_SE(0, "open")

func _on_CreditsButton_pressed():
	LevelController.go_to_level(23)
	MusicController.play_SE(0, "open")
