extends CanvasLayer

func _process(delta):
	if Global.phase1DialogIndex > 0:
		$MapContainer.visible = Global.overlayVisibility

# Mostrar mapa
func _on_MapButton_pressed():
	$MapContainer/Background.visible = true

# Esconder mapa
func _on_CloseButton_pressed():
	$MapContainer/Background.visible = false
