extends RayCast2D


signal sees_player

@export var visibility_range: float = 500.0
var player: CharacterBody2D


func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	var target = to_local(player.global_position)
	target = target.limit_length(visibility_range)
	target_position = target
	
	if is_colliding() and get_collider() == player:
		sees_player.emit()
