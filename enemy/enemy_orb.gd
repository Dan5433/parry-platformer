extends CharacterBody2D


signal hit_player(orb: CharacterBody2D)

const SPEED = 400.0
var player: CharacterBody2D
var parried: bool = false


func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	velocity = (player.position - position).normalized() * SPEED
	hit_player.connect(player.parry_meter.try_parry_enemy_orb)


func _physics_process(delta: float) -> void:
	move_and_slide()
	
	var collision = get_last_slide_collision()
	if not collision:
		return
	
	var collider: Node2D = collision.get_collider()
	if collider.is_in_group("enemy"):
		collider.queue_free()
	
	if collider == player:
		hit_player.emit(self)
		if parried:
			set_collision_mask_value(3, true)
			return
	
	queue_free()



func invert_velocity() -> void:
	velocity = -velocity
