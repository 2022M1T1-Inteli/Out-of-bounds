extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartBtn_pressed() -> void:
	get_tree().change_scene("res://Scenes/World/World.tscn")
	


func _on_Credito_pressed() -> void:
	get_tree().change_scene("res://Scenes/Creditos/Creditos.tscn")
	
	


func _on_QuitBtn_pressed():
	get_tree().quit()
