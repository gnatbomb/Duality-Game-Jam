extends Control

var current_level = 0

# levels list
var levels = [ "res://Scenes/UI/MainMenu.tscn",
	"res://Scenes/Levels/Level1.tscn",
	"res://Scenes/Levels/level2.tscn",
	"res://Scenes/Levels/level3.tscn",
	"res://Scenes/Levels/level4.tscn",
	"res://Scenes/Levels/level5.tscn",
	"res://Scenes/Levels/level6.tscn",
	"res://Scenes/Levels/level7.tscn",
	"res://Scenes/Levels/level8.tscn",
	"res://Scenes/Levels/level9.tscn",
	"res://Scenes/Levels/level10.tscn",
	"res://Scenes/Levels/level11.tscn",
	"res://Scenes/Levels/level12.tscn",
	"res://Scenes/Levels/level13.tscn",
	"res://Scenes/Levels/level14.tscn",
	"res://Scenes/Levels/level15.tscn",
	"res://Scenes/Levels/level16.tscn",
	"res://Scenes/Levels/level17.tscn",
	"res://Scenes/Levels/level18.tscn",
	"res://Scenes/Levels/level19.tscn",
	"res://Scenes/Levels/level20.tscn",
	"res://Scenes/Levels/level21.tscn",
	"res://Scenes/Levels/level22.tscn",
	"res://Scenes/Levels/level23.tscn",
	"res://Scenes/UI/CreditsScreen.tscn"	
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func go_to_level(level):
	if (level >= 0 and level < levels.size()):
		current_level = level
		get_tree().change_scene(levels[current_level])
		
func next_level():
	if (current_level == levels.size() - 1):
		current_level = 0
	else:
		current_level += 1
	go_to_level(current_level)

