extends Node2D

func _on_Timer_timeout():
	TransitionScene.startAnimation("res://Scenes/SpaceShip/spaceShip.tscn")

