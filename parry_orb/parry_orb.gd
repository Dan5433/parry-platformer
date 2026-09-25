extends Area2D


@onready var player: CharacterBody2D = $"../Player"
@onready var parry_meter: TextureProgressBar = $"../Player/ParryMeter"


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body != player:
		return
		
	parry_meter.parry_orb()
