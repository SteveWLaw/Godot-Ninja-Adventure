extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


func open():
	visible = true


func close():
	visible = false
