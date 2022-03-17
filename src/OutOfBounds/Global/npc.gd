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
						$Key.visible = true

func onNpcBodyExited(body):
	if body.name == "Player":
		$Key.visible = false
		isNear = false

func _input(event):
	if Input.is_action_pressed("interact") and isNear == true and canInteract == true:
		$Key.visible = false
		
		for phase in Global.phases:
			for dialog in phase:
				if dialog.path == dialogPath:
					dialog.active = true
					var dialogScene = dialogPreload.instance()
					dialogScene.set("dialogPath", dialogPath)
					dialogScene.set("textSpeed", textSpeed)
					
					var canvasLayer = CanvasLayer.new()
					canvasLayer.name = "CanvasLayer"
					
					get_parent().get_node("/root").add_child(canvasLayer)
					get_parent().get_node("/root/CanvasLayer").add_child(dialogScene)
					get_tree().paused = true
					canInteract = false
		
		

		


