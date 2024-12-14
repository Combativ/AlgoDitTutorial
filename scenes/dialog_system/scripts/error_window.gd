extends ReferenceRect
class_name ErrorWindow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##returns this ErrorWindow's text
func get_text() -> String:
	return $ColorRect/Label.text

##sets the text of this ErrorWindow to the transferred one
func set_text(new_text: String) -> void:
	$ColorRect/Label.text = new_text

##sets this ErrorWindow's text to none
func clear() -> void:
	set_text("")

##this ErrorWindow shows up
##shows the error_text in this ErrorWindow for the transferred time 
##this ErrorWindow hides
func show_error(error_text: String, time: float) -> void:
	set_text(error_text)
	self.show()
	await get_tree().create_timer(time).timeout
	self.hide()
