extends Sprite2D


@export var animation_speed: float = 1
var anim_direction = 1
var anim_timer = 0


func _process(delta: float) -> void:
	anim_timer -= delta
	
	if(anim_timer > 0):
		return
	
	anim_timer = animation_speed
	
	frame += anim_direction
	if frame == 0:
		anim_direction = 1
	if frame == hframes -1:
		anim_direction = -1
