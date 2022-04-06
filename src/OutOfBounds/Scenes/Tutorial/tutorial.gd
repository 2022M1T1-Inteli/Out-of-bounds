extends Node2D

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("wasd")
	TransitionScene.startAnimation()
	Global.tutorialFinished = true

func _ready():
	Global.overlayVisibility = false
	TransitionScene.connect("animationMiddle", self, "onChangeSceneAnimationMiddle")
	
func onChangeSceneAnimationMiddle():
	get_tree().change_scene("res://Scenes/FallingCutScene/fallingCutScene.tscn")

# Botão de Start
func _on_StartBtn_pressed() -> void:
	TransitionScene.startAnimation()
