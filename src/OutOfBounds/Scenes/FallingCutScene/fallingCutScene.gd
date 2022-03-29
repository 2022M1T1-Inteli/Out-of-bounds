extends Node2D

func _on_Timer_timeout():
	TransitionScene.startAnimation()
	
func _ready():
	TransitionScene.connect("animationMiddle", self, "onChangeSceneAnimationMiddle")

func onChangeSceneAnimationMiddle():
	if get_tree().change_scene("res://Scenes/SpaceShip/spaceShip.tscn")  != OK:
		print("Erro mudando de cena")
