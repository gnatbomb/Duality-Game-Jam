extends Node

# music load calls
var bgm = load("res://Music/LoversLost.mp3")

# SE load calls
var death = load("res://SE/DeathScream.ogg")
var steppy = load("res://SE/Footsteps.ogg")
var jump = load("res://SE/Jump.ogg")
var land = load("res://SE/Landing.ogg")
var embrace = load("res://SE/LoversEmbrace.ogg")
var close = load("res://SE/MenuClose.ogg")
var open = load("res://SE/MenuOpen.ogg")
var respawn = load("res://SE/Respawn.ogg")
var owie = load("res://SE/SpikeTouchYEOWCH.ogg")
var spring = load("res://SE/Spring.ogg")
var swap = load("res://SE/Swap.ogg")


# SE dict
var sounds = {
	"death": death,
	"steppy": steppy,
	"jump": jump,
	"land": land,
	"embrace": embrace,
	"close": close,
	"open": open,
	"respawn": respawn,
	"owie": owie,
	"spring": spring,
	"swap": swap
}

# Audioplayer array
var AudioPlayers = []

var pitchdif = 0.1

# plays a given sound effect with pitch shift based on player. Call with player = 0 for no pitch shift
func play_SE(player, noise):

	var pitchscale = 1
	if (player == 1):
		pitchscale -= pitchdif
	elif (player == 2):
		pitchscale += pitchdif
		
	if (noise == "steppy"):
		if (player == 1):
			if (! $SE11.is_playing()):
				$SE11.set_pitch_scale(pitchscale)
				$SE11.play()
		else:
			if (! $SE12.is_playing()):
				$SE12.set_pitch_scale(pitchscale)
				$SE12.play()
		
	else:
		for n in AudioPlayers.size():
			if (! AudioPlayers[n].is_playing()):
				AudioPlayers[n].set_pitch_scale(pitchscale)
				AudioPlayers[n].stream = sounds[noise]
				AudioPlayers[n].play()
				break


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayers.append($SE1)
	AudioPlayers.append($SE2)
	AudioPlayers.append($SE3)
	AudioPlayers.append($SE4)
	AudioPlayers.append($SE5)
	AudioPlayers.append($SE6)
	AudioPlayers.append($SE7)
	AudioPlayers.append($SE8)
	AudioPlayers.append($SE9)
	AudioPlayers.append($SE10)
	$SE11.stream = steppy
	$SE12.stream = steppy


func play_music():
	$Music.stream = bgm
	$Music.play()
	default_volume()

func default_volume():
	$Music.volume_db = -8

func lower_volume():
	$Music.volume_db = -12
	

