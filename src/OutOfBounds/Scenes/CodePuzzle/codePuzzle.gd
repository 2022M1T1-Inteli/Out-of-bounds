extends Node2D

var simulacao = false
var white = Color(255, 255, 255)
var black = Color(0, 0, 0)
var red = Color(1, 0, 0)
var green = Color(0, 1, 0)
var cursor = 1
var lengthBox = 0
var currentType = null
var correctCode = ["1A", "2B", "3C", "4D", "5E"]
var contador = 0

func _process(delta):
	if cursor >= 5 and lengthBox >= 2:
		$ColorRect/NinePatchRect/Verify.disabled = false
	else:
		$ColorRect/NinePatchRect/Verify.disabled = true


func write_label(content):
	if content != null:
		if typeof(content) == TYPE_STRING and currentType == TYPE_STRING:
			return
		elif typeof(content) == TYPE_INT and currentType == TYPE_INT:
			return
	if lengthBox >= 2:
		cursor += 1
		lengthBox = 0
	if cursor > 5:
		return
	if cursor == 0:
		cursor = 1
	get_node("ColorRect/NinePatchRect/Cor%d/Conjunto%d" % [cursor, cursor]).text += str(content)
	get_node("ColorRect/NinePatchRect/Button" + str(content)).disabled = true 
	lengthBox += 1
	currentType = typeof(content)
	content = null


func _on_Verify_pressed():
	cursor = 0
	lengthBox = 0
	var finished = true
	for idx in range(1, 6):
		var elementLabel = get_node("ColorRect/NinePatchRect/Cor%d/Conjunto%d" % [idx, idx])
		var colorReact = get_node("ColorRect/NinePatchRect/Cor%d" % [idx])
		if elementLabel.text == correctCode[idx-1]:
			colorReact.color = green
		else:
			colorReact.color = red
			finished = false
		for item in [1, 2, 3, 4, 5, "A", "B", "C", "D", "E"]:
			get_node("ColorRect/NinePatchRect/Button" + str(item)).disabled = true
	if finished == false:
		$Timer.start()
		
		


func _on_Button1_pressed():
	write_label(1)
	
func _on_Button2_pressed():
	write_label(2)
	
func _on_Button3_pressed():
	write_label(3)
	
func _on_Button4_pressed():
	write_label(4)
	
func _on_Button5_pressed():
	write_label(5)
	
func _on_A_pressed():
	write_label("A")
	
func _on_B_pressed():
	write_label("B")
	
func _on_C_pressed():
	write_label("C")
	
func _on_D_pressed():
	write_label("D")
	

func _on_E_pressed():
	write_label("E")
	
	
func _on_Timer_timeout():
	for item in [1, 2, 3, 4, 5, "A", "B", "C", "D", "E"]:
		get_node("ColorRect/NinePatchRect/Button" + str(item)).disabled = false
	for idx in range(1, 6):
		var colorChange = get_node("ColorRect/NinePatchRect/Cor%d" % [idx])
		get_node("ColorRect/NinePatchRect/Cor%d/Conjunto%d" % [idx, idx]).text = ""
		colorChange.color= black
		
	print("corno")
