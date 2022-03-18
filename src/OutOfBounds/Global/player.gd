# Classe do Player
var name: String
var scene: String
var positionX: float
var positionY: float

# Class Constructor
func _init(_name = "", _scene = "", _positionX = 0.00, _positionY = 0.00):
	self.name = _name
	self.scene = _scene
	self.positionX = _positionX
	self.positionY = _positionY

class_name Player
