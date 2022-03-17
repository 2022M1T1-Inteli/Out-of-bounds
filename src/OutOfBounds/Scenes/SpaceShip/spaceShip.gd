extends Node2D

func _on_SpaceShipDoor_body_entered(body):
	get_tree().change_scene("res://Scenes/Desert/desert.tscn")
