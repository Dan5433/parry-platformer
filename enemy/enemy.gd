extends CharacterBody2D


const SPEED = 150.0

@onready var player_raycast: RayCast2D = $PlayerRayCast
@onready var wall_raycast: RayCast2D = $WallRayCast
var direction: int = -1


func _ready() -> void:
	player_raycast.sees_player.connect(launch_orb)
	wall_raycast.hit.connect(change_direction)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = direction * SPEED
	
	move_and_slide()


func change_direction() -> void:
	direction *= -1


func launch_orb() -> void:
	print("launch orb")
