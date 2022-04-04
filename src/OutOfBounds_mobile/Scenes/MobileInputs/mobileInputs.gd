extends CanvasLayer

signal use_move_vector
signal move_vector_zero
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
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
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_released():
	emit_signal("move_vector_zero")
