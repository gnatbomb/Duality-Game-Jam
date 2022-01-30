extends VBoxContainer
# var a = 2
# var b = "text"

var gameController

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	gameController = get_tree().get_root().get_node("GameController")
	for i in range(gameController.getLevelsUnlocked()):
		get_child(i).disabled = false
		get_child(i).visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Level1Button_pressed():
	MusicController.play_SE(0, "open")
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")

func _on_Level2Button_pressed():
	MusicController.play_SE(0, "open")
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")

func _on_Level3Button_pressed():
	MusicController.play_SE(0, "open")
	get_tree().change_scene("res://Scenes/Levels/Level3.tscn")

func _on_Level4Button_pressed():
	MusicController.play_SE(0, "open")
	get_tree().change_scene("res://Scenes/Levels/Level4.tscn")

func _on_Level5Button_pressed():
	MusicController.play_SE(0, "open")
	get_tree().change_scene("res://Scenes/Levels/Level5.tscn")
