extends Node


var bgm = load("res://Audio/LoversLost.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func play_music():
	$Music.stream = bgm
	$Music.play()
	default_volume()

func default_volume():
	$Music.volume_db = -8

func lower_volume():
	$Music.volume_db = -12
