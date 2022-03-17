var name: String
var active: bool
var completed: bool
var dialogs: Array

# Class Constructor
func _init(name = "", active = false, completed = false, dialogs = []):
	self.name = name
	self.active = active
	self.completed = completed
	self.dialogs = dialogs
	
class_name Phase
	
