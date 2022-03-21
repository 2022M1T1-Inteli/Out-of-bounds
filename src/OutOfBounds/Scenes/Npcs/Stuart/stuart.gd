extends "res://Classes/npc.gd"

func _ready():
	# Setar o caminho do primeiro diálogo desse NPC 
	dialogPath = Global.phases[0].dialogs[0].path

# Função executada quando o Player chega perto do NPC
func _on_Node2D_body_entered(body):
	onNpcBodyEntered(body)

# Função executada quando o Player sai de perto do NPC
func _on_Node2D_body_exited(body):
	onNpcBodyExited(body)
	
