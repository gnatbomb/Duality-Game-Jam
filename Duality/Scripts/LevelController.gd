extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var levelID

var gameController

# Called when the node enters the scene tree for the first time.
func _ready():
	gameController = get_tree().get_root().get_node("GameController")
	if gameController.getLevelsUnlocked() <= levelID:
		gameController.setLevelsUnlocked(levelID + 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
