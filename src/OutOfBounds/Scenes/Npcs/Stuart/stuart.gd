extends "res://Global/npc.gd"

func _ready():
	dialogPath = Global.phases[0][0].path
	

func _on_Node2D_body_entered(body):
	onNpcBodyEntered(body)

func _on_Node2D_body_exited(body):
	onNpcBodyExited(body)
	
	
