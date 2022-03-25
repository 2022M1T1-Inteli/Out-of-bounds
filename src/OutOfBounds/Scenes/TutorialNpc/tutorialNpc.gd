extends "res://Classes/npc.gd"

func _ready():
	# Setar o caminho do primeiro diálogo desse NPC 
	dialogPath = Global.tutorialDialogPath

# Função executada quando o Player chega perto do NPC
func _on_Area2D_body_entered(body):
	onNpcBodyEntered(body)

# Função executada quando o Player sai de perto do NPC
func _on_Area2D_body_exited(body):
	onNpcBodyExited(body)
	
