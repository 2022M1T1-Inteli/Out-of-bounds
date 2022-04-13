extends ColorRect

var timerEnded = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and timerEnded:
		TransitionScene.startAnimation("res://Scenes/HomeScreen/homeScreen.tscn")

func _on_Timer_timeout():
	timerEnded = true
	$Key.visible = true
