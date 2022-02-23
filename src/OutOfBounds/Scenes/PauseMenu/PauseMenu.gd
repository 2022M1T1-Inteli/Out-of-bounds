extends Control 

var isPaused = false setget setIsPaused 

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"): 
		self.isPaused = !isPaused

func setIsPaused(value):
	isPaused = value 
	get_tree().paused = isPaused 
	visible = isPaused

func _on_ResumeBtn_pressed():
	self.isPaused = false 


func _on_QuitBtn_pressed():
	get_tree().quit() 
