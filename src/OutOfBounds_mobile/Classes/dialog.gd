# Arquivo para a classe Dialog
var path: String
var active: bool
var completed: bool
var objective: String

# Class Constructor
func _init(_path = "", _active = false, _completed = false, _objective = ""):
	self.path = _path
	self.active = _active
	self.completed = _completed
	self.objective = _objective

class_name Dialog
