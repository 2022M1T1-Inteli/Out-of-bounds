extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	var animationPlayer = $AnimationPlayer
	var animationTree = $AnimationTree
	var animationState = animationTree.get("parameters/playback")
	animationTree.active = true
	animationState.travel("Drop")


func _on_ColectDetector_area_entered(area):
	animationState.travel("Colect")
	 # Replace with function body.
