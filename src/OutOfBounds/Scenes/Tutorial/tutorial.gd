extends Node2D


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Scenes/SpaceShip/spaceShip.tscn")

func _ready():
	$AnimationPlayer.play("wasd")
