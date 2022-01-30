extends VBoxContainer
# var a = 2
# var b = "text"

var gameController

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
		
func open_level(level):
	MusicController.play_SE(0, "open")
	LevelController.go_to_level(level)
