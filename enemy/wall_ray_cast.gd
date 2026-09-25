extends RayCast2D


signal hit

const RAYCAST_LENGTH = 40.0

@onready var body: CharacterBody2D = $".."


func _ready() -> void:
	update_direction()


func _physics_process(delta: float) -> void:
	if not is_colliding():
		return
		
	hit.emit()
	update_direction()


func update_direction() -> void:
	target_position = Vector2(RAYCAST_LENGTH * body.direction, 0)
