extends Label


const REVEAL_SPEED = 0.5

@onready var player: CharacterBody2D = $"../../Player"


func _ready() -> void:
	player.death.connect(enable)


func _process(delta: float) -> void:
	visible_ratio += delta * REVEAL_SPEED


func enable() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
