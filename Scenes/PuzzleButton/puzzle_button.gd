extends Area2D

@export var is_single_use: bool = false

signal pressed
signal unpressed

var items_present: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.s


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable") or body is Player:
		items_present += 1
		if items_present == 1:
			pressed.emit()
			$AnimatedSprite2D.play("pressed")


func _on_body_exited(body: Node2D) -> void:
	if is_single_use:
		return
	
	if body.is_in_group("pushable") or body is Player:
		items_present -= 1
		if items_present <= 0:
			unpressed.emit()
			$AnimatedSprite2D.play("unpressed")
