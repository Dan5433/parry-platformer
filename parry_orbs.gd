extends Area2D

const PARRY_ACTIVE_FRAMES = 4;
const PARRY_COOLDOWN_FRAMES = 20;

@onready var label: Label = $"../Player/Label"
@onready var player: CharacterBody2D = $"../Player"

var parry_frames = 0
var parry_cooldown = 0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(delta:float) -> void:
	if(Input.is_action_just_pressed("parry")):
		if(parry_frames > 0):
			parry_frames = 0
			parry_cooldown = PARRY_COOLDOWN_FRAMES * 5
		elif(not parry_cooldown > 0):
			parry_frames = PARRY_ACTIVE_FRAMES
			
		
	label.text = str(parry_frames)
	
func _physics_process(delta: float) -> void:
	if(parry_frames > 0):
		parry_frames -= 1;
	
	if(parry_cooldown > 0):
		parry_cooldown -= 1;


func _on_body_entered(body: Node2D) -> void:
	if(body != player):
		return
		
	if(not parry_frames > 0):
		return
		
	player.jump()
	parry_frames = 0
	parry_cooldown = PARRY_COOLDOWN_FRAMES
