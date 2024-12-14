extends VBoxContainer
class_name TaskWindow

var task_hidden: bool = true
var button_pressed: bool = false

@onready var button: Button = $Button
@onready var task: RichTextLabel = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.button_down.connect(func(): button_pressed = not button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (task_hidden and (button.is_hovered() or button_pressed)):
		task.show()
		task_hidden = false
	elif(not task_hidden and not button.is_hovered() and not button_pressed):
		task.hide()
		task_hidden = true
	pass
