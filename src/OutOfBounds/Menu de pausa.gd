extends CanvasLayer

func _ready() -> void:
	mostrar(false) 
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		mostrar(!get_tree().paused)
		get_tree().paused = !get_tree().paused 
		
		


func mostrar(is_visible):
	for node in get_children():
		node.visible = is_visible 


func _on_Continuar_Btn_pressed() -> void:
	mostrar(false)
	get_tree().paused = false



func _on_VoltarBnt_pressed() -> void:
	get_tree().change_scene("res://Tela inicial Do Rpg2/Tela Inicial 1.tscn")
	
