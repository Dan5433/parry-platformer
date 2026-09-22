extends Area2D

var current_body: CharacterBody2D = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta: float) -> void:
	if(current_body == null or not Input.is_action_just_pressed("parry")):
		return
	current_body.velocity.y = current_body.JUMP_VELOCITY


func _on_body_entered(body: Node2D) -> void:
	if(body is not CharacterBody2D):
		return
	current_body = body
	
func _on_body_exited(body: Node2D) -> void:
	if(body is not CharacterBody2D):
		return
	current_body = null
