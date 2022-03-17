extends Area2D

#class_name Npc

var canInteract = false
var isNear = false
const dialogPreload = preload("res://Scenes/DialogBox/dialogBox.tscn")

var dialogPath: String  # Variável de caminho até arquivo JSON onde as falas se encontram
export(float) var textSpeed = 0.05 # Velocidade do texto

func onNpcBodyEntered(body):
	if body.name == "Player":
		isNear = true
		for phase in Global.phases:
			for dialog in phase:
				if dialog.path == dialogPath:
					if dialog.active == false && dialog.completed == false:
						canInteract = true
						$Label.visible = true

func onNpcBodyExited(body):
	if body.name == "Player":
		$Label.visible = false
		isNear = false

func _input(event):
	if Input.is_action_pressed("interact") and isNear == true and canInteract == true:
		$Label.visible = false
		
		for phase in Global.phases:
			for dialog in phase:
				if dialog.path == dialogPath:
					dialog.active = true
					var dialogScene = dialogPreload.instance()
					dialogScene.set("dialogPath", dialogPath)
					dialogScene.set("textSpeed", textSpeed)
					get_parent().get_node("/root/world/CanvasLayer").add_child(dialogScene)
					get_tree().paused = true
					canInteract = false
		
		

		


