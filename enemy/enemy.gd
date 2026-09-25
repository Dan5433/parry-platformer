extends CharacterBody2D


const SPEED = 150.0
const RAYCAST_LENGTH = 75.0

@onready var raycast: RayCast2D = $RayCast2D
var direction: int = -1


func _ready() -> void:
	update_raycast_direction()


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = direction * SPEED
	
	move_and_slide()
	
	if not raycast.is_colliding():
		return
	
	direction *= -1
	update_raycast_direction()


func update_raycast_direction() -> void:
	raycast.target_position = Vector2(RAYCAST_LENGTH * direction, 0)
