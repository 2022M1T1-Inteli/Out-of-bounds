# Arquivo para a classe Dialog
var path: String
var active: bool
var completed: bool

# Class Constructor
func _init(_path = "", _active = false, _completed = false):
	self.path = _path
	self.active = _active
	self.completed = _completed

class_name Dialog
