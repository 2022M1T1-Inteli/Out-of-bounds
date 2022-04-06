extends CanvasLayer

func _ready():
	$NinePatchRect.visible = false
	
	# Conectar sinal de mudança de diálogo à função
	Global.connect("dialogChange", self, "onDialogChange")
	
func _process(delta):
	$NinePatchRect/Label.text = Global.objectiveLabel
	$NinePatchRect.visible = Global.overlayVisibility

func onDialogChange():
	Global.overlayVisibility = true
	
	# Loop em estado global do jogo para setar texto do Label
	for phase in Global.phases:
		
		var invertedDialogs = phase.dialogs.duplicate()
		invertedDialogs.invert()
		
		for dialog in invertedDialogs:
			if dialog.completed:
				if dialog.objective:
					Global.objectiveLabel = dialog.objective
					Global.overlayVisibility = true
				break
	
