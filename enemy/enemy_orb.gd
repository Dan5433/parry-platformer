extends CharacterBody2D


const SPEED = 400.0


func _ready() -> void:
	var player: Node2D = get_tree().get_first_node_in_group("player")
	velocity = (player.position - position).normalized() * SPEED


func _physics_process(delta: float) -> void:
	move_and_slide()
