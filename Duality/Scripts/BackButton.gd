extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_MainMenuButton_pressed():
	LevelController.go_to_level(0)
	MusicController.play_SE(0, "close")
