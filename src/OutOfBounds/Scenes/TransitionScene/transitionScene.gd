extends CanvasLayer

signal animationStarted
signal animationMiddle
signal animationFinished

var nextScene = ""
var wasOverlayActive = false

func startAnimation(scenePath):
	$AnimationPlayer.play("transitionSceneAnimation")
	nextScene = scenePath

func animationStarted():
#	if Global.overlayVisibility:
#		wasOverlayActive = true
#		Global.overlayVisibility = false
		
	$ColorRect.visible = true
	emit_signal("animationStarted")
	
func animationMiddle():
	emit_signal("animationMiddle")
	get_tree().change_scene(nextScene)
	
func animationFinished():
#	if !Global.overlayVisibility and wasOverlayActive and Global.objectiveLabel != "":
#		wasOverlayActive = false
#		Global.overlayVisibility = true
	
	emit_signal("animationFinished")
	$ColorRect.visible = false
