# Classe da fase
var name: String
var active: bool
var completed: bool
var dialogs: Array

# Class Constructor
func _init(_name = "", _active = false, _completed = false, _dialogs = []):
	self.name = _name
	self.active = _active
	self.completed = _completed
	self.dialogs = _dialogs
	
class_name Phase
	
