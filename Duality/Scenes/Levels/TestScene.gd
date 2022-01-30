extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_music()
	
func play_death():
	MusicController.play_SE(1, "steppy")
	
func play_steppy():
	MusicController.play_SE(2, "steppy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
