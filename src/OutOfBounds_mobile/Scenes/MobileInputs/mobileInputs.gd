extends CanvasLayer

signal use_move_vector
signal move_vector_zero

var joystick_active = false

func _input(event):
	if event is InputEventScreenDrag:
		if $TouchScreenButton.is_pressed():
			var move_vector = calculate_move_vector(event.position)
			emit_signal("use_move_vector", move_vector)
			joystick_active = true
			$JoystickInner.visible = true
			$JoystickInner.position = event.position
	if event is InputEventScreenTouch:
		if event.pressed == false:
			joystick_active == false
			$JoystickInner.visible = false

func calculate_move_vector(x):
	var texture_center = $TouchScreenButton.position + Vector2(30, 30)
	return (x - texture_center).normalized()

func _on_TouchScreenButton_released():
	emit_signal("move_vector_zero")
