extends Node2D

##returns the text of the text box
func get_text() -> String:
	return $Text_box_img/MarginContainer/Text_box_text.text

##sets the text of the text box to the transferred text
func set_text(text: String) -> void:
	$Text_box_img/MarginContainer/Text_box_text.text = text
