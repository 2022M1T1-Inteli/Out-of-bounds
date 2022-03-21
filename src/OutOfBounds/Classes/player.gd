# Classe do Player
var name: String
var scene: String
var position
var startPosition

# Class Constructor
func _init(_name = "", _scene = "", _position = null, _startPosition = null):
	self.name = _name
	self.scene = _scene
	self.position = _position
	self.startPosition = _startPosition

class_name Player
