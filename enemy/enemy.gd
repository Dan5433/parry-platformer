extends CharacterBody2D


const SPEED = 150.0
const ORB_COOLDOWN = 1.0

@export var orb: PackedScene
@onready var player_raycast: RayCast2D = $PlayerRayCast
@onready var wall_raycast: RayCast2D = $WallRayCast
@onready var sprite: Sprite2D = $Sprite2D
var direction: int = 1
var orb_cooldown: float


func _ready() -> void:
	player_raycast.sees_player.connect(launch_orb)
	wall_raycast.hit.connect(change_direction)


func _physics_process(delta: float) -> void:
	orb_cooldown -= delta
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = direction * SPEED
	
	move_and_slide()


func change_direction() -> void:
	direction *= -1
	sprite.flip_h = false if direction == 1 else true


func launch_orb() -> void:
	if(orb_cooldown > 0):
		return
	
	var orb_copy: CharacterBody2D = orb.instantiate()
	orb_copy.global_position = global_position
	add_sibling(orb_copy)
		
	orb_cooldown = ORB_COOLDOWN
