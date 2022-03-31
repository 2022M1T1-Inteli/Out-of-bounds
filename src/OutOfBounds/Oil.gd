extends NinePatchRect

var isNear = false
var arrayScore = []

func _on_Area2D_Oil_body_entered(body):
	isNear = true
	if isNear == true:
		if Input.is_action_pressed("interact"):
			queue_free()
			arrayScore.append(1)
			Score._score(arrayScore.size())


func _on_Area2D_Oil_body_exited(body):
	isNear = false
