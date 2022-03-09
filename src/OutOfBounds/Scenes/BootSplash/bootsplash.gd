extends TextureRect

var next_level = preload("res://Scenes/HomeScreen/homeScreen.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	if get_tree().change_scene_to(next_level) != OK:
		print("erro mudando de cena")
