extends Area2D

const PARRY_FRAMES = 20;

@onready var label: Label = $"../CanvasLayer/Label"
@onready var player: CharacterBody2D = $"../Player"

var touching = false;
var touching_frames = 0;

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta: float) -> void:
	if(touching):
		touching_frames += 1
	else:
		touching_frames = 0
	label.text = str(touching_frames)
		
	if(not touching or not Input.is_action_just_pressed("parry") or touching_frames > PARRY_FRAMES):
		return
		
	player.jump()


func _on_body_entered(body: Node2D) -> void:
	if(body is not CharacterBody2D):
		return
	touching = true
	
func _on_body_exited(body: Node2D) -> void:
	if(body is not CharacterBody2D):
		return
	touching = false
