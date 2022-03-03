extends CanvasLayer

func _ready(): 
	showPauseMenu(false) 
	
func _input(event):
	if event.is_action_pressed("ui_cancel"): 
		showPauseMenu(!get_tree().paused) 
		get_tree().paused = !get_tree().paused #sistema de liga e desliga para o jogo 

func showPauseMenu(is_visible): #is_visible é um parâmetro próprio do Godot
	for node in get_children(): 
		node.visible = is_visible


func _on_ResumeBtn_pressed():
	showPauseMenu(false)
	get_tree().paused = false 


func _on_QuitBtn_pressed():
	get_tree().change_scene("res://Scenes/HomeScreen/HomeScreen.tscn")
	showPauseMenu(false)
	get_tree().paused = false 
