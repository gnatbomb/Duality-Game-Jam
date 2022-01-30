extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var levelID
export (String) var nextLvl

var gameController
onready var player1 = get_node("Player1")

# Called when the node enters the scene tree for the first time.
func _ready():
	gameController = get_tree().get_root().get_node("GameController")
	if gameController.getLevelsUnlocked() <= levelID:
		gameController.setLevelsUnlocked(levelID + 1)
	

func _process(delta):
	if player1.victory==true:
		get_tree().change_scene(nextLvl)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
