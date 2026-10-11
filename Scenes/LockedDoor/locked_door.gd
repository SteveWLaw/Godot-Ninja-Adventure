extends StaticBody2D

signal door_visibility_changed(is_visible: bool)

@export var buttons_needed: int = 1
var buttons_pressed: int = 0

func _on_puzzle_button_pressed() -> void:
	buttons_pressed += 1
	
	if buttons_pressed >= buttons_needed:
		$CollisionShape2D.set_deferred("disabled", true)
		visible = false
		door_visibility_changed.emit(false)


func _on_puzzle_button_unpressed() -> void:
	buttons_pressed -= 1
		
	if buttons_pressed < buttons_needed:
		$CollisionShape2D.set_deferred("disabled", false)
		visible = true
		door_visibility_changed.emit(true)
