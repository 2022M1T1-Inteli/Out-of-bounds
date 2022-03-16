extends Area2D

var canInteract = false
const dialogPreload = preload("res://Scenes/DialogBox/dialogBox.tscn")

export var dialogPath = "res://Scenes/DialogBox/dialogChapter1.json" # Variável de caminho até arquivo JSON onde as falas se encontram
export(float) var textSpeed = 0.05 # Velocidade do texto

signal onDialogStart
signal onDialogExited

func _physics_process(delta):
	pass

func _on_Npc_body_entered(body):
	
	if body.name == "Player":
		$Label.visible = true
		canInteract = true


func _on_Npc_body_exited(body):
	if body.name == "Player":
		$Label.visible = false
		canInteract = false

func _input(event):
	if Input.is_action_pressed("interact") and canInteract == true:
		$Label.visible = false
		
		emit_signal("onDialogStart")
		
		
		var dialog = dialogPreload.instance()
		dialog.set("dialogPath", dialogPath)
		dialog.set("textSpeed", textSpeed)
		
		get_parent().get_node("/root/world/YSort/Player/CanvasLayer").add_child(dialog)
		
		var dialogBoxNode = get_tree().get_root().find_node("DialogBox",true,false) 
		dialogBoxNode.connect("onDialogFinish",self,"onDialogFinish") # Conectar Signal com função para retornar a movimentação do jogador
		
func onDialogFinish():
	emit_signal("onDialogExited")
