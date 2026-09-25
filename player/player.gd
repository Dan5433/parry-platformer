extends CharacterBody2D


signal death

const SPEED = 400.0
const JUMP_VELOCITY = -750.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var parry_meter: TextureProgressBar = $ParryMeter


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI acti1ons with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			sprite.flip_h = false
		if direction < 0:
			sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func jump() -> void:
	velocity.y = JUMP_VELOCITY


func die() -> void:
	get_tree().paused = true
	parry_meter.freeze_frame_timer.queue_free()
	death.emit()
