extends TextureProgressBar


const PARRY_ACTIVE_FRAMES = 4;
const PARRY_COOLDOWN_FRAMES = 20;

@onready var player: CharacterBody2D = $".."
@export_color_no_alpha var parry_frames_color: Color
@export_color_no_alpha var parry_cooldown_color: Color

var parry_frames: float = 0
var parry_cooldown: float = 0


func _process(delta:float) -> void:
	if(Input.is_action_just_pressed("parry")):
		if(parry_frames > 0):
			parry_frames = 0
			parry_cooldown = PARRY_COOLDOWN_FRAMES * 5
		elif(not parry_cooldown > 0):
			parry_frames = PARRY_ACTIVE_FRAMES

	if(parry_frames > 0):
		tint_progress = parry_frames_color
		value = parry_frames
		max_value = PARRY_ACTIVE_FRAMES
		parry_frames -= delta * Engine.physics_ticks_per_second
	elif(parry_cooldown > 0):
		tint_progress = parry_cooldown_color
		value = parry_cooldown
		max_value = PARRY_COOLDOWN_FRAMES
		parry_cooldown -= delta * Engine.physics_ticks_per_second
	else:
		value = 0


func parry_orb() -> void:
	if(not parry_frames > 0):
		return
	
	player.jump()
	
	parry_frames = 0
	parry_cooldown = PARRY_COOLDOWN_FRAMES
