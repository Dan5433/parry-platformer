extends Area2D

const PARRY_ACTIVE_FRAMES = 4;

@onready var label_2: Label = $"../Player/Label"
@onready var player: CharacterBody2D = $"../Player"

var parry_frames = 0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(delta:float) -> void:
	if(Input.is_action_just_pressed("parry")):
		parry_frames = PARRY_ACTIVE_FRAMES
		
	label_2.text = str(parry_frames)
	
func _physics_process(delta: float) -> void:
	if(parry_frames > 0):
		parry_frames -= 1;


func _on_body_entered(body: Node2D) -> void:
	if(body != player):
		return
		
	if(parry_frames > 0):
		player.jump()
		parry_frames = 0
