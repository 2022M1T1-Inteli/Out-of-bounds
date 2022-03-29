extends CanvasLayer

signal animationStarted
signal animationMiddle
signal animationFinished

func startAnimation():
	$AnimationPlayer.play("transitionSceneAnimation")

func animationStarted():
	$ColorRect.visible = true
	emit_signal("animationStarted")
	
func animationMiddle():
	emit_signal("animationMiddle")
	
func animationFinished():
	emit_signal("animationFinished")
	$ColorRect.visible = false
	
