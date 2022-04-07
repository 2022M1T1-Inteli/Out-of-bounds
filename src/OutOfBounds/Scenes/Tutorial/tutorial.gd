extends Node2D

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("wasd")
	TransitionScene.startAnimation("res://Scenes/FallingCutScene/fallingCutScene.tscn")
	Global.tutorialFinished = true

func _ready():
	Global.overlayVisibility = false

