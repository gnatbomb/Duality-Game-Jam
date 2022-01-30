extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_music()
	LevelController.go_to_level(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
