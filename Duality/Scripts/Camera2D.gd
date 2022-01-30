extends Camera2D

export var decay = 0.8 
export var max_offset = Vector2(100, 50)
export var max_roll = 0.1 
export (NodePath) var target 

var trauma = 0.01
var trauma_power = 2  
onready var noise = OpenSimplexNoise.new()
onready var p1 = get_parent().get_node("Player1")
onready var p2 = get_parent().get_node("Player2")

var noise_y = 0

func _ready():
	randomize()
	noise.seed = randi()
	noise.period = 4
	noise.octaves = 2

func _process(delta):
	if (not p1.alive) or (not p2.alive):
		print(trauma - decay * delta)
		trauma = max(trauma - decay * delta, 0)
		shake()
	else:
		add_trauma(0.01)
		
func shake():
	var amount = pow(trauma, trauma_power)
	noise_y += 1
	rotation = max_roll * amount * noise.get_noise_2d(noise.seed, noise_y)
	offset.x = max_offset.x * amount * noise.get_noise_2d(noise.seed*2, noise_y)
	offset.y = max_offset.y * amount * noise.get_noise_2d(noise.seed*3, noise_y)
	
func add_trauma(amount):
	trauma = min(trauma + amount, 0.3)
	

