extends StaticBody2D

var can_interact: bool = false

@export var dialogue_lines: Array[String] = ["hello, world", "it is a nice day", "and goodbye!"]
var dialogue_index: int = 0

func _ready() -> void:
	

	print(dialogue_lines[dialogue_index])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		if dialogue_index < dialogue_lines.size():
			$DialogBox.visible = true
			get_tree().paused = true
			
			$DialogBox/DialogLabel.text = dialogue_lines[dialogue_index]
			dialogue_index += 1
			
		else:
			$DialogBox.visible = false
			get_tree().paused = false
			dialogue_index = 0
			
